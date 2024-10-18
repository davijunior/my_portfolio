<template>
    <section id="feed" class="feed">
      <h2>Feed</h2>
      <div class="feed-post" v-for="post in posts" :key="post.id">
        <p>{{ post.content }}</p>
        <small>{{ post.date }}</small>
      </div>
    </section>
  </template>
  
  <script>
import { gsap } from "gsap";
import axios from '../axios';

export default {
  data() {
    return {
      posts: []
    };
  },
  created() {
    axios.get('/posts')
      .then(response => {
        this.posts = response.data;
      })
      .catch(error => {
        console.error('Erro ao buscar posts:', error);
      });
  },
  mounted() {
    gsap.from(".feed", { duration: 1, y: -100, opacity: 0, delay: 0.6 });
  }
};
</script>
  
  <style scoped>
  .feed {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin: 20px 0;
  }
  .feed h2 {
    color: #0073b1;
    margin-bottom: 20px;
  }
  .feed-post {
    border: 1px solid #ddd;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 10px;
  }
  .feed-post p {
    margin: 0;
    color: #333;
  }
  .feed-post small {
    display: block;
    color: #666;
    margin-top: 10px;
  }
  </style>
  