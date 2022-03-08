export default async ({ $auth, $axios, store }) => {
    if ($auth.isAuthenticated()) {
      await $axios.$get('/api/v1/users/current_user')
        .then(tokenUser => store.dispatch('getCurrentUser', tokenUser))
        .catch(() => $auth.removeStorage())
    }
}