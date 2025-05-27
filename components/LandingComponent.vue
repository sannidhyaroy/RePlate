<template>
  <div>
    <NuxtLink to="/" class="logo">
      <img src="../public/favicon.ico" class="logo favicon" alt="logo">
    </NuxtLink>
  </div>
  <h1>{{ title }}</h1>
  <p>{{ tagline }}</p>

  <div class="card">
    <UButton to="/signup" class="signup-button button">Sign Up</UButton>
    <UButton
      to="/login" class="login-button button" color="neutral" trailing-icon="i-lucide-arrow-right" variant="subtle">Login
    </UButton>
  </div>

  <p>
    Check out the
    <a href="https://github.com/sannidhyaroy/RePlate" target="_blank">GitHub repository</a>
    of {{ title }} to learn more.
  </p>
  <p class="license">
    {{ title }} is licensed under the
    <a href="https://github.com/sannidhyaroy/RePlate/blob/main/LICENSE" target="_blank" class="license-link">GNU General
      Public License (GPL) v3.0</a>
    license.
  </p>
</template>

<script lang="ts" setup>
defineProps<{
  title: string;
  tagline: string;
}>();
</script>
