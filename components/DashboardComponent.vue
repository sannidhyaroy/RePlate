<template>
    <div class="page-container m-4 py-6 px-10">
        <h1 class="font-bold text-5xl">Dashboard</h1>
        <USeparator class="my-4" color="primary" />
        <div class="flex flex-col gap-4">
            <UCard class="p-4" variant="subtle">
                <h2 class="text-2xl font-bold mb-4">Welcome to your Dashboard</h2>
                <p class="mb-4">Here you can manage your account, view your activity, and access various features.</p>
                <UButton to="/profile" leading-icon="i-lucide-user" class="mr-2" color="primary">
                    View Profile
                </UButton>
            </UCard>
            <UCard class="p-4" variant="subtle">
                <h2 class="text-2xl font-bold mb-4">RePlate your leftovers</h2>
                <p class="mb-4">You can reduce your food wastage by searching for recipes that utilize your leftovers.
                </p>
                <UButton to="/search-by-ingredients" leading-icon="i-lucide-scan-search" class="mr-2" color="primary">
                    Search Recipes
                </UButton>
            </UCard>
        </div>
    </div>
</template>

<script lang="ts" setup>

</script>

<style></style>