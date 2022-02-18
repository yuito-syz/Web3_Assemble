<template>
  <alert show variant="danger">
    <div v-for="m in message" :key="m.id">
      <span>{{ m }}</span>
    </div>
  </alert>
</template>

<script>
export default {
  name: 'Notification',
  props: ['message']
}
</script>