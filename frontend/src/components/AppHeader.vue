<template>
  <header class="header">
    <div class="header-content">
      <img :src="avatar" alt="Avatar" class="avatar">
      <div class="header-info">
        <h1>{{ name }}</h1>
        <p v-if="open_to_work" class="status">Open to Work</p>
      </div>
      <nav class="header-nav">
        <ul>
          <li><router-link to="/professional-info">Informações Profissionais</router-link></li>
          <li><router-link to="/about-me">Sobre Mim</router-link></li>
          <li><router-link to="/feed">Feed</router-link></li>
          <li><router-link to="/contact">Contato</router-link></li>
        </ul>
      </nav>
    </div>
  </header>
</template>

<script>
import { gsap } from "gsap";
import { EventBus } from '@/eventBus';
import axios from '@/axios'; 

export default {
  data() {
    return {
      name: "",
      avatar: "",
      openToWork: false
    };
  },
  created() {
    axios.get('/users/1')
      .then(response => {
        this.user_info = response.data;
        console.log(this.user_info); // Certifique-se de que o ID do usuário está definido em algum lugar
        this.name = this.user_info.name;
        this.email = this.user_info.email;
        this.avatar = "http://localhost:3000/"+this.user_info.avatar.url;
        this.open_to_work = this.user_info.open_to_work
      })
      .catch(error => {
        console.error('Erro ao buscar informações profissionais:', error);
      });
      EventBus.$on('user-updated', this.handleUserUpdated);
  },
  mounted() {
    gsap.from(".header-content", { duration: 1, y: -100, opacity: 0 });
  },
  methods: {
    handleUserUpdated(updatedUser) {
      this.name = updatedUser.name;
      this.avatar = "http://localhost:3000" + updatedUser.avatar.url;
      this.openToWork = updatedUser.open_to_work;
      localStorage.setItem('user', JSON.stringify(updatedUser));
    }
  }
  
};
</script>

<style scoped>
.header {
  display: flex;
  align-items: center;
  padding: 10px 20px;
  background-color: #f5f5f5;
  border-bottom: 1px solid #ddd;
}
.header-content {
  display: flex;
  align-items: center;
  width: 100%;
}
.avatar {
  width: 60px;
  height: 60px;
  border-radius: 50%;
}
.header-info {
  margin-left: 10px;
}
.status {
  color: green;
  font-weight: bold;
}
.header-nav ul {
  display: flex;
  list-style: none;
  margin-left: auto;
}
.header-nav li {
  margin: 0 10px;
}
.header-nav a {
  text-decoration: none;
  color: #0073b1;
}
</style>
