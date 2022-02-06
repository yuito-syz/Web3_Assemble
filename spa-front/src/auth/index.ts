import createAuth0Client, { Auth0Client, Auth0ClientOptions, GetIdTokenClaimsOptions, LogoutOptions, RedirectLoginOptions, User } from '@auth0/auth0-spa-js'
import { App, computed, reactive, watchEffect } from 'vue'
import { NavigationGuardNext, RouteLocationNormalized } from 'vue-router'

let client: Auth0Client

const state = reactive({
  loading: true,
  isAuthenticated: false,
  user: {} as User | undefined,
  popupOpen: false,
  error: null
})

async function loginWithPopup () {
  state.popupOpen = true

  try {
    await client.loginWithPopup()
  } catch (e) {
    console.error(e)
  } finally {
    state.popupOpen = false
  }

  state.user = await client.getUser()
  state.isAuthenticated = true
}

async function handleRedirectCallback () {
  state.loading = true

  try {
    await client.handleRedirectCallback()
    state.user = await client.getUser()
    state.isAuthenticated = true
  } catch (e) {
    state.error = e
  } finally {
    state.loading = false
  }
}

function loginWithRedirect (o: RedirectLoginOptions | undefined) {
  return client.loginWithRedirect(o)
}

function getIdTokenClaims (o: GetIdTokenClaimsOptions | undefined) {
  return client.getIdTokenClaims(o)
}

function getTokenSilently (o: GetIdTokenClaimsOptions | undefined) {
  return client.getTokenSilently(o)
}

function getTokenWithPopup (o: GetIdTokenClaimsOptions | undefined) {
  return client.getTokenWithPopup(o)
}

function logout (o: LogoutOptions | undefined) {
  return client.logout(o)
}

const authPlugin = {
  isAuthenticated: computed(() => state.isAuthenticated),
  loading: computed(() => state.loading),
  user: computed(() => state.user),
  getIdTokenClaims,
  getTokenSilently,
  getTokenWithPopup,
  handleRedirectCallback,
  loginWithRedirect,
  loginWithPopup,
  logout
}

export const routeGuard = (to: RouteLocationNormalized, from: RouteLocationNormalized, next: NavigationGuardNext) => {
  const { isAuthenticated, loading, loginWithRedirect } = authPlugin

  const verify = () => {
    if (isAuthenticated.value) {
      return next()
    }

    loginWithRedirect({ appState: { targetUrl: to.fullPath } })
  }

  if (!loading.value) {
    return verify()
  }

  watchEffect(() => {
    if (loading.value === false) {
      return verify()
    }
  })
}

export const setupAuth = async (options: Auth0ClientOptions, callbackRedirect: Function) => {
  client = await createAuth0Client({
    ...options
  })

  try {
    if (
      window.location.search.includes('code=') &&
      window.location.search.includes('state=')
    ) {
      const { appState } = await client.handleRedirectCallback()

      callbackRedirect(appState)
    }
  } catch (e) {
    state.error = e
  } finally {
    // Initialize our internal authentication state
    state.isAuthenticated = await client.isAuthenticated()
    state.user = await client.getUser()
    state.loading = false
  }

  return {
    install: (app: App) => {
      app.config.globalProperties.$auth = authPlugin
      app.provide('$auth', app.config.globalProperties.$auth)
    }
  }
}
