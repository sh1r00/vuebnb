<template>
  <div id="login" class="login-container">

    <p>Don't have an account? <router-link :to="{name: 'register'}">Create your own account</router-link> </p>

    <form role="form" method="POST" :action="loginRoute">

      <input type="hidden" name="_token" :value="csrf_token">      

      <label for="email">
        <input id="email" type="email" name="email" 
          placeholder="Email Address" required autofocus>
        <span class="error-msg" v-if="errors.email">{{ errors.email[0] }}</span>
      </label>

      <label for="password">
        <input id="password" type="password" name="password" 
          placeholder="Password" required>
      </label>

        <button type="submit">Log in</button>

    </form>

  </div>  
</template>

<script>
export default {
    data() {
      return {
        csrf_token: window.csrf_token
      }
    },
    computed: {
      loginRoute () {
        return window.vuebnb_login_route
      },
      errors () {
        return window.vuebnb_auth_errors
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

  #login {
    margin-bottom: 1em;
  }

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
