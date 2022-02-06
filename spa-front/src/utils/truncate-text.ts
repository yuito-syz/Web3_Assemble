const TruncateTargetLength = 96

export const truncateText = (text: string) => {
  if (text.length >= TruncateTargetLength) {
    return text.substring(0, TruncateTargetLength) + '...'
  } else {
    return text
  }
}
