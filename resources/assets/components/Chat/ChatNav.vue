<template>
    <div
        class="chat-nav-container"
    >
        <div class="tab-view">
            <component
                tag="div"
                :is="selected.componentName"
                :data="selected.value"
                @chatWith="chatingWith"
            ></component>
        </div>
        <v-tabs class="chat-nav">
            <v-tab
                v-for="tab in tabs"
                :key="tab.id"
                @click="selectedTab(tab)"
                :class="['nav-item', {active:selected.name === tab.name}]"
                :aria-controls="tab.aria.controls"
                :aria-selected="tab.aria.selected"
            >
                <sup v-if="tab.count">
                    {{ tab.count }}
                </sup>
                {{ tab.name }}
            </v-tab>
        </v-tabs>
    </div>
</template>

<script>
import ChatHome from './ChatHome.vue'
import ChatFriends from './ChatFriends'

export default {
    components: {
        ChatHome,
        ChatFriends
    },
    data() {
        return {
            tabs: [
                {
                    name: 'Chats',
                    componentName: 'ChatHome',
                    count: 1 || this.$store.state.user.chats,
                    value: [
                        {
                            name: 'test',
                            new: [{
                                message: 'testing new message'
                            }]
                        },
                    ],
                    aria: {
                        controls: 'chat',
                        selected: false
                    }
                },
                {
                    name: 'Friends',
                    componentName: 'ChatFriends',
                    count: this.$store.state.user.friends,
                    value: [
                        {
                            name: 'test',
                            img: '#',
                            online: true,
                        }
                    ],
                    aria: {
                        controls: 'chat',
                        selected: false
                    }
                }
            ],
            selected: {},
        }
    },
    methods: {
        selectedTab(tab){
            if (tab === this.selected) {
                this.selected = {}
            } else {
                this.selected = tab
            }
        },
        chatingWith(payload) {
            this.selected = this.tabs[0]
            console.log('payload ', payload)
            this.$emit('chatting with', payload)
        },
    }
}
</script>

<style>
.chat-nav-container {
    position: fixed;
    bottom: 0;
    justify-content: right;
    width: 100%;
    margin-top: 1em
}

.chat-nav {
    position: static;
    right: 0;
}
.chat-nav nav {
    right: 0;
}
</style>