<template>
    <div class="page-container m-4 py-6 px-10">
        <h1 class="font-bold text-5xl">Recipe #{{ id }}</h1>
        <USeparator class="my-4" color="primary" />
        <div class="flex flex-col gap-10">
            <div class="recipe-info flex flex-col gap-4">
                <div class="recipe-title">
                    <h1 v-if="recipe.name" class="text-3xl font-bold">{{ recipe.name }}</h1>
                    <USkeleton v-else class="w-full h-12" />
                </div>
                <div class="recipe-description">
                    <p v-if="recipe.description" class="text-base">{{ recipe.description }}</p>
                    <USkeleton v-else class="w-full h-24" />
                </div>
            </div>
            <div class="recipe-details grid grid-cols-1 md:grid-cols-2 gap-10">
                <UCard v-if="recipe.ingredients_array.length > 0" class="recipe-ingredients">
                    <template #header>
                        <h2 class="text-2xl font-bold">Ingredients</h2>
                    </template>
                    <ul class="list-disc pl-5">
                        <li v-for="(ingredient, index) in recipe.ingredients_array" :key="index">{{ ingredient }}</li>
                    </ul>
                </UCard>
                <USkeleton v-else class="w-full h-96" />
                <UCard v-if="recipe.instructions" class="recipe-instructions">
                    <template #header>
                        <h2 class="text-2xl font-bold">Instructions</h2>
                    </template>
                    <p>{{ recipe.instructions }}</p>
                </UCard>
                <USkeleton v-else class="w-full h-120" />
            </div>
            <div class="recipe-meta grid grid-cols-1 md:grid-cols-2 gap-10">
                <UCard v-if="recipe.preparation_time" class="p-4">
                    <h2 class="text-xl font-bold mb-2">Preparation Time</h2>
                    <p>{{ recipe.preparation_time }} minutes</p>
                </UCard>
                <USkeleton v-else class="w-full h-36" />
                <UCard v-if="recipe.cooking_time" class="p-4">
                    <h2 class="text-xl font-bold mb-2">Cooking Time</h2>
                    <p>{{ recipe.cooking_time }} minutes</p>
                </UCard>
                <USkeleton v-else class="w-full h-36" />
                <UCard v-if="recipe.total_time" class="p-4">
                    <h2 class="text-xl font-bold mb-2">Total Time</h2>
                    <p>{{ recipe.total_time }} minutes</p>
                </UCard>
                <USkeleton v-else class="w-full h-36" />
                <UCard v-if="recipe.servings" class="p-4">
                    <h2 class="text-xl font-bold mb-2">Servings</h2>
                    <p>{{ recipe.servings }}</p>
                </UCard>
                <USkeleton v-else class="w-full h-36" />
                <UCard v-if="recipe.cuisine" class="p-4">
                    <h2 class="text-xl font-bold mb-2">Cuisine</h2>
                    <p>{{ recipe.cuisine }}</p>
                </UCard>
                <USkeleton v-else class="w-full h-36" />
                <UCard v-if="recipe.course" class="p-4">
                    <h2 class="text-xl font-bold mb-2">Course</h2>
                    <p>{{ recipe.course }}</p>
                </UCard>
                <USkeleton v-else class="w-full h-36" />
                <UCard v-if="recipe.diet" class="p-4">
                    <h2 class="text-xl font-bold mb-2">Diet</h2>
                    <p>{{ recipe.diet }}</p>
                </UCard>
                <USkeleton v-else class="w-full h-36" />
            </div>
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