import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

import router from './router'

import axios from 'axios'
// attach to all axios requests
axios.defaults.headers.common = {
  'X-Requested-With': 'XMLHttpRequest',
  'X-CSRF-TOKEN': window.csrf_token  
}

export default new Vuex.Store({
  state: {
    user: {
      auth: false,
      id: '',
      name: '',
      email: '',
      created: [],
      saved: [],
      comments: []
    },
    loading: false,
    loading_id: null,
    listing_summaries: [],
    listings: [],
    serverData: []
  },

  mutations: {
    toggleSaved(state, id) {
      // try to find this id in the array
      let index = state.user.saved.findIndex(saved => saved === id);
      // if not found, push it into the array
      if (index === -1) {
        state.user.saved.push(id);
        // if found, remove it from the array
      } else {
        state.user.saved.splice(index, 1);
      }
      state.loading = false
    },
    addCreated(state, created) {
      state.user.created.push(created)
      state.loading = false
    },
    addData(state, { route, data }) {
      // save authentication data from the host
      if (data.auth) {
        state.user.auth = data.auth;
        console.log('userAuth:', this.state.user.auth)
      }
      // push the new data into the Vuex store
      if (route === 'listing') {
        state.listings.push(data.listing);
      } else {
        state.listing_summaries = data.listings;
      }
    },
    addUserData(state, serverData) {
      state.user.id = serverData.userId;
      state.user.name = serverData.name;
      state.user.email = serverData.email;
      console.log('user:', this.state.user)

    }
  },

  actions: {
    toggleSaved ({ commit, state }, id) {
      // only if user is logged in
      if (state.user.auth) {
        state.loading = true
        state.loading_id = id
        axios.post('/user/toggle_saved', { id })
          .then(
            () => commit('toggleSaved', id)
          )
      } else {
        router.push('/login')
      }
    }
  },

  getters: {
    getListing (state) {
      return id => state.listings.find(listing => id == listing.id)
    },
    getUser (state) {
      return state.user
    }
  }

})
