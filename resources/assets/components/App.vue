<!--

NAME:
  App

TYPE:
  Vue Single File Component 

PURPOSE:  
  Main page of this app

PARENT:
  none

CHILDREN:
  (toolbar), RouterView, CustomFooter

-->
<template>
  <v-app>
    <nav-bar></nav-bar>
    
    <v-content>
      <router-view></router-view>
    </v-content>

    <custom-footer></custom-footer>
    <chat-nav></chat-nav>

  </v-app>  
</template>


<script>
import NavBar from "./Nav/NavBar.vue"
import ChatNav from "./Chat/ChatNav.vue"
import CustomFooter from './CustomFooter.vue'

  export default {
    components: {
      NavBar,
      CustomFooter,
      ChatNav
    },
    data () {
      return {
        drawer: false
      }        
    }
  }
</script>
