export const state = () => ({
  styles: {
    beforeLogin: {
      appBarHeight: 56
    }
  },
  current: {
    user: null,
    project: null
  },
  projects: [],
  rememberRoute: {
    name: 'index',
    params: {}
  },
  toast: {
    msg: null,
    color: 'error',
    timeout: 4000
  }
})
  
export const getters = {}
  
export const mutations = {
  setCurrentProject (state, payload) {
    state.current.project = payload
  },
  setCurrentUser (state, payload) {
    state.current.user = payload
  },
  setRememberRoute (state, payload) {
    state.rememberRoute = payload
  },
  setToast (state, payload) {
    state.toast = payload
  },
  setProjects (state, payload) {
    state.projects = payload
  }
}
  
export const actions = {
  getCurrentProject ({ state, commit }, params) {
    const currentProject = state.projects.find(project => project.id === Number(params.id))
    commit('setCurrentProject', currentProject)
  },
  getCurrentUser ({ commit }, user) {
    commit('setCurrentUser', user)
  },
  getRememberRoute ({ commit }, route) {
    route = route || { name: 'index', params: {} }
    commit('setRememberRoute', { name: route.name, params: route.params })
  },
  getToast ({ commit }, toast) {
    toast.color = toast.color || 'error'
    toast.timeout = toast.timeout || 4000
    commit('setToast', toast)
  },
  getProjects ({ commit }, projects) {
    commit('setProjects', projects)
  }
}