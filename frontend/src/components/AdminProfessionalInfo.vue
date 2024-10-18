<template>
    <section class="admin-section">
      <h2>Gerenciar Informações Profissionais</h2>
      <form @submit.prevent="submitForm">
        <div class="form-group">
          <label for="title">Título</label>
          <input type="text" id="title" v-model="title" required />
        </div>
        <div class="form-group">
          <label for="company">Empresa</label>
          <input type="text" id="company" v-model="company" required />
        </div>
        <div class="form-group">
          <label for="years_experience">Anos de Experiência</label>
          <input type="number" id="years_experience" v-model="yearsExperience" required />
        </div>
        <button type="submit">Salvar</button>
      </form>
    </section>
  </template>
  
  <script>
  import axios from '../axios';
  
  export default {
    data() {
      return {
        title: '',
        company: '',
        yearsExperience: ''
      };
    },
    methods: {
      submitForm() {
        axios.post('/professional_infos', {
          title: this.title,
          company: this.company,
          years_experience: this.yearsExperience
        })
        .then(() => {
          alert('Informações salvas!');
        })
        .catch(error => {
          console.error('Erro ao salvar informações:', error);
        });
      }
    }
  };
  </script>
  
  <style scoped>
  /* Estilização específica do componente, se necessário */
  </style>
  