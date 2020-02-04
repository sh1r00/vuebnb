import Vue from 'vue';
import VueResource from 'vue-resource';
import vuetify from './plugins/vuetify.js'
import App from '../components/App.vue';
import router from './router';
import store from './store';

require('./bootstrap');

// Access window object for Echo
Vue.prototype.Echo = window.Echo

// Vue.use(BootstrapVue)
Vue.use(VueResource);

var app = new Vue({
  vuetify,
  el: '#app',
  components: { App },
  render: h => h(App),
  router,
  store
});
