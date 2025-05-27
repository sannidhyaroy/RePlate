<script setup lang="ts">
const supabase = useSupabaseClient()
const user = useSupabaseUser()
const toast = useToast()
if (!user.value) {
    // If the user is not logged in, redirect to the home page
    navigateTo('/')
} else {
    const { error } = await supabase.auth.signOut()
    if (error) {
        toast.add({
            title: 'Logout Failed',
            description: error.message,
            color: 'error'
        })
    } else {
        toast.add({
            title: 'Away You Go!',
            description: 'You have been logged out.',
            color: 'success'
        })
        // Redirect to the home page after successful logout
        navigateTo('/')
    }
}
</script>

<template>
    <div class="flex flex-col items-center justify-center">
        <h1>We're logging you out...</h1>
    </div>
</template>
