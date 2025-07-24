import { usePage } from '@inertiajs/vue3'
import { ref } from "vue";

const selectedProduct = ref([]);
const ProductItem = ref([]);

export function useProduct() {

    let page = usePage()




//customer
const ProductHeader = [
    { text: "Image", value: "image" },
    { text: "Name", value: "name" },
    { text: "QTY", value: "unit" },
    { text: "Action", value: "action" },
];



if (ProductItem.value.length === 0 && page.props.products) {
        ProductItem.value = page.props.products
    }

const addProductToSale = (id, image, name, price, productUnit)=>{
    const existingProduct = selectedProduct.value.find(product => product.id === id);
    if(existingProduct){
        if(existingProduct.existingQty > 0){
            existingProduct.unit++;
            existingProduct.existingQty--;
        }else{
            toaster.warning(`Product ${name} is out of stock`);
        }
    }else{
        if(productUnit > 0){
            const product = {
                id: id,
                image: image,
                name: name,
                price: price,
                unit: 1,
                existingQty: productUnit-1
            };
            selectedProduct.value.push(product);
            calculateTotal();
        }else{
            toaster.warning(`Product ${name} is out of stock`);
        }
    }
}
const searchProductField = ref('name');
const searchProductValue = ref();





  return {
    ProductHeader,
    ProductItem,
    addProductToSale,
    searchProductField,
    searchProductValue,
    selectedProduct,

  };
}
