export default async ({ $auth, store, $axios }) => {
    if ($auth.loggedIn && !store.state.projects.length) {
      await $axios.$get('/api/v1/projects')
        .then(response => store.dispatch('getProjects', response))
    }
}