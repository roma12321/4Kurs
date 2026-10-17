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


<!-- Блокировка инпут полей по кнопке со сменой названия и проверки на текст в поле  -->
<!-- <script setup>
import {ref,computed} from 'vue'
const isDisabled=ref("")
const lock=ref("")
const age=ref()
</script>
<template>
  <lable>
    <input type="checkbox" v-model="isDisabled">
    <input type="text" v-model="isDisabled" :disabled="lock">
    <input type="number" v-model="age" :disabled="lock">
  </lable> 
  <button :disabled="!isDisabled || !age">Отправить</button>
</template> -->


<!-- Блокировка инпут полей по галочке  -->
<!-- <script setup>
import {ref,computed} from 'vue'
const age=ref()
</script>
<template>
  <lable>
    <input type="number" v-model="age" :disabled="age">
  </lable> 
  <input type="checkbox" v-model="age">
</template> -->


<!-- Добавление в список через инпут и кнопку -->
<!-- <script setup>
import { ref } from 'vue'
const items=ref(["sdlf","lskdg"])
const text=ref("")
function addItems(){
  items.value.push(text.value)
}
</script>
<template>
  <ul>
    <li v-for="(item,index) in items":key="index">
      {{ item }}
    </li>
  </ul>
  <label>
    <input type="text" v-model="text">
  </label>
<button @click="addItems">Add</button>
</template> -->


<!-- Таже но есть добавление в начало и конец -->
<!-- <script setup>
import { ref } from 'vue'
const items=ref(["sdlf","lskdg"])
const text=ref("")
function addItems(){
  items.value.push(text.value)
}
function addItems1(){
  items.value.unshift(text.value)
}
</script>

<template>
  <ul>
    <li v-for="(item,index) in items":key="index">
      {{ item }}
    </li>
  </ul>
  <label>
    <input type="text" v-model="text">
  </label>
<button @click="addItems1">Add в начала</button>
<button @click="addItems">Add в конец </button>
</template> -->


<!-- удаление и добавление в конец и начала списка  -->
<!-- <script setup>
import { ref } from 'vue'
const items=ref([])
const text=ref("")
function addItems(){
  items.value.push(text.value)
}
function addItems1(){
  items.value.unshift(text.value)
}
function deleteStudent(index){
  items.value.splice(index,1)
}   
</script>

<template>
  <ul>
    <li v-for="(item,index) in items":key="index" @click="deleteStudent(index)">
      {{ item }}<button @click="deleteStudent(index)">Удалить</button>
    </li>
  </ul>
  <label>
    <input type="text" v-model="text">
    
  </label>
<button @click="addItems1">Add в начала</button>
<button @click="addItems">Add в конец </button>
</template> -->


<!-- HTML таблица с массивом и удалинием по кнопке -->
<script setup>
import { ref } from 'vue'
const newName = ref('')
const newSalary = ref(0)
const newAge = ref(0)
const newOtdel = ref('')
const newStatus = ref('')
const newSpisok = ref('')
const users=ref([
    {
      id:1,
      name: 'name1',
      salary: 100,
      age: 30,
      otdel: "IT",
      status: "Работает",
      spisok: "Обширный"
    },
    {
      id:2,
      name: 'name2',
      salary: 200,
      age: 40,
      otdel: "IT",
      status: "Обед",
      spisok: "Средний"
    },
    {
      id:3,
      name: 'name3',
      salary: 300,
      age: 50,
      otdel: "IT",
      status: "Выходной",
      spisok: "Малый"
    },
])
 function deleteStudent(index){
  users.value.splice(index,1)
}
const addItems = () => {
  const newUser = {
    id: Date.now(), 
    name: newName.value,
    salary: Number(newSalary.value) || 0,
    age: Number(newAge.value) || 0,
    otdel: newOtdel.value,
    status: newStatus.value,
    spisok: newSpisok.value,
  }
  users.value.push(newUser)
}
</script>

<template>
  <div class="users-container">
    <h2>Добавить сотрудника</h2>
    <div class="form-group">
      <input type="text" placeholder="Name" v-model="newName" />
      <input type="number" placeholder="Salary" v-model.number="newSalary" />
      <input type="number" placeholder="Age" v-model.number="newAge" />
      <input type="text" placeholder="Otdel" v-model="newOtdel" />
      <input type="text" placeholder="Status" v-model="newStatus" />
      <input type="text" placeholder="Spisok" v-model="newSpisok" />
    </div>
    <button @click="addItems">Add people</button>
    <table v-for="(user, index) in users" :key="user.id" class="ip" @click="deleteStudent(index)">
      <tbody>
        <tr>
          <th>Имя:</th>
          <td>{{ user.name }}</td>
        </tr>
        <tr>
          <th>Зарплата:</th>
          <td>{{ user.salary }} ₽</td>
        </tr>
        <tr>
          <th>Возраст:</th>
          <td>{{ user.age }} лет</td>
        </tr>
        <tr>
          <th>Отдел:</th>
          <td>{{ user.otdel }} лет</td>
        </tr>
        <tr>
          <th>Статус:</th>
          <td>{{ user.status }} лет</td>
        </tr>
        <tr>
          <th>Список навыков:</th>
          <td>{{ user.spisok }} лет</td>
        </tr>
        <tr class="action-row">
          <td colspan="2">
            <a href="#" @click.stop="deleteStudent(index)" class="delete-link">Удалить</a>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<style>
.users-container {
  display: flex;
  flex-direction: column;
  gap: 24px;
  padding: 20px;
  font-family: system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial, sans-serif;
  color: #333;
}

.form-group {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
  gap: 12px;
  align-items: end;
  margin-bottom: 16px;
}

.form-group input {
  padding: 10px 12px;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  min-width: 140px;
  font-size: 14px;
  transition: border-color 0.2s, box-shadow 0.2s;
}

.form-group input:focus {
  outline: none;
  border-color: #3b82f6;
  box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
}

button {
  background-color: #2563eb;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 6px;
  cursor: pointer;
  font-weight: 500;
  font-size: 14px;
  transition: background-color 0.2s;
  align-self: end;
}

button:hover {
  background-color: #1d4ed8;
}

.ip {
  width: 100%;
  max-width: 480px;
  border-collapse: collapse;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
  background: #fff;
}

.ip tbody tr {
  border-bottom: 1px solid #e5e7eb;
}

.ip tbody tr:last-child {
  border-bottom: none;
}

.ip th {
  text-align: left;
  font-weight: 600;
  color: #4b5563;
  padding: 12px 16px;
  width: 45%;
  background-color: #f9fafb;
}

.ip td {
  text-align: left;
  color: #6b7280;
  padding: 12px 16px;
  vertical-align: middle;
}

.action-row {
  background-color: #f3f4f6;
  text-align: center;
  padding: 8px 0;
}

.delete-link {
  color: #ef4444;
  text-decoration: none;
  font-size: 13px;
  font-weight: 500;
  cursor: pointer;
  transition: color 0.2s, text-decoration 0.2s;
}

.delete-link:hover {
  color: #dc2626;
  text-decoration: underline;
}

</style>