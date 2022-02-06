/* eslint-disable @typescript-eslint/camelcase */
import { reactive, InjectionKey } from 'vue'
import { AccessToken, AuthHeaders } from '@/types/auth'

export const globalAuthState = () => {
  const authState = reactive<AccessToken>({
    'access-token': localStorage.getItem('access-token')
  })

  const setAuthState = (headers: AuthHeaders) => {
    authState['access-token'] = headers['access-token']
  }

  const removeAuthState = () => {
    authState['access-token'] = null
  }

  return {
    authState,
    setAuthState,
    removeAuthState
  }
}

export type authStateType = ReturnType<typeof globalAuthState>;

export const authStateKey: InjectionKey<authStateType> = Symbol('useAuthState')
