<template>
    <NuxtLink :to="`/recipe/${item.id}`" class="w-full">
        <UCard variant="subtle">
            <template #header>
                <div class="grid grid-cols-5 gap-2 items-center">
                    <h1 class="col-span-3 font-bold">{{ item.name }}</h1>
                    <div class="col-span-2 flex flex-col items-end">
                        <h3 class="text-xs">Match Score</h3>
                        <p class="text-center font-bold">{{ item.relevance_score }}</p>
                    </div>
                </div>
            </template>
            <template v-if="selectedTab === 'ingredients'" #footer>
                <div class="grid grid-cols-3 gap-4 text-center">
                    <p class="text-xs">Matching Ingredients</p>
                    <p class="text-xs">Extra Ingredients</p>
                    <p class="text-xs">Total Ingredients</p>
                </div>
                <div class="grid grid-cols-3 gap-4 text-center mt-1">
                    <h3 class="text-2xl font-semibold">{{ item.matching_ingredients }}</h3>
                    <h3 class="text-2xl font-semibold">{{ item.extra_ingredients }}</h3>
                    <h3 class="text-2xl font-semibold">{{ item.total_ingredients }}</h3>
                </div>
            </template>
            <template v-else #footer>
                <div class="grid grid-cols-3 gap-4 text-center">
                    <p class="text-xs">Preparation Time</p>
                    <p class="text-xs">Cooking Time</p>
                    <p class="text-xs">Total Time</p>
                </div>
                <div class="grid grid-cols-3 gap-4 text-center">
                    <h3 class="text-2xl font-semibold">{{ item.preparation_time }} mins</h3>
                    <h3 class="text-2xl font-semibold">{{ item.cooking_time }} mins</h3>
                    <h3 class="text-2xl font-semibold">{{ item.total_time }} mins</h3>
                </div>
            </template>
        </UCard>
    </NuxtLink>
</template>

<script lang="ts" setup>
defineProps<{ item, selectedTab }>();
</script>