<template>
    <div class="container-fluid">
        <div class="row d-flex justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="float-end">
                            <Link href="/ProductNamePage" class="btn btn-success mx-3 btn-sm">
                                Back
                            </Link>
                        </div>
                        <form @submit.prevent="submit" enctype="multipart/form-data">
                            <div class="card-body">
                                <h4>Product Name</h4>
                                <input id="name" name="name" v-model="form.name" placeholder="Product Name"
                                    class="form-control" type="text" />
                                <br />
                                <input id="type" name="type" v-model="form.type" placeholder="type"
                                    class="form-control" type="text" />
                                <br />

                                <input id="id" name="id" v-model="form.id" placeholder="id"
                                    class="form-control" type="text" text />
                                <br />

                                <!-- Category Dropdown -->
                                <div>
                                    <label for="category">Select Category:</label>
                                    <select v-model="form.category_id" class="form-control" id="category">
                                        <option value="" disabled>Select a category</option>
                                    <option v-for="category in categories" :key="category.id" :value="category.id">{{ category.name }}</option>
                                    </select>
                                </div>
                                <br />
                                <div>
                                    <label for="image">Product Image:</label> <br>
                                    <!-- <input type="file" id="image" @change="handleFileUpload" /> -->
                                    <ProduntNameImageUpload :productImage="form.image" @image="(e)=>form.image = e"/>
                                </div>
                                <br />
                                <button type="submit" class="btn w-100 btn-success">Save Change</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { useForm, usePage, router, Link } from '@inertiajs/vue3'
import { createToaster } from "@meforma/vue-toaster";
const toaster = createToaster();
import { ref } from "vue";

import ProduntNameImageUpload from './ProduntNameImageUpload.vue';



const form = useForm({ name: '', type: '',category_id: '', image: null,id: ''})
const page = usePage()

const categories = ref(page.props.categories)
let URL = "/create-productName";
let list = page.props.product_names;

// console.log("didarul------=============",id);

if (list !== null ) {
    URL = "/update-ProductName";
    form.name = list['name'];
    form.id = list['id'];
    form.type = list['type'];
    form.category_id = list['category_id'];
    form.image = list['image'];
}






function submit() {
    form.post(URL, {
        onSuccess: () => {
            if (page.props.flash.status === true) {
                toaster.success(page.props.flash.message);
                setTimeout(() => {
                    router.get("/ProductNamePage")
                }, 500)
            } else {
                toaster.warning(page.props.flash.message)
            }
        }
    })
}

</script>
