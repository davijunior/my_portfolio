<template>
    <section id="about-me" class="about-me">
      <h2>Sobre Mim</h2>
      <div class="about-card">
        <p>{{ bio }}</p>
        <h3>Hobbies</h3>
        <ul>
          <li v-for="hobby in hobbies" :key="hobby">{{ hobby }}</li>
        </ul>
      </div>
    </section>
  </template>
  
  <script>
import { gsap } from "gsap";
import axios from '../axios';

export default {
  data() {
    return {
      bio: '',
      hobbies: []
    };
  },
  created() {
    axios.get('/personal_infos/1') // Substitua com o ID correto
      .then(response => {
        this.bio = response.data.bio;
        this.hobbies = response.data.hobbies.split(',');
      })
      .catch(error => {
        console.error('Erro ao buscar informações pessoais:', error);
      });
  },
  mounted() {
    gsap.from(".about-me", { duration: 1, y: -100, opacity: 0, delay: 0.4 });
  }
};
</script>
  
  <style scoped>
  .about-me {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin: 20px 0;
  }
  .about-me h2 {
    color: #0073b1;
    margin-bottom: 20px;
  }
  .about-card {
    border: 1px solid #ddd;
    padding: 15px;
    border-radius: 8px;
  }
  .about-card p {
    margin-bottom: 15px;
    color: #333;
  }
  .about-card h3 {
    margin-bottom: 10px;
    color: #0073b1;
  }
  .about-card ul {
    list-style-type: disc;
    margin-left: 20px;
  }
  .about-card li {
    margin-bottom: 5px;
  }
  </style>
  