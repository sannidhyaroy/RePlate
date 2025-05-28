<template>
    <UCard v-if="recipe.ingredients_array.length > 0" class="recipe-ingredients md:col-span-2">
        <template #header>
            <h2 class="text-2xl font-bold">Ingredients</h2>
        </template>
        <ul class="list-disc list-inside">
            <li v-for="(ingredient, index) in recipe.ingredients_array" :key="index" class="my-1 py-1">{{ ingredient }}
            </li>
        </ul>
    </UCard>
    <USkeleton v-else class="w-full h-96 md:col-span-2" />
</template>

<script setup lang="ts">
defineProps<{ recipe }>();
</script>
