<template>
  <list
    :items="items"
    class="mb-n2"
  />
</template>

<script>
  import List from '@/layouts/dashboard/List'
  export default {
    name: 'AccountSettings',

    components: {
      List
    },

    data: () => ({
      items: [
        {
          title: 'John Leider',
          icon: 'mdi-vuetify',
          items: [
            {
              title: 'My Profile',
            },
            {
              title: 'Edit Profile',
            },
            {
              title: 'Settings',
            },
          ],
        },
      ],
    }),
  }
</script>
