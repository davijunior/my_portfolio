<template>
    <section class="admin-section">
      <h2>Gerenciar Informações Pessoais</h2>
      <form @submit.prevent="submitForm">
        <div class="form-group">
          <label for="bio">Bio</label>
          <textarea id="bio" v-model="bio" required></textarea>
        </div>
        <div class="form-group">
          <label for="hobbies">Hobbies</label>
          <input type="text" id="hobbies" v-model="hobbies" required />
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
        bio: '',
        hobbies: ''
      };
    },
    methods: {
      submitForm() {
        axios.post('/personal_infos', {
          bio: this.bio,
          hobbies: this.hobbies
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
  