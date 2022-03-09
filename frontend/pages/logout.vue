<template>
  <div />
</template>

<script>
export default {
  layout: 'none',
  async beforeCreate () {
    await this.$auth.logout()
    this.$router.replace('/')
  }
}
</script>