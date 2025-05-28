<template>
    <!-- Main container for the recipe page -->
    <div class="page-container m-4 py-6 px-10">
        <!-- Recipe ID header -->
        <h1 class="font-bold text-5xl">Recipe #{{ id }}</h1>
        <USeparator class="my-4" color="primary" />
        <div class="flex flex-col gap-10">
            <!-- Recipe title and description section -->
            <RecipeTitle :recipe="recipe" />
            <!-- Recipe details: ingredients and instructions -->
            <div class="recipe-details grid grid-cols-1 md:grid-cols-5 gap-10">
                <RecipeIngredients :recipe="recipe" />
                <RecipeInstructions :recipe="recipe" />
            </div>
            <!-- Recipe meta information: times, servings, cuisine, etc. -->
            <RecipeMeta :recipe="recipe" />
        </div>
    </div>
</template>

<script lang="ts" setup>
const { id } = useRoute().params;
const recipe = ref({
    name: '',
    description: '',
    ingredients_array: [],
    instructions: '',
    preparation_time: '',
    cooking_time: '',
    total_time: '',
    servings: '',
    cuisine: '',
    course: '',
    diet: '',
    created_at: ''
});

</script>

<style></style>