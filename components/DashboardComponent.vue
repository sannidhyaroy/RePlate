<template>
    <div class="page-container m-4 py-6 px-10">
        <h1 class="font-bold text-5xl">Dashboard</h1>
        <USeparator class="my-4" color="primary" />
        <div class="flex flex-col gap-4">
            <UCard class="p-4" variant="subtle">
                <h2 class="text-2xl font-bold mb-4">Welcome to your Dashboard</h2>
                <p class="mb-4">Here you can manage your account, view your activity, and access various features.</p>
                <UButton to="/profile" leading-icon="i-lucide-user" class="mr-2" color="primary">
                    View Profile
                </UButton>
            </UCard>
            <UCard v-if="!hideRandomRecipes" class="p-4" variant="outline">
                <h2 class="text-2xl font-bold">Recipes for you to crave</h2>
                <UCarousel
                    v-if="!loading" v-slot="{ item }" loop wheel-gestures auto-scroll :items="recipeData"
                    :ui="{ item: 'basis-1/4' }" class="p-4">
                    <UCard
                        class="h-50 m-1" variant="subtle" @click="$router.push('/recipe/' + item[0].id)">
                        <template #header>
                            <h2 class="text-2xl font-bold">Recipe #{{ item[0].id }}</h2>
                        </template>
                        <p>{{ item[0].name }}</p>
                    </UCard>
                </UCarousel>
                <USkeleton v-else class="w-full h-50 m-4" />
            </UCard>
            <br>
            <UCard class="p-4" variant="subtle">
                <h2 class="text-2xl font-bold mb-4">RePlate your leftovers</h2>
                <p class="mb-4">You can reduce your food wastage by searching for recipes that utilize your leftovers.
                </p>
                <UButton to="/search-by-ingredients" leading-icon="i-lucide-scan-search" class="mr-2" color="primary">
                    Search Recipes
                </UButton>
            </UCard>
        </div>
    </div>
</template>

<script lang="ts" setup>
const supabase = useSupabaseClient();
const loading = ref(true);
const hideRandomRecipes = ref(false);
const recipe = {
    minId: 1,
    maxId: 6871,
    randomRecipeCount: 10,
    random() {
        return Math.floor(Math.random() * (this.maxId - this.minId) + this.minId);
    }
};

const recipeData = ref([]);

const showErrorAlert = (message) => {
    toast.add({
        title: 'Something went wrong!',
        description: message,
        color: 'error',
        icon: 'i-lucide-badge-alert'
    });
}

const fetchRecipe = async (Id) => {
    try {
        const { data, error } = await supabase.rpc('get_recipe_by_id', { recipe_id: Id });
        if (error) throw error;
        if (data && data.length > 0) {
            loading.value = false;
            return data;
        }
    } catch (error) {
        showErrorAlert(error.message || 'Failed to fetch random recipes');
        hideRandomRecipes.value = true;
    }
}
onMounted(async () => {
    for (let i = 0; i < recipe.randomRecipeCount; i++) {
        const result = await fetchRecipe(recipe.random());
        recipeData.value.push(result);
    }
});
</script>