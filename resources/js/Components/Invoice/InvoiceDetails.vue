<template>
    <div class="modal-backdrop">
        <div class="modal-content modal-lg modal-dialog-centered" style="width: 40%;">
            <div class="modal-header">
                <h5 class="modal-title">Invoice Details</h5>
                <button type="button" class="btn-close" @click="closeModal"></button>
            </div>

            <div class="modal-body">
                <div class="container-fluid">
                    <!-- First Row: Billed To and Invoice Info -->
                    <div class="row">
                        <!-- Billed To Section -->
                        <div class="col-8">
                            <strong>BILLED TO</strong>
                            <p class="mb-1">Name: <span> {{ customer.customer.name }}</span></p>
                            <p class="mb-1">Email: <span> {{ customer.customer.email }} </span></p>
                            <p class="mb-1">Customer ID: <span> {{ customer.customer.id }}</span></p>
                            <p class="mb-1">Phone: <span> {{ customer.customer.mobile }} </span></p>
                        </div>
                        <!-- Invoice Info Section -->
                        <div class="col-4 text-right">
                            <img class="w-40" src="../../Assets/img/logo.svg" alt="Company Logo">
                            <p class="mb-1"><strong>Invoice</strong></p>
                            <p class="mb-1">Date: {{ new Date().toLocaleDateString() }}</p>
                        </div>
                    </div>

                    <hr class="my-2">

                    <!-- Second Row: Invoice Items -->
                    <div class="row">
                        <div class="col-12">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Product Name</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Sale Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(item, index) in customer.invoice_product" :key="index">
                                        <td>{{ item.product.name }}</td>
                                        <td>{{ item.qty }}</td>
                                        <td style="display: flex;justify-content: flex-end;">{{ item.sale_price*item.qty }}/=</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <hr class="my-2">

                    <!-- Third Row: Totals -->
                    <div class="row">
                        <div class="col-12">
                            <p  style="display: flex;justify-content: flex-end;line-height: 5px;"><strong>Total:</strong><span style="width: 100px;text-align: end;" class="totalPrice">{{ customer.total }}/=</span> </p>
                            <p  style="display: flex;justify-content: flex-end;line-height: 5px;"><strong>VAT (5%):</strong><span style="width: 100px;text-align: end;" class="vatPrice">{{ customer.vat }}/=</span> </p>
                            <p  style="display: flex;justify-content: flex-end;line-height: 5px;"><strong>Total With VAT:</strong><span style="width: 100px;text-align: end;"class="withVat"></span> </p>


                            <p  style="display: flex;justify-content: flex-end;line-height: 5px;"><strong>Discount:</strong><span style="width: 100px;text-align: end;">{{ customer.discount }}/=</span> </p>
                             <p style="display: flex;justify-content: flex-end;line-height: 5px;"><strong>Payable:</strong><span style="width: 100px;text-align: end;">{{customer.Payable}}/=</span> </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button class="btn btn-secondary" @click="closeModal" style="margin-right: 5px;">Close</button>
                <button @click="printInvoice" class="btn btn-primary">Print</button>
            </div>
        </div>
    </div>
</template>

<script setup>
import { computed,defineProps, defineEmits,onMounted } from 'vue';





const props = defineProps({
    // customer: Object
    customer: {
    type: Object,
    required: true
  }
})

const total = computed(() => parseFloat(props.customer.total) || 0);
const vat = computed(() => parseFloat(props.customer.vat) || 0);
const totalWithVat = computed(() => (total.value + vat.value).toFixed(2));

 onMounted(() => {
  document.querySelector('.withVat').innerText = totalWithVat.value;
});

const emit = defineEmits(['close'])

const closeModal = () =>{
    emit('close')
}

const printInvoice = () => {
    const printContent = document.querySelector('.modal-body').innerHTML;
    const originalContent = document.body.innerHTML;
    document.body.innerHTML = printContent;
    window.print();
    document.body.innerHTML = originalContent;
    location.reload();
}


</script>

<style scoped>
@page{
    margin: 20mm;
    size:auto;
}
body::before,
body::after {
    display: none;
}
.modal-backdrop {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1500;
    /* Bootstrap modal z-index */
}

.modal-content {
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    width: 80%;
    /* Make the modal larger like Bootstrap's modal-lg */
    max-height: 90vh;
    /* Limit the height of the modal */
    overflow-y: auto;
    /* Enable scrolling inside the modal if content exceeds height */
}

.modal-body {
    max-height: 60vh;
    /* Limit the height of the modal body */
    overflow-y: auto;
    /* Enable scrolling inside the modal body */
}

.w-40 {
    width: 40%;
}

.btn-close {
    background: none;
    border: none;
    font-size: 1.5rem;
}
</style>
