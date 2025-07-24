<template>
  <div>
    <h4>Select Product</h4>
                        <input
                            placeholder="Search..."
                            class="form-control mb-2 w-auto form-control-sm"
                            type="text" v-model="searchProductValue"
                        />
                        <EasyDataTable
                            buttons-pagination
                            alternating
                            :headers="ProductHeader"
                            :items="ProductItem"
                            :rows-per-page="10"
                            :search-field="searchProductField"
                            :search-value="searchProductValue"
                            show-index
                        >
                            <template #item-image="{image}">
                                <img :src="image" alt="Product Image" height="auto" width="40px"/>
                            </template>

                            <template #item-action="{id, image,name, price, unit}">
                                <button :class="['btn btn-sm', unit > 0 ? 'btn-success' : 'btn-danger']"
                                    :disabled="unit <= 0"
                                    @click="addProductToSale(id, image, name, price, unit)"
                                    >
                                    {{ unit > 0 ? 'Add' : 'Stock Out' }}
                                </button>
                            </template>
                        </EasyDataTable>
                        <p>

                        </p>
   </div>
</template>

<script setup>
 import {useProduct} from "../logic/useProduct"

const {
    ProductHeader,
    ProductItem,
    addProductToSale,
    searchProductField,
    searchProductValue,
    selectedProduct,
} = useProduct();

</script>

