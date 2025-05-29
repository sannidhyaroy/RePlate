<template>
    <div class="signup-block flex justify-center items-center flex-col gap-4">
        <h1 class="page-title text-4xl font-bold">Let's Get You Started!</h1>
        <h1 class="tagline text-2xl">Register with RePlate</h1>
        <AuthForm :signup-form="true" />
    </div>
</template>

<script lang="ts" setup></script>

<style scoped>
.signup-block {
    display: flex;
    flex-direction: column;
    max-width: 50%;
    padding: 2rem;
    align-items: center;
    max-width: 100vw;
}
</style>
