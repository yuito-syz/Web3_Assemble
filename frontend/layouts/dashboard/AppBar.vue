<template>
  <v-app-bar
    id="default-app-bar"
    app
    absolute
    class="v-bar--underline"
    color="transparent"
    :clipped-left="$vuetify.rtl"
    :clipped-right="!$vuetify.rtl"
    height="70"
    flat
  >
    <v-app-bar-nav-icon
      class="hidden-md-and-up"
      @click="drawer = !drawer"
    />

    <drawer-toggle class="hidden-sm-and-down" />

    <v-toolbar-title
      class="font-weight-light text-h5"
      v-text="Dashboard"
    />

    <v-spacer />

    <search class="hidden-sm-and-down" />

    <go-home />

    <notifications />

    <account />
  </v-app-bar>
</template>

<script>
  // Utilities
  import { sync } from 'vuex-pathify'
  import Account from '@/layouts/dashboard/widgets/Account'
  import DrawerToggle from '@/layouts/dashboard/widgets/DrawerToggle'
  import GoHome from '@/layouts/dashboard/widgets/GoHome'
  import Notifications from '@/layouts/dashboard/widgets/Notifications'
  import Search from '@/layouts/dashboard/widgets/Search'



  export default {
    name: 'DefaultBar',

    components: {
      Account,
      DrawerToggle,
      GoHome,
      Notifications,
      Search
    },

    computed: {
      ...sync('app', [
        'drawer',
        'mini',
      ])
    },
  }
</script>
