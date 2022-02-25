<template>
  <v-footer
    id="footer"
    color="transparent"
    absolute
    app
    inset
  >
    <links />
  </v-footer>
</template>

<script>
  // Components
  import Links from '@/components/dashboard/Links'

  export default {
    name: 'Footer',

    components: { Links },
  }
</script>
