export default async ({ $auth, store, route, redirect }) => {
  if (route.name === 'index' && !$auth.isUserPresent()) {
    return false
  }

  if (!$auth.isAuthenticated()) {
    let msg = 'ログインが必要です'

    if ($auth.isUserPresent()) {
      msg = 'もう一度ログインしてください'
      await $auth.logout()
    } else {
      store.dispatch('getRememberRoute', route)
    }

    console.log(msg)
    return redirect('/login')

    } else if (!$auth.isUserPresent()) {
        return $auth.unauthError()
  }
}