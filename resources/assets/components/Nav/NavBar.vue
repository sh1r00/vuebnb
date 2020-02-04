<template>
    <div>
        <v-navigation-drawer
            v-model="sidebar" 
            disable-resize-watcher="true"
            app
        >
            <v-list>
                <v-list-item
                    v-for="item in menuItems"
                    :key="item.title"
                    :to="item.path"
                >
                    <v-list-item-action>
                        <v-icon>
                            {{ item.icon }}
                        </v-icon>
                    </v-list-item-action>
                    <v-list-item-content>
                        {{ item.title }}
                    </v-list-item-content>
                </v-list-item>
            </v-list>
        </v-navigation-drawer>

        <v-app-bar app>
            <span class="hidden-sm-and-up">
                <v-app-bar-nav-icon @click="sidebar = !sidebar">
                </v-app-bar-nav-icon>
            </span>
            <v-toolbar-title class="navbar-brand">
                <router-link 
                    :to="{name: 'home'}"
                >
                    <img
                        class="navbar-brand-icon"
                        :src="logoUrl"
                    >
                    <h1 class="navbar-brand-text"> Vuebnb </h1>
                </router-link>
            </v-toolbar-title>

            <v-spacer></v-spacer>

            <v-toolbar-items class="hidden-xs-only">
                <span v-if="authenticated">
                    <v-btn
                        class="navbar-btn"
                        text
                        v-for="item in menuItems"
                        :key="item.title"
                        :to="item.path"
                    >
                        <v-icon left dark>
                            {{ item.icon }}
                        </v-icon>
                        {{ item.title }}
                    </v-btn>
                </span>
                <v-btn
                    v-if="!authenticated"
                    :to="{name: 'login'}"
                >
                    Login
                </v-btn>
                <v-btn
                    v-if="authenticated"
                    @click="logout"
                >
                    Logout
                    <form
                        style="display: hidden"
                        action="/logout"
                        method="post"
                        id="logout"
                    >
                        <input
                            type="hidden"
                            name="_token"
                            :value="csrf_token"
                        >
                    </form>
                </v-btn>

                <avatar-drop-down></avatar-drop-down>

            </v-toolbar-items>
        </v-app-bar>
    </div>
</template>

<script>
import AvatarDropDown from "./AvatarDropDown.vue"
export default {
    components: {
        AvatarDropDown
    },
    data() {
        return {
            sidebar: false,
            menuItems: [
                { title: 'All Listings', path: '/', icon: 'mdi-home'},
                { title: 'Saved Listings', path: '/favs', icon: 'mdi-heart' },
                { title: 'Create Listing', path: '/create', icon: 'mdi-lead-pencil'},
                { title: 'Profile', path: '/profile', icon: 'mdi-face'}
            ],
            item: {},
            csrf_token: window.csrf_token
        }
    },
    computed: {
        authenticated() {
            return this.$store.state.user.auth
        },
        routeName() {
            return this.$route.name
        },
        savedCount() {
            return this.$store.state.user.saved.length
        },
        logoUrl() {
            return `${window.cdn_url || ''}images/logo.png`
        }
    },
    methods: {
        logout() {
            document.getElementById('logout').submit()
        }
    }
}
</script>

<style>
  .navbar-brand {
    display: flex;
    justify-content: space-between;
    height: auto;
    border-bottom: 1px solid #e4e4e4;
    box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
  }

  .navbar-brand-icon {
    height: 2em;
    padding: 0;
    margin: 0;
    display: inline-block;
  }

  .navbar-brand-text {
    padding: 0;
    margin: 0;
    color: #4fc08d;
    display: inline-block;
    font-size: 1em;
    margin: 0;
  }
  
  .navbar-btn {
      height: 100% !important;
  }
</style>