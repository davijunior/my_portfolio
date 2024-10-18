<template>
  <div id="app">
    <AppHeader />
    <router-view />
  </div>
</template>

<script>
import AppHeader from './components/AppHeader.vue';
import './assets/GlobalAdminStyles.css';

export default {
  components: {
    AppHeader
  }
};
</script>
