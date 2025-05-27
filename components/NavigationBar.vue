<template>
    <nav class="navigation-bar">
        <ul>
            <li class="home-link">
                <NuxtLink to="/">Home</NuxtLink>
            </li>
            <li v-if="!user" class="login-link">
                <NuxtLink to="/login">Login</NuxtLink>
            </li>
            <li v-if="!user" class="signup-link">
                <NuxtLink to="/signup">Sign Up</NuxtLink>
            </li>
            <li v-else class="logout-link">
                <NuxtLink to="/logout">Log Out</NuxtLink>
            </li>
        </ul>
    </nav>
</template>

<script lang="ts" setup>
const user = useSupabaseUser();
</script>

<style></style>