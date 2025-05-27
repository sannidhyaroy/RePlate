<script setup lang="ts">
const user = useSupabaseUser()
const redirectInfo = useSupabaseCookieRedirect()

watch(user, () => {
    if (user.value) {
        // Get redirect path, and clear it from the cookie
        const path = redirectInfo.pluck()
        // Redirect to the saved path, or fallback to default protected path
        return navigateTo(path || '/')
    }
}, { immediate: true })
</script>

<template>
    <div class="flex flex-col items-center justify-center">
        <h1>Waiting for login...</h1>
    </div>
</template>
