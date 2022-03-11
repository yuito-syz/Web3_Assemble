export default ({ $auth, route, redirect }) => {
    const loggedInUserNotAccess = ['signup', 'login']
    if ($auth.loggedIn && loggedInUserNotAccess.includes(route.name)) {
      return redirect('/')
    }
}