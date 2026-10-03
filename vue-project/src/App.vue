<!-- <script setup>
const people = [
  { id: 1, name: 'Петров Иван Артурович', date: '2000-01-15', city: 'Москва' },
  { id: 2, name: 'Петрова Анна Артуровна', date: '2000-02-20', city: 'Санкт-Петербург' },
  { id: 3, name: 'Петров Олег Артурович', date: '2000-03-10', city: 'Казань' },
  { id: 4, name: 'Петрова Елена Артуровна', date: '2000-04-05', city: 'Екатеринбург' },
  { id: 5, name: 'Петров Дмитрий Артурович', date: '2000-05-18', city: 'Новосибирск' },
  { id: 6, name: 'Петрова Мария Артуровна', date: '2000-06-22', city: 'Нижний Новгород' },
  { id: 7, name: 'Петров Кирилл Артурович', date: '2000-07-30', city: 'Челябинск' },
  { id: 8, name: 'Петрова Виктория Артуровна', date: '2000-08-12', city: 'Самара' },
  { id: 9, name: 'Петров Артём Артурович', date: '2000-09-07', city: 'Омск' },
  { id: 10, name: 'Петрова София Артуровна', date: '2000-10-25', city: 'Ростов-на-Дону' }
];
</script>
  
<template>
  <div>
  <div class="people">
    <h2>Список людей</h2>
    <div class="cards">
      <div v-for="person in people" :key="person.id" class="card">
        <div class="card-header">{{ person.name }}</div>
        <div class="card-row">
          <span class="label">Дата рождения:</span>
          <span>{{ person.date }}</span>
        </div>
        <div class="card-row">
          <span class="label">Город:</span>
          <span>{{ person.city }}</span>
        </div>
      </div>
    </div>
    </div>
  </div>
</template>

<style scoped>
.people {
  padding: 24px;
  font-family: Arial, sans-serif;
}

.cards {
  color:black;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 20px;
}

.card {
  border: 1px solid #ddd;
  border-radius: 8px;
  padding: 16px;
  background: #fff;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
}

.card-header {
  font-weight: bold;
  font-size: 1.1rem;
  color: #222;
}

.card-row {
  display: flex;
  align-items: center;
  margin: 6px 0;
}

.label {
  color: #666;
  font-size: 0.9rem;
}
</style> -->

<script setup>
import{ref,computed} from 'vue'
const progres=0
const tasks =ref([])
const filter=ref('all')//'all'|'active'|'done'
const visibleTasks=computed(()=>{
  if(filter.value==='active')return tasks.value.filter(t=>!t.done)
  if(filter.value==='done')return tasks.value.filter(t=>t.done)
  return tasks.value
})
const stats=computed(()=>({
  
  total:tasks.value.length,
  done:tasks.value.filter(t=>t.done).length,
}))

const newTask=ref('')
function addTask(){
  if(newTask.value.trim()==='')return
  tasks.value.push({
    id:Date.now(),
    text:newTask.value,
    done:false,
  })
  newTask.value=''
}

function removeTask(id) {
  tasks.value = tasks.value.filter(t=>t.id !== id)
}
</script>


<template>
  <div >
    <input v-model="newTask" placeholder="Новое дело" @keyup.enter="addTask()"/>
    <button @click="addTask">Добавить</button>
    <button @click="filter='all'">Все</button>
    <button @click="filter='active'">Активные</button>
    <button @click="filter='done'">Выполнено</button>
    <p>Выполнено: {{ stats.done }} из {{ stats.total }}</p>
    <p>Прогресс:  {{ progres }}

    </p>
    <ul>
      <li v-for="task in visibleTasks" :key="task.id">
         <input v-model="task.done" type="checkbox"/>
         <span :style="{textDecoration:task.done?'line-through':'none'}">
          {{ task.text }}-{{ task.done?"y":"x" }}<button @click="removeTask(task.id)">Удалить</button>
         </span>
      </li>
    </ul>
  </div>
</template>

<style scoped>

</style>
