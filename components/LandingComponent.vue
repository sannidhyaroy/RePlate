<template>
  <div class="landing-container">
    <div class="flex flex-col items-center text-center">
      <div class="title-container">
        {{ title }}
      </div>

      <div class="typing-effect">
        <b>{{ tagline }}</b>
      </div>

      <div class="about-container">
        <p>{{ about }}</p>
      </div>
    </div>

    <!-- contribute button -->
    <div class="flex justify-center my-5">
      <div class="mr-10 cook">
        <UButton class="font-bold rounded-full" color="error" variant="subtle" size="xl">
          Cook
        </UButton>
      </div>
      <UButton class="font-bold rounded-full" color="secondary" variant="subtle" size="xl">
        Contribute
      </UButton>
    </div>

    <div class="font-serif text-2xl text-green-800 text-center mb-4 mt-8">
      <USeparator color="primary">TODAY'S SUGGESTIONS</USeparator>
    </div>

    <div>
      <UCarousel v-slot="{ item }" loop wheel-gestures :items="items" :ui="{ item: 'basis-1/6' }">
        <img :src="item" width="200" height="234" class="rounded-lg">
      </UCarousel>
    </div>

    <!-- rotation images -->
    <div class="parent-food">
      <div class="pizza-container">
        <img src="/public/pizza.png" alt="Rotating Pizza" class="rotating-pizza">
        <div class="text-[clamp(10px,5vw,50px)]">
          <br>DO YOU HAVE ANY<br>
          <br>LEFTOVER INGREDIENTS<br>
        </div>
      </div>

      <div class="chickenDish-container">
        <div class="text-[clamp(10px,5vw,50px)]">
          <br>CONVERT THEM INTO<br>
          <br>TASTY MEAL OF YOUR CHOICE<br>
        </div>
        <img src="/public/chicken.png" alt="Rotating chicken dish" class="rotating-chickenDish">
      </div>

      <div class="text-[clamp(10px,5vw,50px)] waiting-effect">
        <br> WHAT ARE YOU WAITING FOR....<br>
        <br>
        <br>
      </div>

      <div class="two-dish-container">
        <div>
          <img src="/public/Seafood-Noodles.png" class="rotating-double-dish1">
        </div>
        <div class="mt-[10%]">
          <UButton to="/signup" leading-icon="i-lucide-user-plus" class="mr-2" color="warning">
            SignUp
          </UButton>
          <UButton to="/login" leading-icon="i-lucide-log-in" class="mr-2" color="warning">
            Login
          </UButton>
        </div>
        <div>
          <img src="/public/Seafood-Noodles.png" class="rotating-double-dish2">
        </div>
      </div>
    </div>
  </div>
  <UCard>
    <div class="text-[13px] flex justify-start">
      <div class="mr-2.5">
        <p>
          Check out the
          <ULink to="https://github.com/sannidhyaroy/RePlate" target="_blank">GitHub repository</ULink>
          of {{ title }} to learn more.
        </p>
      </div>
    </div>
    <div class="text-[13px]">
      <p class="license">
        {{ title }} is licensed under the
        <ULink to="https://github.com/sannidhyaroy/RePlate/blob/main/LICENSE" target="_blank" class="license-link">GNU
          General
          Public License (GPL) v3.0</ULink>
        license.
      </p>
    </div>
  </UCard>
</template>

<script lang="ts" setup>
defineProps<{
  title: string;
  tagline: string;
  about: string;
}>();
const items = [
  'https://picsum.photos/468/468?random=1',
  'https://picsum.photos/468/468?random=2',
  'https://picsum.photos/468/468?random=3',
  'https://picsum.photos/468/468?random=4',
  'https://picsum.photos/468/468?random=5',
  'https://picsum.photos/468/468?random=6',
  'https://images.unsplash.com/photo-1597933593749-fba737c268c1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bWVhbHxlbnwwfDJ8MHx8fDA%3D',
  'https://media.istockphoto.com/id/1040749178/photo/thali-meal-indian-food.jpg?s=612x612&w=is&k=20&c=sK096oaWYAY_KVG5RlAi0egdag-aD2Rjjc0Srn3kr60=',
  'https://images.unsplash.com/photo-1597933593749-fba737c268c1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bWVhbHxlbnwwfDJ8MHx8fDA%3D',
  'https://images.unsplash.com/photo-1694953593181-6ce423500712?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1lYWx8ZW58MHwyfDB8fHww',
  'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGl6emF8ZW58MHwyfDB8fHww',
  'https://plus.unsplash.com/premium_photo-1733259709671-9dbf22bf02cc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGl6emF8ZW58MHwyfDB8fHww',
]
</script>


<style scoped>
.landing-container {
  background-image: linear-gradient(#06031f, #111247, #c45f00, #d1c156);
  max-width: 100vw;
  overflow-x: hidden;
}

.title-container {
  font-size: 500%
}

.typing-effect {
  /* width: 30%; */
  font-size: clamp(1rem, 10vw, 1.5rem);
  overflow: hidden;
  /*Ensure the text is not visible until the typewriter effect */
  /* border-right: 100% solid white; The cursor */
  white-space: nowrap;
  /* Keeps the text on a single line */
  animation: typing 5s forwards infinite;

  /* margin: 1vh; Gives that scrolling effect as the typing happens */
}

@keyframes typing {
  from {
    width: 0ch;
  }

  to {
    width: 31ch;
  }
}

.waiting-effect {
  margin: 0 auto;
  overflow: hidden;
  /*Ensure the text is not visible until the typewriter effect */
  /* border-right: 100% solid white; The cursor */
  white-space: nowrap;
  /* Keeps the text on a single line */
  animation: waiting 2s forwards infinite;
}

@keyframes waiting {
  from {
    width: 24ch;
  }

  to {
    width: 25.6ch;
  }
}

.about-container {
  font-size: clamp(1rem, 1.5vw, 1.5rem);
  padding: 5%;
  margin-left: 10px;
  margin-right: 10px;
  /* background-image: linear-gradient(#120217,#240b2b); */
}

/* images */
.pizza-container {
  display: flex;
  margin-top: 20vh;
  margin-left: 4vw;
  margin-right: 4vw;
  justify-content: space-between;
  align-items: center;
  gap: 10vw;
}

.rotating-pizza {
  width: clamp(300px, 30vw, 400px);
  height: auto;
  animation: rotate 10s linear infinite;
}

.chickenDish-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-left: 4vw;
  margin-right: 4vw;
  height: 60vh;
  gap: 10vw;
}

.rotating-chickenDish {
  width: clamp(300px, 30vw, 400px);
  height: auto;
  animation: rotate 10s linear infinite;
}

.two-dish-container {
  display: flex;
  justify-content: space-between;
  margin-left: 4vw;
  margin-right: 4vw;
  margin-bottom: 4vw;
  gap: 10vw;
}

.rotating-double-dish1 {
  width: clamp(100px, 40vw, 400px);
  height: auto;
  /* animation: rotate 10s linear infinite; */
}

.rotating-double-dish2 {
  width: clamp(100px, 40vw, 400px);
  height: auto;
  /* animation: rotate 10s linear infinite; */
}



@keyframes rotate {
  from {
    transform: rotate(0deg);
  }

  to {
    transform: rotate(360deg);
  }
}
</style>
