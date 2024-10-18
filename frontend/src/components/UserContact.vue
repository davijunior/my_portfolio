<template>
  <section id="contact" class="contact">
    <h2>Contato</h2>
    <div class="contact-form">
      <form @submit.prevent="submitForm">
        <div class="form-group">
          <label for="name">Nome</label>
          <input type="text" id="name" v-model="name" required />
        </div>
        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" id="email" v-model="email" required />
        </div>
        <div class="form-group">
          <label for="message">Mensagem</label>
          <textarea id="message" v-model="message" required></textarea>
        </div>
        <button type="submit">Enviar</button>
      </form>
    </div>
  </section>
</template>

<script>
import { gsap } from "gsap";
import axios from '../axios';

export default {
  data() {
    return {
      name: '',
      email: '',
      message: ''
    };
  },
  mounted() {
    gsap.from(".contact", { duration: 1, y: -100, opacity: 0, delay: 0.8 });
  },
  methods: {
    submitForm() {
      axios.post('/contacts', {
        name: this.name,
        email: this.email,
        message: this.message
      })
      .then(response => {
        console.log(response)
        alert('Formulário enviado!');
      })
      .catch(error => {
        console.error('Erro ao enviar formulário:', error);
      });
    }
  }
};
</script>

<style scoped>
.contact {
  background-color: #fff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  margin: 20px auto;
  width: 60%; /* Ajuste o tamanho conforme necessário */
  max-width: 600px; /* Limite máximo de largura */
  text-align: left;
}
.contact h2 {
  color: #0073b1;
  margin-bottom: 20px;
}
.contact-form {
  display: flex;
  flex-direction: column;
}
.form-group {
  margin-bottom: 15px;
}
.form-group label {
  display: block;
  margin-bottom: 5px;
  color: #333;
}
.form-group input,
.form-group textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 4px;
}
button {
  padding: 10px 15px;
  border: none;
  border-radius: 4px;
  background-color: #0073b1;
  color: #fff;
  cursor: pointer;
}
button:hover {
  background-color: #005f8d;
}
</style>
