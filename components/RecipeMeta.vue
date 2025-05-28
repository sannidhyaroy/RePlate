<template>
    <!-- Main container for recipe meta information-->
    <div class="recipe-meta grid grid-cols-1 md:grid-cols-2 gap-10">
        <!-- Card for time-related information: Preparation, Cooking, and Total Time -->
        <UCard
            v-if="!loading" class="md:col-span-2 transition-all duration-900 ease-in-out"
            :variant="hovered.time ? 'subtle' : 'outline'" @mouseenter="hovered.time = true"
            @mouseleave="hovered.time = false">
            <div class="flex flex-col md:flex-row justify-between items-center text-center gap-4 md:gap-0">
                <!-- Preparation Time -->
                <div class="flex-1">
                    <div class="text-lg font-bold">Preparation Time</div>
                    <div class="text-3xl">{{ recipe.preparation_time || '-' }}
                        <span v-if="recipe.preparation_time">min</span>
                    </div>
                </div>

                <USeparator orientation="vertical" class="hidden md:block h-28 mx-4" />

                <!-- Cooking Time -->
                <div class="flex-1">
                    <div class="text-lg font-bold">Cooking Time</div>
                    <div class="text-3xl">{{ recipe.cooking_time || '-' }}
                        <span v-if="recipe.cooking_time">min</span>
                    </div>
                </div>

                <USeparator orientation="vertical" class="hidden md:block h-28 mx-4" />

                <!-- Total Time -->
                <div class="flex-1">
                    <div class="text-lg font-bold">Total Time</div>
                    <div class="text-3xl">{{ recipe.total_time || '-' }}
                        <span v-if="recipe.total_time">min</span>
                    </div>
                </div>
            </div>
        </UCard>
        <USkeleton v-else class="w-full h-45 md:col-span-2" />

        <!-- Card for Servings -->
        <UCard
            v-if="!loading" class="p-4 transition-all duration-900 ease-in-out"
            :variant="hovered.servings ? 'subtle' : 'outline'" @mouseenter="hovered.servings = true"
            @mouseleave="hovered.servings = false">
            <h2 class="text-xl font-bold mb-2">Servings</h2>
            <p>{{ recipe.servings }}</p>
        </UCard>
        <USkeleton v-else class="w-full h-36" />

        <!-- Card for Cuisine -->
        <UCard
            v-if="!loading" class="p-4 transition-all duration-900 ease-in-out"
            :variant="hovered.cuisine ? 'subtle' : 'outline'" @mouseenter="hovered.cuisine = true"
            @mouseleave="hovered.cuisine = false">
            <h2 class="text-xl font-bold mb-2">Cuisine</h2>
            <p>{{ recipe.cuisine }}</p>
        </UCard>
        <USkeleton v-else class="w-full h-36" />

        <!-- Card for Course -->
        <UCard
            v-if="!loading" class="p-4 transition-all duration-900 ease-in-out"
            :variant="hovered.course ? 'subtle' : 'outline'" @mouseenter="hovered.course = true"
            @mouseleave="hovered.course = false">
            <h2 class="text-xl font-bold mb-2">Course</h2>
            <p>{{ recipe.course }}</p>
        </UCard>
        <USkeleton v-else class="w-full h-36" />

        <!-- Card for Diet -->
        <UCard
            v-if="!loading" class="p-4 transition-all duration-900 ease-in-out"
            :variant="hovered.diet ? 'subtle' : 'outline'" @mouseenter="hovered.diet = true"
            @mouseleave="hovered.diet = false">
            <h2 class="text-xl font-bold mb-2">Diet</h2>
            <p>{{ recipe.diet }}</p>
        </UCard>
        <USkeleton v-else class="w-full h-36" />
    </div>
</template>

<script setup lang="ts">
defineProps<{ recipe, loading }>();
const hovered = reactive({
    time: false,
    servings: false,
    cuisine: false,
    course: false,
    diet: false
});
</script>
