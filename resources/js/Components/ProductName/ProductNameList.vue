
<template>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div>
                            <h3>Product Name</h3>
                        </div>
                        <hr />
                        <div class="float-end">
                            <button @click="submitPost" class="btn btn-success mx-3 btn-sm">
                                                Add Product Name
                            </button>
                        </div>
                        <div>
                            <input placeholder="Search..." class="form-control mb-2 w-auto form-control-sm" type="text"
                                v-model="searchValue">
                            <EasyDataTable
                                buttons-pagination
                                alternating
                                :headers="Header"
                                :items="Item"
                                :rows-per-page="10"
                                :search-field="searchField"
                                :search-value="searchValue" show-index>
                                <template #item-image="{ image }" class="pt-2 pb-2">
                                    <img :src="image" :alt="image" alt="" height="40px" width="40px">
                                </template>
                                <template #item-action="{ id }">
                                    <!-- <Link class="btn btn-success mx-3 btn-sm" :href="`/ProductSavePage?id=${id}`">Edit</Link> -->

                                    <form @submit.prevent="editSubmit(id)" style="display: inline;">
                                        <input type="hidden" name="id" :value="id" />
                                        <button type="submit" class="btn btn-success mx-3 btn-sm">Edit</button>
                                    </form>





                                    <button class="btn btn-danger btn-sm" @click="DeleteClick(id)">Delete</button>
                                </template>
                            </EasyDataTable>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { usePage, router, Link } from '@inertiajs/vue3'
import { createToaster } from "@meforma/vue-toaster";
const toaster = createToaster();
import { ref } from "vue";
let page = usePage()

const Header = [
    { text: "Image", value: "image" },
    { text: "Name", value: "name" },
    { text: "Category", value: "category.name" },
    { text: "Type", value: "type" },
    { text: "Action", value: "action" },
];

const Item = ref(page.props.productNamesPage)
const searchValue = ref()

const submitPost = () => {
    // const id =0;
  router.post('/ProductNameSavePage', {
    // any form data here if needed
    // id:id
  })
}



const props = defineProps({
  id: {
    type: [String, Number],
    required: true
  }
})



function editSubmit(id) {
  router.post('/ProductNameSaveEdit', { id })
}



const DeleteClick = (id) => {
    let text = "Do you want to delete";
    if (confirm(text) === true) {
        router.get(`/delete-productName/${id}`)
        toaster.success('Product Deleted Successfully');
    } else {
        text = "You canceled!";
    }
}



</script>
