<template>
    <UApp>
        <div class="default-layout">
            <header>
                <div class="header-title">
                    <NavigationBar class="mb-8" />
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