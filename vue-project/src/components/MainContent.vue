<!-- урок1 -->
<script setup>
import { ref, computed } from 'vue';
import UserCard from './UserCard.vue';

const users=ref([
  {
    id:1,
    name:"aboba",
    age:20,
    active:true
  },
  {
    id:2,
    name:"aboba2",
    age:21,
    active:true
  },
  {
    id:3,
    name:"aboba3",
    age:22,
    active:false
  }
])

</script>

<template>
  
  <div class="body">
      <main>
        <h2>пользователи</h2>
        <div class="users">
          <UserCard
          v-for="user in users":key="user.id"
          :name="user.name"
          :age="user.age"
          :activ="user.activ"/>
        </div>
      </main>
  </div>
</template>

<style scoped>
.body {
  height: 1100px;
  padding: 60px 20px;
  box-sizing: border-box;
  background-color: #f5f7fa;
  font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
}

.card {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  justify-content: center;
  max-width: 1000px;
  margin: 0 auto;
}

</style>
