import Client from '@/api/client'
import {
  getAuthDataFromStorage,
  getAuthDataFromStorageWithFormData
} from '@/utils/auth-data'
import { AxiosResponse } from 'axios'
import { Post } from '@/types/post'

export const getPosts = async () => {
  return await Client.get('/posts', { headers: getAuthDataFromStorage() })
    .then((response) => {
      return response.data
    })
    .catch((err) => {
      console.log(err)
    })
}

export const getPost = async (id: string) => {
  return await Client.get(`/posts/${id}`, { headers: getAuthDataFromStorage })
    .then((response) => {
      return response.data
    })
}

export const createPost = async (formData: FormData) => {
  return await Client.post(
    '/posts', formData,
    {
      headers: getAuthDataFromStorageWithFormData()
    }
  )
    .then((res: AxiosResponse<Post>) => {
      return res.data
    })
}