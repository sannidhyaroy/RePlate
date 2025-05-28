<template>
  <div class="landing-container">
    <div class="font-serif text-8xl " style="text-align: center; margin-bottom: 1rem;">
      {{ title }}
    </div>
    <div style="text-align: center">
      <div class="typing-effect">
        <b>{{ tagline }}</b>
      </div>
      <div class="about-container">
        <p>{{ about }}</p>
      </div>
    </div>

  
  <!-- contribute button -->
    <div style="display:flex; justify-content:center; margin:20px">
      <div style="margin-right: 40px" class="cook">
        <UButton class="font-bold rounded-full" color='error' variant="subtle" size="xl">
        Cook
        </UButton>
      </div>
      <UButton class="font-bold rounded-full" color="secondary" variant="subtle" size="xl">
        Contribute
      </UButton>
    </div>


    <div class="font-serif text-2xl text-green-800 " style="text-align: center; margin-bottom: 1rem; margin-top:30px">
        <USeparator color='primary' >TODAY'S SUGGESTIONS</USeparator>
    </div>

    <div>
      <UCarousel
        v-slot="{ item }"
        loop
        wheel-gestures
        :items="items"
        :ui="{ item: 'basis-1/6' }"
      >
        <img :src="item" width="200" height="234" class="rounded-lg">
      </UCarousel>
    </div>

  <!-- images -->
    <div class="pizza-container">
      <img src="/public/pizza.png" alt="Rotating Pizza" class="rotating-pizza" />
      <div style="margin-right: 50px; font-size:50px">
        <div>
          <b>DO YOU HAVE ANY</b>
        </div>
        <div>
          <b>LEFTOVER INGREDIENTS</b>
        </div>
      </div>
    </div>

    <div class="chickenDish-container">
      <div style="margin-left: 50px; font-size:50px">
        <div>
          <b>CONVERT THEM INTO</b>
        </div>
        <div>
          <b>TASTY MEAL OF YOUR CHOICE</b>
        </div>
      </div>
      <img src="/public/chicken.png" alt="Rotating chicken dish" class="rotating-chickenDish"/>
    </div>
    
    <div style="display:flex; justify-content: space-between">
      <div class="seafoodNoodles-container">
      <img src="/public/Seafood-Noodles.png" class="rotating-seafoodNoodles"/>
      </div>
      <div class="seafoodPasta-container">
        <img src="/public/Seafood-Pasta.png" class="rotating-seafoodPasta"/>
      </div>
    </div>
    
    <!-- <div class="taglia-container">
      <img src="/public/Tagliatelle.png" class="rotating-taglia"/>
    </div> -->
</div>
<UCard>
  <div style="font-size: 13px; display: flex; justify-content: start;">
    <div style="margin-right: 10px">
      <p>
        Check out the
        <ULink to="https://github.com/sannidhyaroy/RePlate" target="_blank">GitHub repository</ULink>
        of {{ title }} to learn more.
      </p>
    </div>
  </div>
  <div style="font-size: 13px">
    <p class="license">
      {{ title }} is licensed under the
      <ULink to="https://github.com/sannidhyaroy/RePlate/blob/main/LICENSE" target="_blank" class="license-link">GNU General
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
  about:string;
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
  background-image: linear-gradient(#06031f,#111247,#c45f00, #d1c156);
  max-width: 100vw;
  overflow-x: hidden;
}
.pizza-container {
  display: flex;
  margin-top: 80px;
  margin-left: 30px;
  justify-content: space-between;
  align-items: center;
  height: 60vh;
}
.rotating-pizza {
  width: 500px;
  height: 500px;
  animation: rotate 10s linear infinite;
}

.chickenDish-container{
  display:flex;
  justify-content: space-between;
  align-items: center;
  height: 60vh
}

.rotating-chickenDish{
  width: 500px;
  height: 500px;
  animation: rotate 10s linear infinite;
}

.seafoodNoodles-container {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-left: 70px;
  height: 100vh
}
.rotating-seafoodNoodles {
  width: 400px;
  height: 400px;
  animation: rotate 10s linear infinite;
}

.seafoodPasta-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}
.rotating-seafoodPasta {
  width: 600px;
  height: 600px;
  animation: rotate 10s linear infinite;
}

/* .taglia-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh
}
.rotating-taglia {
  width: 300px;
  height: 300px;
  animation: rotate 10s linear infinite;
} */

@keyframes rotate {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}
.typing-effect {
    width: 40;
    font-size:35px;
    overflow: hidden; /* Ensure the text is not visible until the typewriter effect*/
    border-right: 2px solid white; /* The cursor*/
    white-space: nowrap; /* Keeps the text on a single line */
    animation: typing 5s forwards infinite;
  }
  @keyframes typing {
  from { width: 0% ; margin-left: 500px}
  to { width: 39% ; margin-left: 500px}
  }
  .about-container {
    padding: 5px;
    margin-left: 100px; 
    margin-right: 100px;
    /* background-image: linear-gradient(#120217,#240b2b); */
  }
</style>

