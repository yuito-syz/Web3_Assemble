import { reactive, InjectionKey } from 'vue'
import { AuthHeaders, AccessToken } from '@/types/auth'

export const globalAuthState = () => {

  // リアクティブなプロパティとしてstateを定義。初期値はlocalStorageにアクセストークンが保存されていればトークンが、なければnull
  const authState = reactive<AccessToken>({
    'access-token': localStorage.getItem('access-token')
  })

  // authStateのaccess-tokenに、引数で与えられたHttpResponseHeaderの中のaccess-tokenを代入する処理。ログイン時にcallする
  const setAuthState = (headers: AccessToken) => {
    authState['access-token'] = headers['access-token']
  }

  // authStateのaccess-tokenをnullにする処理。ログアウト時にcallする
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