import { ref, watch } from 'vue';
import { useForm, router, usePage } from '@inertiajs/vue3';
import { createToaster } from '@meforma/vue-toaster';



export function useBill(selectedProduct, selectedCustomer) {

    const vatRate = ref(5);
    const flatDiscount = ref(0);
    const discountPercent = ref(0);
    const vatAmount = ref(0);
    const discountAmount = ref(0);
    const usePercentageDiscount = ref(false);
    const payable = ref(0);
    const page = usePage();
    const toaster = createToaster();

    const calculateTotal = () =>{
    return selectedProduct.value.reduce((sum, product) => sum + product.price * product.unit, 0);
    };

    const applyVat = ()=>{
        vatAmount.value = (calculateTotal() * vatRate.value) / 100;
        calculateTotal();
    }

//Start Billed to
const addQty = (id)=>{
    const product = selectedProduct.value.find(product => product.id === id);
    if(product.existingQty > 0){
        product.unit++;
        product.existingQty--;
        calculateTotal();

    }else{
        toaster.warning(`Product ${product.name} is out of stock`);
    }
}

const removeQty = (id)=>{
    const product = selectedProduct.value.find(product => product.id === id);
    if(product.unit > 1){
        product.existingQty++;
        product.unit--;
        calculateTotal();
    }
};//end addQty

const removeProductFromSale = (index)=>{
    selectedProduct.value.splice(index,1);
    calculateTotal();
    calculatePayable();
    removeVat();
    removeDiscount();
    toaster.success('Product removed from sale');
}
const removeVat = ()=>{
    vatAmount.value = 0;
    calculateTotal();
}

const applyDiscount = () =>{
    if(usePercentageDiscount.value){
        discountAmount.value = (calculateTotal() * discountPercent.value) / 100;
    }else{
        discountAmount.value = flatDiscount.value;
    }
    calculatePayable();
}//end method

const removeDiscount = ()=>{
    discountAmount.value = 0;
    flatDiscount.value = 0;
    discountPercent.value = 0;
    calculatePayable();
}//end method

const calculatePayable = () =>{
    const totalAmount = calculateTotal();
    payable.value = totalAmount + vatAmount.value - discountAmount.value;
}//end method

watch(
  [selectedProduct, vatAmount, discountAmount],
  () => {
    calculatePayable();
  },
  { deep: true }
);



const form = useForm({
    customer_id: '',
    products: '',
    vat: '',
    discount: '',
    payable: calculateTotal(),
    total: '',
});




const createInvoice = ()=>{
    if(!selectedCustomer.value){
        toaster.warning('Please select a customer');
        return;
    }
    if(selectedProduct.value.length === 0){
        toaster.warning('Please select at least one product');
        return;
    }

    form.customer_id = selectedCustomer.value.id;
    form.products = selectedProduct.value;
    form.total = calculateTotal();
    form.vat = vatAmount.value;
    form.discount = discountAmount.value;
    form.payable = payable.value;

    const calculatedTotal = calculateTotal();
    form.total = calculatedTotal;
    form.payable = payable.value;

    form.post('/invoice-create',{
        onSuccess: ()=>{
            if(page.props.flash.status === true){
                toaster.success(page.props.flash.message);


                // Reset the form and related state
                selectedCustomer.value = null;
                selectedProduct.value = [];
                vatAmount.value = 0;
                discountAmount.value = 0;
                flatDiscount.value = 0;
                discountPercent.value = 0;
                payable.value = 0;
                usePercentageDiscount.value = false;

                form.reset();
                setTimeout(()=>{
                    router.get('/InvoiceListPage');
                },500);
            }else{
                toaster.warning(page.props.flash.message);
            }
        }
    })
};



     return {
        calculateTotal,
        addQty,
        removeQty,
        removeProductFromSale,
        vatAmount,
        applyVat,
        removeVat,
        applyDiscount,
        removeDiscount,
        payable,
        usePercentageDiscount,
        discountAmount,
        discountPercent,
        flatDiscount,
        createInvoice,


  };






}
