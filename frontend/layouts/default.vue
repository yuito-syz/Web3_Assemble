<template>
  <v-app>
    <app-bar />

    <drawer />

    <view />

    <footer />

    <settings />
  </v-app>
</template>

<script>
  import AppBar from '@/layouts/dashboard/AppBar'
  import Drawer from '@/layouts/dashboard/Drawer'
  import Footer from '@/layouts/dashboard/Footer'
  import Settings from '@/layouts/dashboard/Settings'
  import View from '@/layouts/dashboard/View'

  export default {
    name: 'DefaultLayout',

    components: {
      AppBar,
      Drawer,
      Footer,
      Settings,
      View
    },
  }
</script>
