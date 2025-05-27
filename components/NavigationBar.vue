<template>
    <nav class="navigation-bar">
            <div style="display: flex; justify-content: start; align-items: center; margin:10px">
                <div style="margin-right: 30px">
                    <NuxtLink to="/">Replate</NuxtLink>
                </div>
                <div style="margin-right:30px">
                    <UInput placeholder="Search Recepies ..." />
                </div>
                <div v-if="!user" class="login-link">
                    <NuxtLink to="/login">Login</NuxtLink>
                </div>
                <div>
                    <li  v-if="!user" class="signup-link">
                        <NuxtLink to="/signup">Sign Up</NuxtLink>
                    </li>
                    <li v-else class="logout-link">
                        <NuxtLink to="/logout">Log Out</NuxtLink>
                    </li>
                </div>    
            </div>
    </nav>
</template>

<script lang="ts" setup>
const user = useSupabaseUser();
</script>

<style></style>