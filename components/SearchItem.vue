<template>
    <NuxtLink :to="`/recipe/${item.id}`" class="w-full">
        <UCard variant="subtle">
            <template #header>
                <div class="grid grid-cols-5 gap-2 items-center">
                    <h1 class="col-span-3 font-bold">{{ item.name }}</h1>
                    <div class="col-span-2 flex flex-col items-end">
                        <h3 class="text-xs">Match Score</h3>
                        <p class="text-center">{{ item.relevance_score }}</p>
                    </div>
                </div>
            </template>
            <template #footer>
                <div class="grid grid-cols-3 gap-4 text-center">
                    <p class="text-xs">Preparation Time</p>
                    <p class="text-xs">Cooking Time</p>
                    <p class="text-xs">Total Time</p>
                </div>
                <div class="grid grid-cols-3 gap-4 text-center">
                    <h3>{{ item.preparation_time }} minutes</h3>
                    <h3>{{ item.cooking_time }} minutes</h3>
                    <h3>{{ item.total_time }} minutes</h3>
                </div>
            </template>
        </UCard>
    </NuxtLink>
</template>

<script lang="ts" setup>
defineProps<{ item }>();
</script>