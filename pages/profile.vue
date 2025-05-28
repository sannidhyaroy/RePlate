<template>
    <div class="page-container m-4 py-6 px-10 min-h-screen">
        <h1 class="font-bold text-5xl">Profile</h1>
        <USeparator class="my-4" color="primary" />

        <!-- Profile Section -->

        <div class="flex flex-col md:flex-row items-center md:items-start gap-6 mt-6 px-4 md:px-10">
            <!-- Profile Picture -->
            <div
                class="w-32 h-32 border-4 border-gray-300 rounded-full flex items-center justify-center text-sm text-gray-400 shrink-0">
                <img src="https://img.icons8.com/fluency/180/user-male-circle--v1.png" alt="Profile picture here">
            </div>

            <!-- Name, Email and Buttons -->
            <div class="flex flex-col gap-2 justify-center md:justify-start">
                <div>
                    <h2 class="text-xl font-bold">{{ name || 'name here' }}</h2>
                    <p class="text-gray-400">{{ email || 'email here' }}</p>
                </div>
                <div class="flex gap-4 mt-2">
                    <UButton variant="subtle" @click="changeDetails">Change
                        Details
                    </UButton>
                    <UButton variant="subtle" color="error" @click="deleteAccount">Delete
                        Account
                    </UButton>
                </div>
            </div>
        </div>


        <!-- Stats Cards -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-10">
            <UCard class="text-center">
                <h3 class="text-lg font-semibold mb-2">Number of Items Cooked</h3>
                <p class="text-green-400 text-3xl font-bold">{{ animatedCooked }}</p>
            </UCard>
            <UCard class="text-center">
                <h3 class="text-lg font-semibold mb-2">Number of Recipes Contributed</h3>
                <p class="text-green-400 text-3xl font-bold">{{ animatedContributed }}</p>
            </UCard>
        </div>

        <!-- Cooking History -->
        <div class="mt-10">
            <h2 class="text-2xl font-bold mb-2">COOKING HISTORY</h2>
            <USeparator class="mb-4" color="primary" />
            <div class="grid grid-cols-2 sm:grid-cols-4 gap-4">
                <UCard
                    v-for="(item, index) in cookingHistory" :key="index"
                    class="flex items-center justify-center h-28 transition-all duration-100 hover:border-2 hover:border-green-400">
                    <p class="text-gray-300">{{ item.name }}</p>
                </UCard>
            </div>
        </div>



        <!-- Leave a Comment -->
        <div class="mt-10">
            <h2 class="text-2xl font-bold mb-2">LEAVE A COMMENT</h2>
            <USeparator class="mb-4" color="primary" />
            <UCard class="p-4">
                <textarea
                    v-model="comment" class="w-full p-2 bg-transparent border border-green-400 rounded-md text-white" rows="4"
                    placeholder="Write your comment..."/>
                <div class="flex justify-center mt-4">
                    <UButton leading-icon="i-lucide-upload" @click="submitComment">SUBMIT
                        COMMENT
                    </UButton>
                </div>
            </UCard>
        </div>
    </div>
</template>

<script lang="ts" setup>
const name = ref('')
const email = ref('')
const comment = ref('')
const cooked = ref(0)
const contributed = ref(0)
const animatedCooked = ref(0)
const animatedContributed = ref(0)
const cookingHistory = ref<{ name: string }[]>([])

// Simulated backend fetch
onMounted(() => {
    // Simulate Supabase fetch
    name.value = 'Your Name'
    email.value = 'you@example.com'
    cooked.value = 45
    contributed.value = 12
    cookingHistory.value = [
        { name: 'Pasta' },
        { name: 'Salad' },
        { name: 'Pizza' },
        { name: 'Soup' },
        { name: 'Chowmein' }
    ]

    animateCount(cooked.value, animatedCooked)
    animateCount(contributed.value, animatedContributed)
})

function animateCount(target: number, refVar: number) {
    let count = 0
    const interval = setInterval(() => {
        count++
        refVar.value = count
        if (count >= target) clearInterval(interval)
    }, 30)
}

function changeDetails() {
    console.log('Change details request sent')
    // Connect to Supabase to update user details
}

function deleteAccount() {
    console.log('Delete account request sent')
    // Connect to Supabase to delete user
}

function submitComment() {
    console.log('Comment submitted:', comment.value)
    // Send to Supabase
    comment.value = ''
}
</script>
