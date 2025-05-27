<template>
    <UNavigationMenu :items="items" class="w-full justify-end" highlight />
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
    ]
]);
watch(user, () => {
}, { immediate: true });

</script>
<style></style>