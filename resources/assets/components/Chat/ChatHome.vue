<template>
    <div class="chat-view">
        <ul class=chats-list>
            <div
                v-for="chat in chats"
                :key="chat.id"
                @click="selectChat(chat)"
                tag="li"
                :class="['chat-with', {active:selected === chat.name}]"
            >
                <sup v-if="chat.new">
                    ({{ chat.new.length }})
                </sup>
                {{ chat.name }}
            </div>
        </ul>
        <chat-box :class="['chat-box', {active:selected === chat.name}]" :chat="chat"></chat-box>
    </div>
</template>

<script>
import ChatBox from './ChatBox'
export default {
    components: {
        ChatBox
    },
    props: {
        data: {
            type: Array,
            required: true,
            default: {}
        }
    },
    data () {
        return {
            chats: this.data,
            chat: {},
            selected: ''
        }
    },
    methods: {
        selectChat(chat) {
            this.chat = chat
            let selected = this.chat.name
        }
    }
}
</script>

<style>
.chat-view {
    position: fixed;
}
.chat-list {
    width: auto;
    justify-content: right;
}
.chat-with {
    width: 100%;
    right: 0;
}
.chat-with :active {
    width: 10%;
}
.chat-box {
    width: 0;
}
.chat-box :active {
    width: 90%;
}
</style>
