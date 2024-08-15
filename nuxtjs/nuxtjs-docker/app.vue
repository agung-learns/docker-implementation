<script setup lang="ts">
const config = useRuntimeConfig();
const appUrl = config.public.appUrl;
</script>

<template>
  <div>
    <NuxtRouteAnnouncer />
    <div>
      <p>APP_URL: {{ appUrl }}</p>
    </div>
    <NuxtWelcome />
  </div>
</template>
