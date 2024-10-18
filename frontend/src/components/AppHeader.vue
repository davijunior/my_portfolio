<template>
  <header class="header">
    <div class="header-content">
      <img :src="avatar" alt="Avatar" class="avatar">
      <div class="header-info">
        <h1>{{ name }}</h1>
        <p v-if="openToWork" class="status">Open to Work</p>
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

export default {
  data() {
    return {
      name: 'Seu Nome',
      avatar: 'link-to-avatar',
      openToWork: true
    };
  },
  mounted() {
    gsap.from(".header-content", { duration: 1, y: -100, opacity: 0 });
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
