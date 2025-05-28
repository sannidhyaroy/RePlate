<template>
    <!-- Main container for the recipe page -->
    <div class="page-container m-4 py-6 px-10">
        <!-- Recipe ID header -->
        <h1 class="font-bold text-5xl">Recipe #{{ id }}</h1>
        <USeparator class="my-4" color="primary" />
        <div class="flex flex-col gap-10">
            <!-- Recipe title and description section -->
            <RecipeTitle :recipe="recipe" :loading="loading" />
            <!-- Recipe details: ingredients and instructions -->
            <div class="recipe-details grid grid-cols-1 md:grid-cols-5 gap-10">
                <RecipeIngredients :recipe="recipe" :loading="loading" />
                <RecipeInstructions :recipe="recipe" :loading="loading" />
            </div>
            <!-- Recipe meta information: times, servings, cuisine, etc. -->
            <RecipeMeta :recipe="recipe" :loading="loading" />
        </div>
        <div class="flex flex-col items-center justify-center w-full m-6 p-4">
            <UPagination v-model:page="page" :total="pageTotal" items-per-page="1" size="xl" active-variant="subtle" />
        </div>
    </div>
</template>

<script lang="ts" setup>
const supabase = useSupabaseClient();
const toast = useToast();
const router = useRouter();
const { id } = useRoute().params;
const recipe = ref(null);
const loading = ref(true);
const page = ref(Number(id)) || 1;
const pageTotal = ref(6871);

const showErrorAlert = (message) => {
    toast.add({
        title: 'Something went wrong!',
        description: message,
        color: 'error',
        icon: 'i-lucide-badge-alert'
    });
}

const fetchRecipe = async () => {
    try {
        loading.value = true;
        const { data, err } = await supabase.rpc('get_recipe_by_id', { recipe_id: id });
        if (err) throw rpcError;
        if (data && data.length > 0) {
            recipe.value = data[0];
        } else {
            showErrorAlert('This recipe likely does not exist');
        }
    } catch (error) {
        showErrorAlert(error.message || 'Failed to fetch recipe');
    } finally {
        loading.value = false;
    }
}

watch(page, (newPage) => {
    router.push(`/recipe/${newPage}`)
}, { immediate: true });

onMounted(() => {
    fetchRecipe();
});

</script>
