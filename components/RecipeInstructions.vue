<template>
    <UCard v-if="recipe.instructions" class="recipe-instructions md:col-span-3">
        <template #header>
            <h2 class="text-2xl font-bold">Instructions</h2>
        </template>
        <p class="my-1 py-1">{{ recipe.instructions }}</p>
    </UCard>
    <USkeleton v-else class="w-full h-120 md:col-span-3" />
</template>

<script setup lang="ts">
defineProps<{ recipe }>();
</script>
