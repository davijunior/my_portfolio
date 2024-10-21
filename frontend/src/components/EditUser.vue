<template>
  <div>
    <form @submit.prevent="updateProfile">
      <input type="text" v-model="user.name" placeholder="Nome" />
      <input type="email" v-model="user.email" placeholder="Email" />
      <input type="file" @change="uploadAvatar" />
      <input type="checkbox" v-model="user.open_to_work" /> Open to Work
      <button type="submit">Atualizar</button>
    </form>
  </div>
</template>

<script>
import axios from '@/axios';
import { EventBus } from '@/eventBus';

export default {
  data() {
    const user = JSON.parse(localStorage.getItem('user'))
    return {
      user: {
        id: user.id, // Certifique-se de que o ID do usuário está definido em algum lugar
        name: user.name,
        email: user.email,
        avatar: null,
        open_to_work: user.open_to_work
      }
    }
  },
  methods: {
    async updateProfile() {
      const formData = new FormData();
      formData.append('name', this.user.name);
      formData.append('email', this.user.email);
      if (this.user.avatar) {
        formData.append('avatar', this.user.avatar);
      }
      formData.append('open_to_work', this.user.open_to_work);

      try {
        const response = await axios.put(`/users/${this.user.id}`, formData, {
          headers: {
            'Content-Type': 'multipart/form-data'
          }
        });
        localStorage.setItem('user', JSON.stringify(response.data));
        EventBus.$emit('user-updated', response.data);
        console.log('User updated:', response.data);
      } catch (error) {
        console.error('Erro ao atualizar perfil:', error);
      }
    },
    uploadAvatar(event) {
      this.user.avatar = event.target.files[0];
    }
  }
};
</script>