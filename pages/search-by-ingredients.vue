<template>
    <div class="page-container m-4 py-6 px-10">
        <h1 class="font-bold text-5xl">Search by Ingredients</h1>
        <USeparator class="my-4" color="primary" />
        <div class="flex flex-col gap-4">
            <UCard class="p-4" variant="subtle">
                <h2 class="text-2xl font-bold">Find Recipes with Your Ingredients</h2>
                <p class="my-2">Enter the ingredients you have at home to find recipes that you can make.</p>
                <USelect
                    v-model="selectedSearchFunction" :items="searchFunctions" icon="i-lucide-filter"
                    selected-icon="i-lucide-search" placeholder="Search Filter" size="xl" class="my-2" />
                <UButtonGroup class="w-full">
                    <multiselect
                        v-model="selectedIngredients" :options="options" tag-placeholder="Add new ingredient"
                        label="name" placeholder="Add your leftover ingredients" track-by="id" :multiple="true"
                        :taggable="true" @tag="addIngredient" />
                    <UModal
                        v-model:open="modalOpen" title="Recipe Ideas"
                        description="Select any recipe to view details" :dismissible="false">
                        <UButton label="Find Recipes" icon="i-lucide-search" size="xl" square />
                        <template #body>
                            <SearchList
                                :ingredients="selectedIngredients.map(i => i.name)"
                                :search-function="selectedSearchFunction" @close-modal="modalOpen = false" />
                        </template>
                    </UModal>
                </UButtonGroup>
            </UCard>
        </div>
    </div>
</template>

<script lang="ts" setup>
const supabase = useSupabaseClient();
const modalOpen = ref(false);
const selectedIngredients = ref([]);
const options = ref([]);
const searchFunctions = ref([
    {
        label: 'Exact Match',
        value: 'search_recipes_exact'
    },
    {
        label: 'Loose Match',
        value: 'search_recipes'
    },
    {
        label: 'Optimal Match',
        value: 'search_recipes_optimal'
    }
]);
const selectedSearchFunction = ref('search_recipes_exact');
const addIngredient = (newIngredient) => {
    const ingredient = {
        name: newIngredient,
        id: newIngredient.substring(0, 2) + Math.floor(Math.random() * 10000000),
    };
    selectedIngredients.value.push(ingredient);
    options.value.push(ingredient);
};

const fetchIngredientOptions = async () => {
    const { data, error } = await supabase.rpc('fetch_ingredients');
    if (!error && data) {
        options.value = data.map(item => ({
            name: item.ingredient,
            id: item.ingredient.substring(0, 2) + Math.floor(Math.random() * 10000000),
        }));
    }
};

onMounted(async () => {
    fetchIngredientOptions();
});

</script>

<style>
/* Vue Multiselect border radius */
@import 'assets/css/vue-multiselect.css';

.multiselect__tags {
    border-radius: calc(var(--ui-radius) * 1.5) 0 0 calc(var(--ui-radius) * 1.5);
}
</style>