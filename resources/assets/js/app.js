import Vue from 'vue';
import VueResource from 'vue-resource';
import App from '../components/App.vue'
import router from './router'
import store from './store'
import BootstrapVue from 'bootstrap-vue'

require('./bootstrap');

Vue.use(VueResource);
Vue.use(BootstrapVue)

var app = new Vue({
  el: '#app',
  components: { App },
  render: h => h(App),
  router,
  store
});
