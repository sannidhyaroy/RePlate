<template>
    <div class="search-list flex flex-col gap-4">
        <template v-if="loading">
            <USkeleton v-for="n in 3" :key="n" class="w-full h-36" />
        </template>
        <template v-else>
            <SearchItem v-for="item in items" :key="item.id" :item="item" class="search-item" />
        </template>
    </div>
</template>

<script lang="ts" setup>
const supabase = useSupabaseClient();
const toast = useToast();
const items = ref([]);
const loading = ref(true);

const props = defineProps<{
    searchFunction: string;
    ingredients: string[];
}>();

const fetchItems = async () => {
    try {
        loading.value = true;
        const { data, error } = await supabase.rpc(props.searchFunction, { ingredients: props.ingredients });
        if (error) throw error;
        if (data && data.length > 0) {
            items.value = data;
        } else {
            toast.add({
                title: 'No items found',
                description: 'There are no items matching your search criteria.',
                variant: 'info',
            });
        }
    } catch (error) {
        console.error('Error fetching search items:', error);
        toast.add({
            title: 'We were unable to fetch search items',
            description: error.message || 'An error occurred while fetching search items.',
            variant: 'error',
        });
    } finally {
        loading.value = false;
    }
}

onMounted(() => {
    fetchItems();
});

</script>
