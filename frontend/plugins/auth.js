const cryptoJs = require('crypto-js')
const storage = window.localStorage
const keys = { exp: 'exp' }

class Authentication {
    constructor (ctx) {
      this.store = ctx.store
      this.$axios = ctx.$axios
      this.error = ctx.error
      this.$config = ctx.$config
    }

    encrypt (exp) {
        const expire = String(exp * 1000)
        return cryptoJs.AES.encrypt(expire, this.$config.cryptoKey).toString()
    }

    decrypt (exp) {
        try {
          const bytes = cryptoJs.AES.decrypt(exp, this.$config.cryptoKey)
          return bytes.toString(cryptoJs.enc.Utf8) || this.removeStorage()
        } catch (e) {
          return this.removeStorage()
        }
    }

    setStorage (exp) {
        storage.setItem(keys.exp, this.encrypt(exp))
    }

    removeStorage () {
        for (const key of Object.values(keys)) {
          storage.removeItem(key)
        }
    }

    getExpire () {
        const expire = storage.getItem(keys.exp)
        return expire ? this.decrypt(expire) : null
    }

    isAuthenticated () {
        return new Date().getTime() < this.getExpire()
    }

    get user () {
        return this.store.state.current.user || {}
    }
    
    isUserPresent () {
        return ('id' in this.user)
    }
    
    get loggedIn () {
        return this.isAuthenticated() && this.isUserPresent()
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

    unauthError () {
        this.removeStorage()
        throw this.error({ statusCode: 401, message: 'Unauthorized' })
    }
}
  
export default ({ store, $axios, error, $config }, inject) => {
    inject('auth', new Authentication({ store, $axios, error, $config }))
}