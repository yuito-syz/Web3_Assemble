import Client from '@/api/client'
import {
  getAuthDataFromStorage,
  setAuthDataFromResponse
} from '@/utils/auth-data'
import { AxiosResponse } from 'axios'
import { User } from '@/types/user'

export const getAccount = async () => {
  return await Client.get('/users/account', { headers: getAuthDataFromStorage() })
    .then((res: AxiosResponse<User>) => {
      setAuthDataFromResponse(res.headers)
      return res
    })
    .catch((err) => {
      return err.response
    })
}