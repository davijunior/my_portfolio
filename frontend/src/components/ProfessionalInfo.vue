<template>
    <section id="professional-info" class="professional-info">
      <h2>Informações Profissionais</h2>
      <div class="professional-card" v-for="info in professionalInfos" :key="info.id">
        <h3>{{ info.title }}</h3>
        <p>{{ info.company }}</p>
        <p>{{ info.years_experience }} anos de experiência</p>
      </div>
    </section>
  </template>
  
  <script>
  import { gsap } from "gsap";
  import axios from '../axios';
  
  export default {
    data() {
      return {
        professionalInfos: []
      };
    },
    created() {
      axios.get('/professional_infos')
        .then(response => {
          this.professionalInfos = response.data;
        })
        .catch(error => {
          console.error('Erro ao buscar informações profissionais:', error);
        });
    },
    mounted() {
      gsap.from(".professional-info", { duration: 1, y: -100, opacity: 0, delay: 0.2 });
    }
  };
  </script>
  
  <style scoped>
  .professional-info {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin: 20px 0;
  }
  .professional-info h2 {
    color: #0073b1;
    margin-bottom: 20px;
  }
  .professional-card {
    border: 1px solid #ddd;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 10px;
  }
  .professional-card h3 {
    margin: 0;
    color: #0073b1;
  }
  .professional-card p {
    margin: 5px 0;
    color: #333;
  }
  </style>
  