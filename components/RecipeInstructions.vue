<template>
    <UCard
        v-if="!loading" class="recipe-instructions md:col-span-3 transition-all duration-900 ease-in-out"
        :variant="hovered ? 'subtle' : 'outline'" @mouseenter="hovered = true" @mouseleave="hovered = false">
        <template #header>
            <h2 class="text-2xl font-bold">Instructions</h2>
        </template>
        <p class="my-1 py-1">{{ recipe.instructions }}</p>
    </UCard>
    <USkeleton v-else class="w-full h-120 md:col-span-3" />
</template>

<script setup lang="ts">
defineProps<{ recipe, loading }>();
const hovered = ref(false);
</script>
