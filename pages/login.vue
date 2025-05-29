<template>
    <div class="login-block flex justify-center items-center flex-col gap-4">
        <h1 class="page-title text-4xl font-bold">Welcome Back!</h1>
        <h3 class="tagline text-2xl">Login to RePlate</h3>
        <AuthForm />
    </div>
</template>

<script lang="ts" setup></script>

<style scoped>
.login-block {
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    max-width: 50%;
    padding: 2rem;
    align-items: center;
    max-width: 100vw;
}
</style>
