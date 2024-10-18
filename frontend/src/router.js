import Vue from 'vue';
import Router from 'vue-router';
import ProfessionalInfo from './components/ProfessionalInfo.vue';
import AboutMe from './components/AboutMe.vue';
import UserFeed from './components/UserFeed.vue';
import UserContact from './components/UserContact.vue';
import AdminDashboard from './components/AdminDashboard.vue'; // Adicionado
import AdminProfessionalInfo from './components/AdminProfessionalInfo.vue'; // Adicionado
import AdminPersonalInfo from './components/AdminPersonalInfo.vue'; // Adicionado

Vue.use(Router);

export default new Router({
  mode: 'history',
  routes: [
    { path: '/', redirect: '/professional-info' },
    { path: '/professional-info', component: ProfessionalInfo },
    { path: '/about-me', component: AboutMe },
    { path: '/feed', component: UserFeed },
    { path: '/contact', component: UserContact },
    { path: '/admin', component: AdminDashboard }, // Adicionado
    { path: '/admin/professional-info', component: AdminProfessionalInfo }, // Adicionado
    { path: '/admin/personal-info', component: AdminPersonalInfo } // Adicionado
  ]
});
