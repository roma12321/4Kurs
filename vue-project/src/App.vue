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

<!-- <script setup>
import{ref,computed} from 'vue'
const progres=0
const tasks =ref([])
const filter=ref('all')
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

</style> -->


<!-- <script setup>
import { ref } from 'vue';

// const isAuth=false
// const age=17


// const isVisible=ref(true)
// function hide(){
//   isVisible.value=!isVisible.value
// }


// const temp=16


// const fruits=["Яблоко","Банан","Апельсин"]

// const students=[
//   { id: 1, name: 'Айфон 11', price:1800, color: 'Black'},
//   { id: 2, name: 'Айфон 12', price:1900, color: 'Yelow'},
//   { id: 3, name: 'Айфон 13', price:2000, color: 'Gray'},
//   { id: 4, name: 'Айфон 14', price:1900, color: 'Yelow'},
//   { id: 5, name: 'Айфон 15', price:2000, color: 'Gray'}
// ]


// const students=ref([
//   {
//     id:1,
//     name:"Антон1",
//     pos:true
//   },
//   {
//     id:2,
//     name:"Антон2",
//     pos:true
//   },
//   {
//     id:3,
//     name:"Антон3",
//     pos:false
//   }
// ])
// function addStudent(){
//   students.value.push({
//     id:2,
//     name:"Антон2"
//   })
// }
// function deleteStudent(id){
//   students.value=students.value.filter(student=>student.id!==id)
// }

</script>

<!-- <template>
    <h2 v-if="age<12">Холодно</h2>
    <h2 v-else-if="age<">Подросток</h2>
    <h2 v-else>Взрослый</h2>

    <p v-if="isVisible">Этот текст можно скрыть</p>
    <button @click="hide" >Скрыть текст</button>


    <p v-if="isVisible">Этот текст можно скрыть</p>
    <button @click="isVisible=!isVisible">{{isVisible?"скрыть":"показать"}}</button>


    <p v-show="isVisible">Этот текст можно скрыть</p>
    <button @click="isVisible=!isVisible">{{isVisible?"скрыть":"показать"}}</button>


    <h2 v-if="temp<0">ОЧХолодно</h2>
    <h2 v-else-if="temp===0 || temp<=15">Холодно</h2>
    <h2 v-else-if="temp===16 || temp<=20">Более менее</h2>
    <h2 v-else>Тепло</h2>


    <h2>Фрукты</h2>
    <h3 v-for="value in fruits">{{ value }}</h3>
    <h3 v-for="(fruits,index) in fruits":key="index">{{index}}-{{ fruits }}</h3>


  <div class="mather">
    <div v-for="student in students" :key="student.id" class="cards">
      <div class="card">
        <div>{{ student.name }}</div>
        <div>{{ student.price }}</div>
        <div>{{ student.color }}</div>
      </div>
  </div>
</div>


<h2>Студенты</h2>
<div v-for="student in students">
  <span v-if="student.pos">{{ student.name }}</span>
  <button @click="deleteStudent(student.id)">Удалить</button>
</div>
<button @click="addStudent">Add</button>



</template> -->
<!-- <style scoped>
.mather{
  margin-top: 20px;
  display: flex;
  justify-content: space-between;
  color: azure;
  width: 100%;
  height: 110px;
}
.cards{
  border: 1px solid white;
  border-radius: 7%;
}
.card{
  width: 200px;
  height: 100px;
}
</style> -->


<!-- <script setup>
import { ref,computed } from 'vue';
const name=ref('')
const text=ref('')
function showName(){
  alert(name.value)
}
function showText(){
  alert(text.value)
}

const agree=ref(false)
</script>
<template>
    <input v-model="name" type="text" placeholder="Input name">
  <button @click="showName">Вывод</button>
    <textarea v-model="text"></textarea>
    <p>{{ text }}</p>
  <button @click="showText">Вывод</button>

  <label>
    <input v-model="agree" type="checkbox"/>
    Я согласен
  </label>
    <p>{{ agree }}</p>
</template> -->