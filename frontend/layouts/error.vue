<template>
  <v-container fill-height>
    <v-row>
      <v-col cols="12">
        <v-card-title class="justify-center">
          {{ status }}
        </v-card-title>
        <v-card-text class="text-center">
          {{ message }}
        </v-card-text>
        <v-card-actions class="justify-center">
          <v-icon>
            mdi-emoticon-sick-outline
          </v-icon>
        </v-card-actions>
        <v-card-actions class="justify-center">
          <v-btn
            icon
            x-large
            color="myblue"
            @click="redirect"
          >
            <v-icon>
              mdi-home
            </v-icon>
          </v-btn>
        </v-card-actions>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  layout: 'none',
  props: {
    error: {
      type: Object,
      default: null
    }
  },
  computed: {
    status () {
      return this.error.statusCode
    },
    message () {
      const msg = this.error.message
      const path = `error.${msg}`
      return this.$te(path) ? this.$t(path) : msg
    }
  },
  async created () {
    if (this.status === 401) {
      await this.$auth.logout()
    }
  },
  methods: {
    redirect () {
      return this.$route.name === 'index'
        ? this.$router.go() : this.$router.push('/')
    }
  }
}
</script>