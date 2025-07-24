<template>
     <div class="container-fluid">
        <div class="row">
            <!-- Billing Selection -->
            <div class="col-md-4 col-lg-4 p-2">
                <div class="card">
                    <div class="card-body">
                       <BillSection/>

                    </div>
                </div>
            </div>

            <!-- Product Selection -->
            <div class="col-md-4 col-lg-4 p-2">
                <div class="card">
                    <div class="card-body">
                        <ProductSection/>

                    </div>
                </div>
            </div>

            <!-- Customer Selection -->
            <div class="col-md-4 col-lg-4 p-2">
                <div class="card">
                    <div class="card-body">
                        <Customer/>

                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
// import BillSection from './vue/BillSection.vue';
import BillSection from './vue/BillSection.vue';
import Customer from './vue/customer.vue';
import ProductSection from './vue/ProductSection.vue';

</script>
