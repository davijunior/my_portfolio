<template>
    <section class="admin-section">
      <h2>Painel de Administração</h2>
      <nav class="admin-nav">
        <ul>
          <li><router-link to="/admin/professional-info">Gerenciar Informações Profissionais</router-link></li>
          <li><router-link to="/admin/personal-info">Gerenciar Informações Pessoais</router-link></li>
        </ul>
      </nav>
    </section>
  </template>
  
  <script>
  export default {
    name: 'AdminDashboard'
  };
  </script>