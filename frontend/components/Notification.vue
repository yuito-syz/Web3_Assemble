<template>
  <v-alert type="error">
    <div v-for="m in message" :key="m.id">
      <span>{{ m }}</span>
    </div>
  </v-alert>
</template>

<script>
export default {
  name: 'Notification',
  props: ['message']
}
</script>