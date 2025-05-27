<template>
    <DashboardComponent v-if="user" />
    <LandingComponent v-else title="RePlate" tagline="Remake your plate with leftovers" />
</template>

<script lang="ts" setup>
const user = useSupabaseUser()
</script>

<style></style>
