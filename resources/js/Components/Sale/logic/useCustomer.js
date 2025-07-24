import { usePage } from '@inertiajs/vue3'
import { ref } from "vue";

const selectedCustomer = ref(null);
const CustomerItem = ref([]);

export function useCustomer() {
    let page = usePage()

    if (CustomerItem.value.length === 0 && page.props.customers) {
        CustomerItem.value = page.props.customers
    }

    const CustomerHeader = [
        { text: "Name", value: "name" },
        { text: "Pick", value: "number" },
    ];

    const addCustomerToSale = (customer) => {
        selectedCustomer.value = customer;
    }

    const searchCustomerField = ref('name');
    const searchCustomerValue = ref();

    return {
        CustomerHeader,
        CustomerItem,
        addCustomerToSale,
        searchCustomerField,
        searchCustomerValue,
        selectedCustomer,
    };
}
