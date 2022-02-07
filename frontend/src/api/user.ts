/* eslint-disable @typescript-eslint/camelcase */

import Client from '@/api/client'
import {
  getAuthDataFromStorage,
  setAuthDataFromResponse
} from '@/utils/auth-data'
import { AxiosResponse } from 'axios'
import { User } from '@/types/user'
import { CurrentOtp } from '@/types/current_otp'

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

export const createQrCode = async () => {
  return await Client.post('/users/two_factor_auth', {}, { headers: getAuthDataFromStorage() })
    .then((res: AxiosResponse<CurrentOtp>) => {
      setAuthDataFromResponse(res.headers)
      return res
    })
    .catch((err) => {
      return err.response
    })
}

export const verifyOtpCode = async (otp_code: string) => {
  return await Client.post('/users/two_factor_auth', { otp_code }, { headers: getAuthDataFromStorage() })
    .then((res: AxiosResponse<CurrentOtp>) => {
      setAuthDataFromResponse(res.headers)
      return res
    })
    .catch((err) => {
      return err.response
    })
}
