<template>
    <UApp>
        <div class="default-layout">
            <header>
                <div style="display: flex; justify-content: start; align-items: center; padding: 10px;">
                    <NuxtLink to="/" class="logo">
                        <img src="../public/favicon.ico" alt="Logo">
                    </NuxtLink>
                    <NavigationBar />
                </div>
            </header>
            <slot />
        </div>
    </UApp>
</template>

<style>
.router-link-active {
    color: burlywood;
}
</style>