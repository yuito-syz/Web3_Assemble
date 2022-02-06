import dateClient from '@/modules/date-client'

export const formatDate = (date: string) => {
  return dateClient(date).format('YYYY/MM/DD')
}
