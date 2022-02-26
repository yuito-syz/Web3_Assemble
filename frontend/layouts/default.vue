<template>
  <v-app>
    <app-bar />

    <drawer />

    <view />

    <footer />

  </v-app>
</template>

<script>
  import AppBar from '@/layouts/dashboard/AppBar'
  import Drawer from '@/layouts/dashboard/Drawer'
  import Footer from '@/layouts/dashboard/Footer'
  import View from '@/layouts/dashboard/View'

  export default {
    name: 'DefaultLayout',

    components: {
      AppBar,
      Drawer,
      Footer,
      View
    },
  }
</script>
