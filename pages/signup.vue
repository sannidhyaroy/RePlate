<template>
    <div class="signup-block">
        <h1 class="page-title">Let's Get You Started!</h1>
        <h1 class="tagline">Sign Up</h1>
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
