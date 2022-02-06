/* eslint-disable @typescript-eslint/camelcase */
import Client from '@/api/client'
import {
  getAuthDataFromStorage,
  removeAuthDataFromStorage,
  setAuthDataFromResponse
} from '@/utils/auth-data'
import { AxiosError, AxiosResponse } from 'axios'
import { User } from '@/types/user'

export const login = async (email: string, password: string, otp_code: string) => {
  return await Client.post('/auth/sign_in', { email, password, otp_code })
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

export const validateToken = async () => {
  return await Client.get('/auth/validate_token', { headers: getAuthDataFromStorage() })
    .then((response) => {
      setAuthDataFromResponse(response.headers)
      return response.data
    })
}
