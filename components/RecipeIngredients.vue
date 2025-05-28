<template>
    <UCard
        v-if="!loading" class="recipe-ingredients md:col-span-2 transition-all duration-900 ease-in-out"
        :variant="hovered ? 'subtle' : 'outline'" @mouseenter="hovered = true" @mouseleave="hovered = false">
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
defineProps<{ recipe, loading }>();
const hovered = ref(false);
</script>
