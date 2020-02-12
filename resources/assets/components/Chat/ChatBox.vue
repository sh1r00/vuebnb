<<template>
    <div class="chat-box-container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Chats
                    </div>
                    <div class="panel-body">
                        <chat-messages :messages="messages"></chat-messages>
                    </div>
                    <div class="panel-footer">
                        <chat-form
                            v-on:messageSent="addMessage"
                            :user="user.auth"
                        ></chat-form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
import Echo from "laravel-echo"
import ChatMessages from './ChatMessages.vue'
import ChatForm from './ChatForm.vue'

export default {
    props: {
        chatWith: Object
    },
    components: {
        ChatMessages,
        ChatForm
    },
    data() {
        return {
            user: this.$store.state.user,
            messages: [],
            chatroom: {
                id: 1 // this.user.id + this.chatWith.id
            }
        }
    },
    created() {
        this.fetchMessages();
        let chatroom = 1
        this.Echo.join(`chat-.${chatroom}`)
            .here((users) => {
                this.usersInRoom = users
            })
            .joining((user) => {
                this.usersInRoom.push(user);
            })
            .leaving((user) => {
                this.UsersInRoom = this.usersInRoom.filter(u => u != user)
            })
            .listen('MessageSent', (e) => {
                this.messages.push({
                    message: e.message.message,
                    user: e.user
                })
            })
    },
    methods: {
        fetchMessages() {
            let chatroom = this.chatroom
            axios.get('/chat/messages/' + chatroom.id).then(response => {
                this.messages = response.data
            })
        },
        addMessage(message) {
            let chatroom = this.chatroom
            this.messages.push(message)
            console.log('payload', message)
            axios.post('/chat/messages/' + chatroom.id, message).then(response => {
            })
        }
    }
}
</script>

<style>
.chat-box-container {
    background: white;
}
.chat {
  list-style: none;
  margin: 0;
  padding: 0;
}
.chat li {
  margin-bottom: 10px;
  padding-bottom: 5px;
  border-bottom: 1px dotted #B3A9A9;
}
.chat li .chat-body p {
  margin: 0;
  color: #777777;
}
.panel-body {
  overflow-y: scroll;
  height: 350px;
}
::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
  background-color: #F5F5F5;
}
::-webkit-scrollbar {
  width: 12px;
  background-color: #F5F5F5;
}
::-webkit-scrollbar-thumb {
  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
  background-color: #555;
}
</style>