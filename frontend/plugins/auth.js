const storage = window.localStorage
const keys = { exp: 'exp' }

class Authentication {
    constructor (ctx) {
      this.store = ctx.store
      this.$axios = ctx.$axios
    }

    setStorage (exp) {
        storage.setItem(keys.exp, exp * 1000)
    }

    removeStorage () {
        for (const key of Object.values(keys)) {
          storage.removeItem(key)
        }
    }

    getExpire () {
        return storage.getItem(keys.exp)
    }

    isAuthenticated () {
        return new Date().getTime() < this.getExpire()
    }

    login ({ exp, user }) {
        this.setStorage(exp)
        this.store.dispatch('getCurrentUser', user)
    }

    logout () {
        this.$axios.$delete('/api/v1/user_token')
        this.removeStorage()
        this.store.dispatch('getCurrentUser', null)
    }
}
  
export default ({ store, $axios }, inject) => {
    inject('auth', new Authentication({ store, $axios }))
}