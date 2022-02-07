import { inject } from 'vue'
import { authStateKey } from '@/state/global-state'

export const useState = () => {
  const state = inject(authStateKey)

  if (!state) {
    throw new Error('failed inject state')
  }

  return state
}
