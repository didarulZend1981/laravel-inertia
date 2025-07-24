


<template>
     <h4>Billed To</h4>
                        <div class="shadow-sm h-100 bg-white rounded-3 p-3 mt-4">
                            <div class="row">
                                <div class="col-8">
                                    <span class="text-bold text-dark">BILLED TO</span>
                                    <p class="text-xs mx-0 my-1">Name: <span>{{ selectedCustomer?.name }}</span></p>
                                    <p class="text-xs mx-0 my-1">Email: <span>{{ selectedCustomer?.email }}</span></p>
                                    <p class="text-xs mx-0 my-1">User ID: <span>{{ selectedCustomer?.id }}</span></p>
                                </div>
                                <div class="col-4">
                                    <p class="text-bold mx-0 my-1 text-dark">Invoice</p>
                                    <p class="text-xs mx-0 my-1">Date: {{ new Date().toISOString().slice(0,10) }}</p>
                                </div>
                            </div>

                            <hr class="mx-0 my-2 p-0 bg-secondary"/>
                            <div class="row">
                                <div class="col-12">
                                    <table class="table w-100">
                                        <thead>
                                            <tr class="text-xs">
                                                <th>Name</th>
                                                <th>Qty</th>
                                                <th>Total</th>
                                                <th>Remove</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-if="selectedProduct.length > 0"
                                                v-for="(product, index) in selectedProduct" :key="index"
                                                class="text-center">
                                                <td> {{ product.name }} </td>
                                                <td> {{ product.unit }}</td>
                                                <td> {{ product.price*product.unit }}</td>
                                                <td>
                                                    <button @click="removeQty(product.id)" class="">-</button>
                                                    <button @click="addQty(product.id)" class="">+</button>
                                                    <button @click="removeProductFromSale(index)" class="btn btn-danger btn-sm">Remove</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <hr class="mx-0 my-2 p-0 bg-secondary"/>
                            <div class="row">
                                <div class="col-12">
                                    <p class="text-bold text-xs my-1 text-dark">Total: <i class="bi bi-currency-dollar"></i> {{ calculateTotal() }}</p>
                                    <p class="text-bold text-xs my-1 text-dark">VAT (5%): <i class="bi bi-currency-dollar"></i> {{ vatAmount }}</p>
                                    <p>
                                        <button @click="applyVat" class="btn btn-info btn-sm my-1 bg-gradient-primary w-40">Apply VAT</button>
                                    </p>
                                      <p><button @click="removeVat" class="btn btn-secondary btn-sm my-1 bg-gradient-primary w-40">Remove VAT</button></p>

                                    <p><span class="text-xxs">Discount Mode:</span></p>
                                    <select v-model="usePercentageDiscount">
                                        <option :value="false">Flat Discount</option>
                                        <option :value="true">Percentage Discount</option>
                                    </select>

                                    <p class="text-bold text-xs my-1 text-dark">Discount: <i class="bi bi-currency-dollar"></i> {{ discountAmount }} </p>

                                    <div v-if="!usePercentageDiscount">
                                        <span class="text-xxs">Flat Discount:</span>
                                        <input v-model="flatDiscount" type="number" class="form-control w-40" min="0" />
                                        <p>
                                            <button @click="applyDiscount" class="btn btn-warning btn-sm my-1 bg-gradient-primary w-40">Apply Flat Discount</button>
                                        </p>
                                    </div>

                                    <div v-else>
                                        <span class="text-xxs">Discount (%):</span>
                                        <input v-model="discountPercent" type="number" class="form-control w-40" min="0" max="100" step="0.25" />
                                        <p><button @click="applyDiscount" class="btn btn-warning btn-sm my-1 bg-gradient-primary w-40" >Apply Percentage Discount</button></p>
                                    </div>

                                    <p><button @click="removeDiscount" class="btn btn-secondary btn-sm my-1 bg-gradient-primary w-40">Remove Discount</button></p>

                                    <hr class="mx-0 my-2 p-0 bg-secondary"/>
                                    <p class="text-bold text-xs my-1 text-dark">Payable: <i class="bi bi-currency-dollar"></i> {{ payable }}</p>
                                    <p><button @click="createInvoice" class="btn btn-success btn-sm my-3 bg-gradient-primary w-40">Confirm</button></p>

                                </div>
                            </div>


                        </div>
</template>

<script setup>
import { useBill } from '../logic/useBill';
import { useCustomer } from '../logic/useCustomer';
import { useProduct } from '../logic/useProduct';


const { selectedCustomer } = useCustomer();
const { selectedProduct } = useProduct();

    const {
        calculateTotal,
        addQty,
        removeQty,
        removeProductFromSale,
        vatAmount,
        applyVat,
        removeVat,
        applyDiscount,
        usePercentageDiscount,
        removeDiscount,
        payable,

        discountAmount,
        discountPercent,
        flatDiscount,
        createInvoice,




    } = useBill(selectedProduct, selectedCustomer);






</script>
