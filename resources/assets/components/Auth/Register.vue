<template>
  <div id="login" class="login-container">

    <p>Already registered? <router-link :to="{name: 'login'}">Log in</router-link> </p>

    <form role="form" id="register" method="POST" :action="registrationRoute">

      <input type="hidden" name="_token" :value="csrf_token">      

      <label for="name">
        <input id="name" type="text" name="name" v-model="formRegister.name"
          placeholder="Name" required autofocus>
      </label>

      <label for="email">
        <input id="email" type="email" name="email" v-model="formRegister.email"
          placeholder="Email Address" required autofocus>
        <span class="error-msg" v-if="errors.email">{{ errors.email[0] }}</span>
      </label>

      <label for="password">
        <input id="password" type="password" name="password" v-model="formRegister.password"
          placeholder="Password" required>
        <span v-if="errors.password" class="error-msg">
          <p  v-for="(err, index) in errors.password" :key="index">
          {{ err }}
          </p>
        </span>
      </label>

      <label for="password-confirm">
        <input id="password_confirm" type="password" name="password_confirmation" v-model="formRegister.password_confirmation"
          placeholder="Confirm password" required>
      </label>

      <button type="submit">Register</button>

    </form>

  </div>  
</template>

<script>
  export default {
    data() {
      return {
        csrf_token: window.csrf_token,
        formRegister: {
          name: '',
          email: '',
          password: '',
          password_confirmation: '',
          saved: [],
          created: []
        }
      }
    },

    computed: {
      registrationRoute () {
        return window.vuebnb_registration_route      },
      errors () {
        return window.vuebnb_auth_errors
      },
      request () {
        return JSON.parse(window.vuebnb_server_data)
      }
    },

    methods: {
      submit () {
      }
    }
  }
</script>

<style>
  #login form {
    padding-top: 40px;
  }

  @media (min-width: 744px) {
    #login form {
      padding-top: 80px;
    }
  }

  #login .form-control {
    margin-bottom: 1em;
  }

  #login input[type=text],
  #login input[type=email],
  #login input[type=password],
  #login button,
  #login label {
    width: 100%;
    font-size: 19px !important;
    line-height: 24px;
    color: #484848;
    font-weight: 300;
  }

  #login input {
    background-color: transparent;
    padding: 11px;
    border: 1px solid #dbdbdb;
    border-radius: 2px;
    box-sizing:border-box
  }

  #login button {
    background-color: #4fc08d;
    color: #ffffff;
    cursor: pointer;
    border: #4fc08d;
    border-radius: 4px;
    padding-top: 12px;
    padding-bottom: 12px;
  }
</style>
