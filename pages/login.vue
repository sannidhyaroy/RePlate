<template>
    <div class="login-block">
        <h1 class="page-title">Welcome Back!</h1>
        <h3 class="tagline">Login to RePlate</h3>
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
}
</style>
