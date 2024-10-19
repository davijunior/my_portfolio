<template>
  <div>
    <form @submit.prevent="login">
      <input type="email" v-model="email" placeholder="Email" />
      <input type="password" v-model="password" placeholder="Senha" />
      <button type="submit">Login</button>
    </form>
  </div>
</template>

<script>
import axios from '../axios';

export default {
  data() {
    return {
      email: '',
      password: ''
    };
  },
  methods: {
    async login() {
      try {
        const response = await axios.post('/login', {
          email: this.email,
          password: this.password
        });
        console.log('User:', response.data);
        localStorage.setItem('session_token', response.data.user.session_token);
        localStorage.setItem('user', JSON.stringify(response.data.user));
      } catch (error) {
        console.error('Erro ao fazer login:', error);
      }
    }
  }
};
</script>
