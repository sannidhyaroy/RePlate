<template>
    <div class="page-container m-4 py-6 px-10 h-screen">
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
            <UCarousel
                v-if="!loading" v-slot="{ item }" loop wheel-gestures arrows auto-scroll :items="recipeData"
                :ui="{ item: 'basis-1/4' }" class="p-4">
                <UCard
                    class="h-50 m-1" :variant="hovered ? 'subtle' : 'outline'" @mouseenter="hovered = true" @mouseleave="hovered = false"
                    @click="$router.push('/recipe/' + item[0].id)">
                    <template #header>
                        <h2 class="text-2xl font-bold">Recipe #{{ item[0].id }}</h2>
                    </template>
                    <p>{{ item[0].name }}</p>

                </UCard>
            </UCarousel>
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
const recipe = {
    minId: 1,
    maxId: 6871,
    randomRecipeCount: 10,
    random() {
        return Math.floor(Math.random() * (this.maxId - this.minId) + this.minId);
    }
};

const recipeData = ref([]);

const fetchRecipe = async (Id) => {
    try {
        const { data, error } = await supabase.rpc('get_recipe_by_id', { recipe_id: Id });
        if (error) throw error;
        if (data && data.length > 0) {
            loading.value = false;
            return data;
        }
    } catch (error) {
        console.error('Error fetching recipe:', error);
    }
}
onMounted(async () => {
    for (let i = 0; i < recipe.randomRecipeCount; i++) {
        const result = await fetchRecipe(recipe.random());
        recipeData.value.push(result);
    }
});
</script>