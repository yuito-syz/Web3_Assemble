<template>
  <v-app-bar
    app
    dense
    elevation="1"
    clipped-left
    color="white"
  >
    <nuxt-link
      to="/"
      class="text-decoration-none"
    >
      <app-logo />
    </nuxt-link>

    <app-title />
  </v-app-bar>
</template>

<script>
export default {
}
</script>