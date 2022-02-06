<template>
    <NavBar />
    <div class='container mx-auto'>
      <router-view/>
    </div>
</template>

<script lang='ts'>
import { defineComponent } from 'vue'
import NavBar from '@/components/NavBar.vue'

export default defineComponent({
  components: {
    NavBar
  }
})
</script>

<style lang="scss">

</style>
