<template>
    <div class="container-fluid">
        <div class="row d-flex justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="float-end">
                            <a href="/SuplayerPage" class="btn btn-success mx-3 btn-sm">
                                Back
                            </a>
                        </div>
                        <form @submit.prevent="submit">
                            <div class="card-body">
                                <h4>Save Suplayer</h4>
                                <input id="name" name="name" v-model="form.name" placeholder="Suplayer Name"
                                    class="form-control" type="text" />
                                <br />
                                <input id="email" name="email" v-model="form.email" placeholder="Suplayer Email"
                                    class="form-control" type="email" />
                                <br />
                                <input id="mobile" name="phone" v-model="form.mobile" placeholder="Suplayer Phone"
                                    class="form-control" type="text" />
                                <br />

                                <input id="id" name="id" v-model="form.id" placeholder="id"
                                    class="form-control" type="text" hidden />
                                <br />

                                <input id="companyName" name="companyName" v-model="form.companyName" placeholder="Suplayer Name"
                                    class="form-control" type="text" />
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

const form = useForm({ name: '', email: '', mobile: '', companyName: '',id: ''})
const page = usePage()



let URL = "/create-suplayer";
let list = page.props.suplayers




if ( list['id']!=null) {

    URL = "/update-Suplayer";
    form.name = list['name']
    form.id = list['id']
    form.email = list['email']
    form.mobile = list['mobile']
    form.companyName = list['companyName']
}
  

function submit() {
    form.post(URL, {
        onSuccess: () => {
            if (page.props.flash.status === true) {
                toaster.success(page.props.flash.message);
                setTimeout(() => {
                    router.get("/SuplayerPage")
                }, 500)
            } else {
                toaster.warning(page.props.flash.message)
            }
        }
    })
}

</script>
