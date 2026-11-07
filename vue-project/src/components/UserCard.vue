<!-- урок1 -->
<script setup>
// const props=defineProps({
//     id:Number,
//     name:String,
//     age:Number,
//     active:Boolean
// })

// function showUsers(){
//   console.log(props.name)
//   console.log(props.age)
// }

function deleteUser(id){
  emit('delete-user',props.id)
}

const emit=defineEmits([
    'delete-user'
])
</script>

<template>
  <div class="card-wrapper">
    <div class="profile-card">
      <h2 class="profile-name">{{ name }}</h2>
      <p class="profile-age">Возраст: {{ age }}</p>
      <button class="action-btn" @click="count++">
        Нажатий: {{ count }}
      </button>
    </div>
    <button @click="showUsers">click</button>
    <button @click="deleteUser">Удалить</button>
  </div>

 


  <div>
    <!-- <button @click="emit('chande-name')">Изменить имя</button> -->
    
  </div>


</template>

<style scoped>
.card-wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 250px;
  padding: 20px;
  background-color: #f5f7fa;
}

.profile-card {
  background: #ffffff;
  border-radius: 16px;
  padding: 32px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.04);
  max-width: 400px;
  width: 100%;
  text-align: center;
}

.profile-name {
  font-size: 28px;
  font-weight: 700;
  color: #2d3748;
  margin: 0 0 8px 0;
  line-height: 1.2;
}

.profile-age {
  font-size: 16px;
  color: #718096;
  margin: 0 0 24px 0;
}

.action-btn {
  background-color: #e2e8f0;
  border: none;
  color: #4a5568;
  padding: 12px 24px;
  border-radius: 8px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: background-color 0.2s, color 0.2s;
}
</style>
