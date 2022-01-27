import Client from '@/api/client'
import { User } from '@/types/user'
import {
  getAuthDataFromStorage,
  removeAuthDataFromStorage,
  setAuthDataFromResponse
} from '@/utils/auth-data'
import { AxiosResponse, AxiosError } from 'axios'

export const login = async (email: string, password: string) => {
  return await Client.post<User>('/auth/sign_in', { email, password })
    .then((res: AxiosResponse<User>) => {
      setAuthDataFromResponse(res.headers)
      return res
    })
    .catch((err: AxiosError) => {
      return err.response
    })
}

export const logout = async () => {
  return await Client.delete('/auth/sign_out', { headers: getAuthDataFromStorage() })
    .then(() => {
      removeAuthDataFromStorage()
    })
}