<template>
    <UApp>
        <div class="default-layout">
            <header>
                <NuxtLink to="/" class="logo">
                    <img src="../public/favicon.ico" alt="Logo">
                </NuxtLink>
                <NavigationBar />
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