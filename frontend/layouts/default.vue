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
  import AppBar from '@/layouts/dashboard/Appbar'
  import Drawer from '@/layouts/dashboard/Drawer'
  import Footer from '@/layouts/dashboard/Footer'
  import Setting from '@/layouts/dashboard/Settings'
  import View from '@/layouts/dashboard/View'

  export default {

    components: {
      AppBar,
      Drawer,
      Footer,
      Setting,
      View
    },
  }
</script>
