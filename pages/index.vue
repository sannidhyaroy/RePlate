<template>
    <DashboardComponent v-if="user" />
    <LandingComponent v-else :title :tagline :about/>
</template>

<script lang="ts" setup>
const user = useSupabaseUser()
const title = "RePlate";
const tagline = "Replate – Recipes from What’s Left..."
const about ="We help you make the most of what you already have at home. Just tell us the ingredients sitting in your fridge or pantry, and we’ll do the rest. No need to stress about what to cook — we’ll instantly suggest delicious recipes you can make with exactly what you’ve got. Whether you’re down to your last few items or trying to avoid food waste, Replate turns leftovers into something amazing. No waste. No stress. Just tasty meals made simple."
</script>

<style></style>