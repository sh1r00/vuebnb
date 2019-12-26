import Vue from 'vue';

import VueRouter from 'vue-router';
Vue.use(VueRouter);

import LoginPage from '../components/Auth/LoginPage.vue'
import Register from '../components/Auth/Register.vue'

import ListingItemCreate from '../components/Listings/ListingItemCreate.vue'
import ListingCreate from '../components/Listings/ListingCreate.vue'
import ListingItemComment from '../components/Listings/listingItemComment'
import ListingPage from '../components/Listings/ListingPage.vue'
import HomePage from '../components/Listings/HomePage.vue'
import ProfileFavs from '../components/Profile/ProfileFavs.vue'
import ProfilePage from '../components/Profile/ProfilePage.vue'
import ChatHome from '../components/Chat/ChatHome.vue'



import axios from 'axios';
import store from './store';

let router = new VueRouter({

  mode: 'history',

  routes: [
    {
      path: '/',
      component: HomePage,
      name: 'home' 
    },
    {
      path: '/register',
      component: Register,
      name: 'register'
    },
    {
      path: '/login',
      component: LoginPage,
      name: 'login' 
    },
    { 
      path: '/listings/:listing',
      component: ListingPage,
      name: 'listing'
    },
    {
      path: '/listings/:listing/:listingItem',
      component: ListingItemComment,
      name: 'listingItemComment'
    },
    {
      path: '/favs',
      component: ProfileFavs,
      name: 'favs'
    },
    {
      path: '/create',
      component: ListingCreate,
      name: 'create'
    },
    {
      path: '/listingItemCreate',
      component: ListingItemCreate,
      name: 'listingItemCreate'
    },
    {
      path: '/profile',
      component: ProfilePage,
      name: 'profilePage'
    },
    {
      path: '/chat',
      component: ChatHome,
      name: 'ChatHome'
    }
  ]

});

// before each route change (or page reload),
// make sure we have the relvant data for the page
router.beforeEach((to, from, next) => { 
  // read the data delivered in the header of the page (if any)
  let serverData = window.vuebnb_server_data ? JSON.parse(window.vuebnb_server_data) : null
  store.state.serverData = serverData
  store.commit('addUserData', serverData)
  // first check if we already have the requested data in the store!
  if (
    to.name === 'listing'
      ? store.getters.getListing(to.params.listing)
      : store.state.listing_summaries.length > 0
    || to.name === 'login'
    || to.name === 'register'
  ) {
    next()
  }

  // if there was no data, we need to get it via an AJAX call  
  else if (!serverData.path || to.path !== serverData.path) {
    store.state.loading = true
    axios.get(`/api${to.path}`)
      .then(({ data }) => {
        console.log('addData: ', data)
        store.commit('addData', { route: to.name, data })
        store.state.loading = false
        next();
      })
  }
  // save the data from the HEAD section into our Vuex State
  else {
    store.commit('addData', { route: to.name, data: serverData })
    if (serverData.saved) {
      serverData.saved.forEach(id => store.commit('toggleSaved', id))
    }
    if (serverData.created) {
      serverData.created.forEach(id => store.commit('addCreated', id))
    }
    next()
  }
})

export default router
