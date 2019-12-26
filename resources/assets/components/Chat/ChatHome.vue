<<template>
    <div class="container">
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
    components: {
        ChatMessages,
        ChatForm
    },
    data() {
        return {
            user: this.$store.state.user,
            messages: [],
        }
    },
    created() {
        this.fetchMessages();
        window.Echo.private('chat')
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
            axios.get('/chat/messages').then(response => {
                console.log(response)
                this.messages = response.data
            })
        },
        addMessage(message) {
            this.messages.push(message)
            axios.post('/chat/messages', message).then(response => {
                console.log(response.data)
            })
        }
    }
}
</script>

<style lang="scss">

// Body
$body-bg: #f5f8fa;

// Borders
$laravel-border-color: darken($body-bg, 10%);
$list-group-border: $laravel-border-color;
$navbar-default-border: $laravel-border-color;
$panel-default-border: $laravel-border-color;
$panel-inner-border: $laravel-border-color;

// Brands
$brand-primary: #3097D1;
$brand-info: #8eb4cb;
$brand-success: #2ab27b;
$brand-warning: #cbb956;
$brand-danger: #bf5329;

// Typography
$icon-font-path: "~bootstrap-sass/assets/fonts/bootstrap/";
$font-family-sans-serif: "Raleway", sans-serif;
$font-size-base: 14px;
$line-height-base: 1.6;
$text-color: #636b6f;

// Navbar
$navbar-default-bg: #fff;

// Buttons
$btn-default-color: $text-color;

// Inputs
$input-border: lighten($text-color, 40%);
$input-border-focus: lighten($brand-primary, 25%);
$input-color-placeholder: lighten($text-color, 30%);

// Panels
$panel-default-heading-bg: #fff;

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
</style>Z