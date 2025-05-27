<template>
    <div class="page-container m-4 py-6 px-10">
        <h1 class="font-bold text-5xl">Search by Ingredients</h1>
        <USeparator class="my-4" color="primary" />
        <div class="flex flex-col gap-4">
            <UCard class="p-4" variant="subtle">
                <h2 class="text-2xl font-bold mb-4">Find Recipes with Your Ingredients</h2>
                <p class="mb-4">Enter the ingredients you have at home to find recipes that you can make.</p>
                <multiselect
                    v-model="selectedIngredients" :options="options" tag-placeholder="Add new ingredient"
                    label="name" placeholder="Add your leftover ingredients" track-by="id" :multiple="true"
                    :taggable="true" @tag="addIngredient" />
            </UCard>
        </div>
    </div>
</template>

<script lang="ts" setup>
const selectedIngredients = ref([]);
const options = ref([]);
const addIngredient = (newIngredient) => {
    const ingredient = {
        name: newIngredient,
        id: newIngredient.substring(0, 2) + Math.floor(Math.random() * 10000000),
    };
    selectedIngredients.value.push(ingredient);
    options.value.push(ingredient);
};

</script>

<style></style>