<template>
  <div class="landing-container bg-gradient-to-b from-[#06031f] via-[#111247] via-70% to-[#c45f00] to-90% max-w-full overflow-x-hidden">
    <div class="flex flex-col items-center text-center">
      <div class="title-container text-[500%]">
        {{ title }}
      </div>
      <div class="tagline-container text-xl">
        <b>{{ tagline }}</b>
      </div>
    </div>
    <!-- auth buttons-->
    <div class="flex justify-center my-5 gap-4">
      <UButton to="/signup" leading-icon="i-lucide-user-plus" label="Sign Up" size="xl" class="font-bold" />
      <UButton to="/login" leading-icon="i-lucide-log-in" label="Log In" variant="subtle" size="xl" class="font-bold" />
    </div>
    <div class="font-serif text-2xl text-green-800 text-center mb-4 mt-8">
      <USeparator color="primary">Today's Suggestions</USeparator>
    </div>
    <div>
      <UCarousel v-slot="{ item }" loop wheel-gestures :items="items" :ui="{ item: 'basis-1/6' }" auto-scroll>
        <NuxtImg :src="item" class="rounded-lg object-cover carousel-img-fixed" />
      </UCarousel>
    </div>
    <!-- rotation images -->
    <div class="parent-food">
      <div class="leftfood-container flex mt-[20vh] mx-[4vw] justify-between items-center gap-[10vw]">
        <img src="/public/leftovers.png" alt="Rotating Pizza" class="left-rotating-food w-[clamp(300px,30vw,400px)] h-auto animate-spin-slow">
        <div class="text-[clamp(10px,5vw,50px)]">
          <br>DO YOU HAVE ANY<br>
          <b>LEFTOVER INGREDIENTS?</b>
        </div>
      </div>
      <div class="rightfood-container flex justify-between items-center mx-[4vw] h-[60vh] gap-[10vw]">
        <div class="text-[clamp(10px,5vw,50px)]">
          <br>REPLATE THEM TO<br>
          <b>TASTY MEALS OF YOUR CHOICE</b>
        </div>
        <img src="/public/pizza.png" alt="Rotating chicken dish" class="right-rotating-food w-[clamp(300px,30vw,400px)] h-auto animate-spin-reverse-slow">
      </div>
    </div>
  </div>
  <div class="footer flex flex-col items-center text-center my-10 p-2">
    <h3 class="text-base">
      Check out the
      <ULink to="https://github.com/sannidhyaroy/RePlate" target="_blank">GitHub repository</ULink>
      of {{ title }} to learn more.
    </h3>
    <h5 class="license text-lg">
      {{ title }} is licensed under the
      <ULink to="https://github.com/sannidhyaroy/RePlate/blob/main/LICENSE" target="_blank" class="license-link">GNU
        General
        Public License (GPL) v3.0</ULink>
      license.
    </h5>
  </div>
</template>

<script lang="ts" setup>
defineProps<{
  title: string;
  tagline: string;
}>();
const items = [
  'https://images.unsplash.com/photo-1560684352-8497838a2229?q=80&w=2028&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1597933593749-fba737c268c1?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1723588636244-e82f63cb01e3?q=80&w=2083&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://plus.unsplash.com/premium_photo-1664640733617-56652d5a5cee?q=80&w=2134&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1643892467625-65df6a500524?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1668665771757-4d42737d295a?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1597933593749-fba737c268c1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bWVhbHxlbnwwfDJ8MHx8fDA%3D',
  'https://media.istockphoto.com/id/1040749178/photo/thali-meal-indian-food.jpg?s=612x612&w=is&k=20&c=sK096oaWYAY_KVG5RlAi0egdag-aD2Rjjc0Srn3kr60=',
  'https://images.unsplash.com/photo-1597933593749-fba737c268c1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bWVhbHxlbnwwfDJ8MHx8fDA%3D',
  'https://images.unsplash.com/photo-1694953593181-6ce423500712?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1lYWx8ZW58MHwyfDB8fHww',
  'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGl6emF8ZW58MHwyfDB8fHww',
  'https://plus.unsplash.com/premium_photo-1733259709671-9dbf22bf02cc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGl6emF8ZW58MHwyfDB8fHww',
]
</script>

<style scoped>
.carousel-img-fixed {
  height: 220px;
  width: 200px;
  object-fit: cover;
  display: block;
  margin: 0 auto;
}

/* Custom spin animations for slow and reverse spin */
@keyframes spin-slow {
  from { transform: rotate(0deg); }
  to { transform: rotate(360deg); }
}
@keyframes spin-reverse-slow {
  from { transform: rotate(360deg); }
  to { transform: rotate(0deg); }
}
.animate-spin-slow {
  animation: spin-slow 15s linear infinite;
}
.animate-spin-reverse-slow {
  animation: spin-reverse-slow 15s linear infinite;
}
</style>
