<template>
    <nav class="navigation-bar">
            <div style="display: flex; justify-content: start; align-items: center; margin:10px">
                <div style="margin-right: 30px">
                    <NuxtLink to="/">Home</NuxtLink>
                </div>
                <div style="margin-right:30px">
                    <UInput placeholder="Search Recepies ..." />
                </div>

                <!-- auth buttons-->
                <div v-if="!user" style="display:flex;">
                    <div class="login-link" style="margin-right: 10px">
                        <NuxtLink to="/login">Login</NuxtLink>
                    </div>
                    <div class="signup-link">
                        <NuxtLink to="/signup">Sign Up</NuxtLink>                        
                    </div>
                </div>
                <div v-else class="logout-link">
                        <NuxtLink to="/logout">Log Out</NuxtLink>
                </div>    
            </div>
    </nav>
</template>

<script lang="ts" setup>
const user = useSupabaseUser();
</script>
<style>
</style>