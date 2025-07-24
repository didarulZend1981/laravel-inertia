<template>
  <div>
    <h4>Select Customer</h4>
                        <input
                            placeholder="Search..."
                            class="form-control mb-2 w-auto form-control-sm"
                            type="text" v-model="searchCustomerValue"
                        />
                        <EasyDataTable
                            buttons-pagination
                            alternating
                            :headers="CustomerHeader"
                            :items="CustomerItem"
                            :rows-per-page="10"
                            :search-field="searchCustomerField"
                            :search-value="searchCustomerValue"
                            show-index
                        >
                            <template #item-number="{ id, name, email }">
                                <button @click="addCustomerToSale({ id, name, email })" class="btn btn-success btn-sm">Add</button>
                            </template>
                        </EasyDataTable>
                        <p>

                        </p>
   </div>
</template>

<script setup>
 import {useCustomer} from "../logic/useCustomer"


const {
   CustomerHeader,
    CustomerItem,
    addCustomerToSale,
    searchCustomerField,
    searchCustomerValue,
    selectedCustomer,
} = useCustomer();


</script>
