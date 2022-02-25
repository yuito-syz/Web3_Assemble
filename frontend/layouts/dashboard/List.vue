<template>
  <v-list
    expand
    nav
    v-bind="$attrs"
    v-on="$listeners"
  >
    <template v-for="(item, i) in items">
      <list-group
        v-if="item.items"
        :key="`group-${i}`"
        :item="item"
      />

      <list-item
        v-else
        :key="`item-${i}`"
        :item="item"
      />
    </template>
  </v-list>
</template>

<script>
  import ListGroup from '@/layouts/dashboard/ListGroup'
  import ListItem from '@/layouts/dashboard/ListItem'

  export default {
    name: 'List',

    components: {
      ListGroup,
      ListItem
    },

    props: {
      items: {
        type: Array,
        default: () => ([]),
      },
    },
  }
</script>
