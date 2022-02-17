<template>
  <v-app>
    <wel-app-bar/>
    

    <v-content>
      
      <wel-first-view/>

      <wel-about/>

      <wel-features/>

      <wel-stats/>

      <wel-blog/>

      <wel-contact/>
      
    </v-content>

    <bef-login-footer/>
  </v-app>
</template>

<script>
  import welAppBar from '../components/welcome/welAppBar'
  import welFirstView from '../components/welcome/welFirstView.vue'
  import welAbout from '../components/welcome/welAbout'
  import welFeatures from '../components/welcome/welFeatures'
  import welStats from '../components/welcome/welStats'
  import welBlog from '../components/welcome/welBlog.vue'
  import welContact from '../components/welcome/welContact'
  import befLoginFooter from '../components/beforeLogin/befLoginFooter'

  export default {
    components: { 
      welAppBar, welFirstView, welFeatures, 
      welAbout, welStats, welBlog, welContact, 
      befLoginFooter
    },
    head() {
      
    }
    // ...
  }
</script>

<style>
  .red {
    color: red;
  }
</style>

