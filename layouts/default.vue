<template>
    <UApp>
        <div class="default-layout">
            <header>
                <div class="header-title" >
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