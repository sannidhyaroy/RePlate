<template>
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
</template>

<script setup lang="ts">
defineProps<{ recipe }>();
</script>
