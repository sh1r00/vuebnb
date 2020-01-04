import Vue from 'vue';
import VueResource from 'vue-resource';
//import BootstrapVue from 'bootstrap-vue';
import vuetify from './plugins/vuetify.js'
import App from '../components/App.vue';
import router from './router';
import store from './store';

//import "bootstrap/dist/css/bootstrap.min.css"
//import "bootstrap-vue/dist/bootstrap-vue.css"

require('./bootstrap');

//Vue.use(BootstrapVue)
Vue.use(VueResource);

var app = new Vue({
  vuetify,
  el: '#app',
  components: { App },
  render: h => h(App),
  router,
  store
});
