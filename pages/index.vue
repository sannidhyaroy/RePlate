<template>
    <DashboardComponent v-if="user" />
    <LandingComponent v-else :title :tagline />
</template>

<script lang="ts" setup>
const user = useSupabaseUser()
const title = "RePlate";
const tagline = "Refill your plate with leftovers 🍽️"
</script>

<style></style>