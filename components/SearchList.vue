<template>
    <div class="search-list flex flex-col gap-4">
        <template v-if="loading">
            <USkeleton v-for="n in 3" :key="n" class="w-full h-36" />
        </template>
        <template v-else>
            <UTabs
                v-if="searchFunction === 'search_recipes_optimal'" v-model="selectedTab" :items="tabItems"
                class="w-full" />
            <SearchItem
                v-for="item in items" :key="item.id" :item="item" :selected-tab="selectedTab"
                class="search-item w-full" />
        </template>
    </div>
</template>

<script lang="ts" setup>
const supabase = useSupabaseClient();
const toast = useToast();

const props = defineProps<{
    searchFunction: string;
    ingredients: string[];
}>();

const emit = defineEmits(['close-modal']);

const items = ref([]);
const loading = ref(true);
const selectedTab = ref(props.searchFunction === 'search_recipes_optimal' ? 'ingredients' : 'time');

const tabItems = ref<TabsItem[]>([
    {
        label: 'Ingredients',
        icon: 'i-lucide-shopping-basket',
        value: 'ingredients',
    },
    {
        label: 'Time',
        icon: 'i-lucide-hourglass',
        value: 'time',
    }
]);

const fetchItems = async () => {
    try {
        loading.value = true;
        const { data, error } = await supabase.rpc(props.searchFunction, { input_ingredients: props.ingredients });
        if (error) throw error;
        if (data && data.length > 0) {
            items.value = data;
        } else {
            emit('close-modal');
            toast.add({
                title: 'No items found',
                description: 'There are no items matching your search criteria.',
                variant: 'info',
            });
        }
    } catch (error) {
        emit('close-modal');
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
