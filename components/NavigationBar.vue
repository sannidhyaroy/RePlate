<template>
    <nav class="navigation-bar">
            <div style="display: flex; justify-content:space-between; align-items: center; margin:10px">
                <div style="display: flex; margin-left:5px;">
                    <div style="margin-right: 10px;">
                        <NuxtLink to="/" class="logo">
                        <img src="../public/favicon.ico" alt="Logo">
                    </NuxtLink>
                    </div>
                    <div style="margin-right:10px">
                        <NuxtLink to="/">Home</NuxtLink>
                    </div>
                    <div >
                        <UInput placeholder="Search Recepies ..." />
                    </div>
                </div>

                <!-- auth buttons-->
                <div v-if="!user" style="display:flex">
                    <div class="login-link" style="margin-right:10px">
                          <UButton >
                            <NuxtLink to="/login">Login</NuxtLink>
                          </UButton>
                    </div>
                    <div class="signup-link">
                        <UButton>
                            <NuxtLink to="/signup">Sign Up</NuxtLink>                        
                        </UButton>
                    </div>
                </div>
                <div v-else class="logout-link">
                    <UButton>
                        <NuxtLink to="/logout">Log Out</NuxtLink>
                    </UButton>
                </div>    
            </div>
    </nav>
</template>

<script lang="ts" setup>
const user = useSupabaseUser();
</script>
<style>
</style>