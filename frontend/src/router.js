import Vue from 'vue';
import Router from 'vue-router';
import ProfessionalInfo from './components/ProfessionalInfo.vue';
import AboutMe from './components/AboutMe.vue';
import UserFeed from './components/UserFeed.vue';
import UserContact from './components/UserContact.vue';
import AdminDashboard from './components/AdminDashboard.vue'; 
import AdminProfessionalInfo from './components/AdminProfessionalInfo.vue'; 
import AdminPersonalInfo from './components/AdminPersonalInfo.vue'; 
import LoginUser from './components/LoginUser.vue'; 
import EditUser from './components/EditUser.vue'; 

Vue.use(Router);

export default new Router({
  mode: 'history',
  routes: [
    { path: '/', redirect: '/professional-info' },
    { path: '/login', component: LoginUser },
    { path: '/edit-user', component: EditUser },
    { path: '/professional-info', component: ProfessionalInfo },
    { path: '/about-me', component: AboutMe },
    { path: '/feed', component: UserFeed },
    { path: '/contact', component: UserContact },
    { path: '/admin', component: AdminDashboard }, // Adicionado
    { path: '/admin/professional-info', component: AdminProfessionalInfo }, // Adicionado
    { path: '/admin/personal-info', component: AdminPersonalInfo } // Adicionado
  ]
});
