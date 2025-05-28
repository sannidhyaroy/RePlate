<template>
    <div class="header-content flex justify-between items-center m-2 px-4">
        <NuxtLink to="/" class="header-left">
            <NuxtImg src="logo.png" alt="logo" class="logo w-1/5" />
        </NuxtLink>
        <div class="header-right">
            <UNavigationMenu :items="items" highlight />
        </div>
    </div>
</template>

<script lang="ts" setup>
const user = useSupabaseUser();

const authItems = computed<NavigationMenuItem>(() =>
    !user.value ? [{
        label: 'Sign Up',
        to: '/signup',
        icon: 'i-lucide-user-plus',
    },
    {
        label: 'Log In',
        to: '/login',
        icon: 'i-lucide-log-in',
    }] : [{
        label: 'Log Out',
        to: '/logout',
        icon: 'i-lucide-log-out',
    },
    ]
);
const items = computed<NavigationMenuItem[][]>(() => [
    [
        {
            label: 'Home',
            to: '/',
            icon: 'i-lucide-house',
        },
    ],
    authItems.value,
    [
        {
            label: 'GitHub',
            icon: 'i-lucide-github',
            to: 'https://github.com/sannidhyaroy/RePlate',
            target: '_blank',
        },
        {
            label: 'Help',
            icon: 'i-lucide-help-circle',
            to: 'https://github.com/sannidhyaroy/RePlate/blob/main/README.md',
            target: '_blank',
        },
    ]
]);
watch(user, () => {
}, { immediate: true });

</script>
<style></style>