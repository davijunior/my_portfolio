import axios from 'axios';

const instance = axios.create({
  baseURL: 'http://localhost:3000',
  headers: {
    Authorization: `Bearer ${localStorage.getItem('session_token')}`
  }
});

export default instance;
