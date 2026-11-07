<!-- 
<script setup>
import { ref, computed } from 'vue';

const games = [
  { id: 1, name: 'CS2', game: 'RPG', rating: 9.7 },
  { id: 2, name: 'Dota 2', game: 'Action RPG', rating: 9.2 },
  { id: 3, name: 'CS0', game: 'Puzzle', rating: 9.5 },
  { id: 4, name: 'Dota 0', game: 'Simulation', rating: 9.0 },
  { id: 5, name: 'CS1', game: 'Platformer', rating: 9.3 },
  { id: 6, name: 'Dota 1', game: 'Metroidvania', rating: 9.4 },
]
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
const selectedGameType = ref('');
const filteredGames = computed(() => {
  if (!selectedGameType.value) return games;
  return games.filter(g => g.game === selectedGameType.value);
});
const gameTypes = computed(() => {
  const unique = new Set(games.map(g => g.game));
  return Array.from(unique);
});
</script>
  
<template>
  <div class="board">
    <h2>Рейтинг игр</h2>

    <div class="tags">
      <button
        class="tag"
        :class="{ active: !selectedGameType }"
        @click="selectedGameType = ''"
      >
        Все
      </button>
      <button
        v-for="type in gameTypes"
        :key="type"
        class="tag"
        :class="{ active: selectedGameType === type }"
        @click="selectedGameType = type"
      >
      {{ type }}
      </button>
    </div>
    <ul class="list">
      <li v-for="game in filteredGames" :key="game.id" class="item">
        <span class="name">{{ game.name }}</span>
        <span class="type">{{ game.game }}</span>
        <span class="rate">{{ game.rating }}</span>
      </li>
    </ul>
    <p v-if="filteredGames.length === 0" class="empty">
      Ничего не найдено
    </p>
  </div>
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
.board {
  max-width: 500px;
  margin: 2rem auto;
  padding: 1rem;
  font-family: Arial, sans-serif;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

h2 {
  text-align: center;
  margin-bottom: 1.5rem;
}

.tags {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  justify-content: center;
  margin-bottom: 1.5rem;
}

.tag {
  padding: 0.5rem 0.8rem;
  background: #f5f5f5;
  border: 1px solid #e0e0e0;
  border-radius: 6px;
  cursor: pointer;
  font-size: 0.9rem;
  color: #333;
  transition: all 0.2s ease;
}

.tag:hover {
  background: #eaeaea;
  border-color: #ccc;
}

.tag.active {
  background-color: #2196f3;
  border-color: #2196f3;
  color: white;
}

.list {
  list-style: none;
  padding: 0;
}

.item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0.75rem;
  border-bottom: 1px solid #f0f0f0;
}

.item:last-child {
  border-bottom: none;
}

.name {
  font-weight: 600;
}

.type {
  color: #666;
  font-size: 0.9rem;
}


.rate {
  background-color: #2196f3;
  color: white;
  padding: 0.2rem 0.6rem;
  border-radius: 4px;
  font-weight: bold;
}

.empty {
  text-align: center;
  color: #888;
  font-style: italic;
}
</style>



<script setup>
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

</style> 


 <script setup>
import { ref } from 'vue';

const isAuth=false
const age=17


const isVisible=ref(true)
function hide(){
  isVisible.value=!isVisible.value
}


const temp=16


const fruits=["Яблоко","Банан","Апельсин"]

const students=[
  { id: 1, name: 'Айфон 11', price:1800, color: 'Black'},
  { id: 2, name: 'Айфон 12', price:1900, color: 'Yelow'},
  { id: 3, name: 'Айфон 13', price:2000, color: 'Gray'},
  { id: 4, name: 'Айфон 14', price:1900, color: 'Yelow'},
  { id: 5, name: 'Айфон 15', price:2000, color: 'Gray'}
]


const students=ref([
  {
    id:1,
    name:"Антон1",
    pos:true
  },
  {
    id:2,
    name:"Антон2",
    pos:true
  },
  {
    id:3,
    name:"Антон3",
    pos:false
  }
])
function addStudent(){
  students.value.push({
    id:2,
    name:"Антон2"
  })
}
function deleteStudent(id){
  students.value=students.value.filter(student=>student.id!==id)
}

</script>

<template>
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
</template> 
<style scoped>
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
</style> 


<script setup>
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
</template> 


Блокировка инпут полей по кнопке со сменой названия и проверки на текст в поле  
<script setup>
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
</template> 


Блокировка инпут полей по галочке 
<script setup>
import {ref,computed} from 'vue'
const age=ref()
</script>
<template>
  <lable>
    <input type="number" v-model="age" :disabled="age">
  </lable> 
  <input type="checkbox" v-model="age">
</template> 


Добавление в список через инпут и кнопку 
<script setup>
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
</template>


Таже но есть добавление в начало и конец 
<script setup>
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
</template> 


удаление и добавление в конец и начала списка 
<script setup>
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
</template>


HTML таблица с массивом и удалинием по кнопке 
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

</style> -->

<!-- <script setup>
import { ref, computed } from 'vue';

const departments = [
  'IT',
  'HR',
  'Маркетинг',
  'Продажи',
  'Бухгалтерия'
];

const skillsList = [
  'JavaScript',
  'Vue.js',
  'HTML/CSS',
  'Git',
  'SQL',
  'Английский'
];

const employees = ref([
  {
    id: 1,
    name: 'Петров Иван',
    age: 28,
    department: 'IT',
    salary: 120000,
    active: true,
    skills: ['JavaScript', 'Vue.js']
  },
  {
    id: 2,
    name: 'Сидорова Анна',
    age: 34,
    department: 'Маркетинг',
    salary: 95000,
    active: true,
    skills: ['Маркетинг', 'Английский']
  },
  {
    id: 3,
    name: 'Смирнов Олег',
    age: 41,
    department: 'Бухгалтерия',
    salary: 110000,
    active: false,
    skills: ['SQL', 'Бухгалтерия']
  }
]);
const newName = ref('');
const newAge = ref(null);
const newSalary = ref(null);
const newDepartment = ref('');
const newActive = ref(true);
const newSkills = ref([]);

const isFormValid = computed(() => {
  if (!newName.value.trim()) return false;
  if (newAge.value === null || newAge.value < 18) return false;
  if (!newDepartment.value) return false;
  if (newSalary.value === null || newSalary.value <= 0) return false;
  return true;
});

function addEmployee() {
  const newId = Date.now(); 
  employees.value.push({
    id: newId,
    name: newName.value,
    age: newAge.value,
    department: newDepartment.value,
    salary: newSalary.value,
    active: newActive.value,
    skills: [...newSkills.value] 
  });
  newName.value = '';
  newAge.value = null;
  newSalary.value = null;
  newDepartment.value = '';
  newActive.value = true;
  newSkills.value = [];
}

function deleteEmployee(id) {
  employees.value = employees.value.filter(emp => emp.id !== id);
}

function toggleStatus(id) {
  const emp = employees.value.find(e => e.id === id);
  if (emp) {
    emp.active = !emp.active;
  }
}
</script>

<template>
  <div class="app-container">

    <div class="form-block">
      <div class="row">
        <input
          type="text"
          placeholder="Имя"
          v-model="newName"
        />
        <input
          type="number"
          placeholder="Возраст"
          v-model.number="newAge"
        />
        <select v-model="newDepartment">
          <option value="" disabled>Выберите отдел</option>
          <option
            v-for="dept in departments"
            :key="dept"
            :value="dept"
          >
            {{ dept }}
          </option>
        </select>
      </div>

      <div class="row">
        <input
          type="number"
          placeholder="Зарплата"
          v-model.number="newSalary"
        />

        <label class="checkbox-label">
          <input type="checkbox" v-model="newActive" />
          Статус: работает
        </label>
      </div>

      <div class="skills-block">
        <span>Навыки:</span>
        <div class="checkboxes">
          <label
            v-for="skill in skillsList"
            :key="skill"
            class="checkbox-item"
          >
            <input
              type="checkbox"
              :value="skill"
              v-model="newSkills"
            />
            {{ skill }}
          </label>
        </div>
      </div>

      <button
        @click="addEmployee"
        :disabled="!isFormValid"
      >
        Добавить сотрудника
      </button>
    </div>

    <table class="employees-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Имя</th>
          <th>Возраст</th>
          <th>Отдел</th>
          <th>Зарплата</th>
          <th>Статус</th>
          <th>Навыки</th>
          <th>Действия</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="emp in employees"
          :key="emp.id"
        >
          <td>{{ emp.id }}</td>
          <td>{{ emp.name }}</td>
          <td>{{ emp.age }}</td>
          <td>{{ emp.department }}</td>
          <td>{{ emp.salary }} ₽</td>
          <td>
            <span v-if="emp.active">Работает</span>
            <span v-else>Уволен</span>
          </td>
          <td>
            {{ emp.skills.join(', ') || '—' }}
          </td>

          <td class="actions">
            <button
              @click="toggleStatus(emp.id)"
            >
              {{ emp.active ? 'Уволить' : 'Восстановить' }}
            </button>
            <button
              @click="deleteEmployee(emp.id)"
              class="btn-delete"
            >
              Удалить
            </button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<style scoped>
.app-container {
  max-width: 900px;
  margin: 2rem auto;
  padding: 1.5rem;
  font-family: Arial, sans-serif;
}

h2 {
  text-align: center;
  margin-bottom: 1.5rem;
}

.form-block {
  background: #f9f9f9;
  padding: 1rem;
  border-radius: 8px;
  margin-bottom: 2rem;
}

.row {
  display: flex;
  gap: 1rem;
  margin-bottom: 0.75rem;
  flex-wrap: wrap;
}

input[type="text"],
input[type="number"],
select {
  padding: 0.5rem 0.75rem;
  border: 1px solid #ccc;
  border-radius: 4px;
  min-width: 160px;
}

.checkbox-label {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  cursor: pointer;
}

.skills-block {
  margin-bottom: 1rem;
}

.skills-block span {
  font-weight: 600;
  margin-right: 1rem;
}

.checkboxes {
  display: flex;
  flex-wrap: wrap;
  gap: 0.75rem;
}

.checkbox-item {
  display: flex;
  align-items: center;
  gap: 0.3rem;
  cursor: pointer;
}

button {
  padding: 0.5rem 1rem;
  background-color: #2196f3;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:hover:not(:disabled) {
  background-color: #1976d2;
}

button:disabled {
  background-color: #ccc;
  cursor: not-allowed;
}

.btn-delete {
  background-color: #ef4444;
  margin-left: 0.5rem;
}

.btn-delete:hover {
  background-color: #dc2626;
}

.employees-table {
  width: 100%;
  border-collapse: collapse;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

.employees-table th,
.employees-table td {
  border: 1px solid #e0e0e0;
  padding: 0.6rem 0.8rem;
  text-align: left;
}

.employees-table th {
  background-color: #f5f5f5;
  font-weight: 600;
}

.actions {
  white-space: nowrap;
}

.actions button {
  font-size: 0.85rem;
  padding: 0.3rem 0.6rem;
}
</style> -->








<!-- Дз на 07.11 -->
<!-- <script setup>
import { ref, computed } from 'vue';

const genres = ['Action', 'RPG', 'Strategy', 'Simulator', 'Racing', 'Shooter', 'Sandbox', 'Other'];
const platforms = ['PC', 'PlayStation', 'Xbox', 'Nintendo Switch', 'Mobile'];

const games = ref([
  { id: 1, title: 'Minecraft', genre: 'Sandbox', platform: 'PC', year: 2011, rating: 9, completed: true, favorite: true },
  { id: 2, title: 'The Witcher 3: Wild Hunt', genre: 'RPG', platform: 'PC', year: 2015, rating: 10, completed: true, favorite: false },
  { id: 3, title: 'God of War Ragnarok', genre: 'Action', platform: 'PlayStation', year: 2022, rating: 9, completed: false, favorite: true },
  { id: 4, title: 'Forza Horizon 5', genre: 'Racing', platform: 'Xbox', year: 2021, rating: 8, completed: false, favorite: false },
  { id: 5, title: 'Stardew Valley', genre: 'Simulator', platform: 'Nintendo Switch', year: 2016, rating: 9, completed: true, favorite: true }
]);

const newGame = ref({
  title: '',
  genre: '',
  platform: '',
  year: null,
  rating: null,
  completed: false,
  favorite: false
});

const searchQuery = ref('');
const genreFilter = ref('');
const statusFilter = ref('all');

const editingId = ref(null);
const editGame = ref({});

const isFormValid = computed(() =>
  newGame.value.title.trim() &&
  newGame.value.genre &&
  newGame.value.platform &&
  newGame.value.year &&
  newGame.value.rating >= 1 &&
  newGame.value.rating <= 10
);

const filteredGames = computed(() => {
  let result = games.value;
  if (searchQuery.value) {
    result = result.filter(g => g.title.toLowerCase().includes(searchQuery.value.toLowerCase()));
  }
  if (genreFilter.value) {
    result = result.filter(g => g.genre === genreFilter.value);
  }
  if (statusFilter.value === 'completed') {
    result = result.filter(g => g.completed);
  } else if (statusFilter.value === 'not-completed') {
    result = result.filter(g => !g.completed);
  } else if (statusFilter.value === 'favorites') {
    result = result.filter(g => g.favorite);
  }
  return result;
});

const stats = computed(() => {
  const total = games.value.length;
  const completed = games.value.filter(g => g.completed).length;
  const favorites = games.value.filter(g => g.favorite).length;
  const avgRating = total
    ? (games.value.reduce((sum, g) => sum + g.rating, 0) / total).toFixed(1)
    : 0;
  return { total, completed, notCompleted: total - completed, favorites, avgRating };
});

function addGame() {
  if (!isFormValid.value) return;
  games.value.push({
    id: Date.now(),
    ...newGame.value
  });
  newGame.value = {
    title: '',
    genre: '',
    platform: '',
    year: null,
    rating: null,
    completed: false,
    favorite: false
  };
}

function deleteGame(id) {
  games.value = games.value.filter(game => game.id !== id);
}

function toggle(game, field) {
  game[field] = !game[field];
}

function startEdit(game) {
  editingId.value = game.id;
  editGame.value = { ...game };
}

function saveEdit() {
  const game = games.value.find(g => g.id === editingId.value);
  if (game) {
    Object.assign(game, editGame.value);
  }
  editingId.value = null;
}

function cancelEdit() {
  editingId.value = null;
}
</script>

<template>
  <div class="app-container">
    <header class="site-header">
      <h1 class="logo">🎮 GameHub</h1>
    </header>

    <div class="stats-block">
      <div class="stat-card">
        <div class="stat-value">{{ stats.total }}</div>
        <div class="stat-label">Всего игр</div>
      </div>
      <div class="stat-card">
        <div class="stat-value">{{ stats.completed }}</div>
        <div class="stat-label">Пройдено</div>
      </div>
      <div class="stat-card">
        <div class="stat-value">{{ stats.notCompleted }}</div>
        <div class="stat-label">Не пройдено</div>
      </div>
      <div class="stat-card">
        <div class="stat-value">{{ stats.favorites }}</div>
        <div class="stat-label">Избранных</div>
      </div>
      <div class="stat-card">
        <div class="stat-value">{{ stats.avgRating }}</div>
        <div class="stat-label">Средний рейтинг</div>
      </div>
    </div>

    <div class="form-block">
      <h2>Добавить игру</h2>
      <div class="row">
        <input type="text" placeholder="Название игры" v-model.trim="newGame.title" />
        <select v-model="newGame.genre">
          <option value="" disabled>Выберите жанр</option>
          <option v-for="genre in genres" :key="genre" :value="genre">{{ genre }}</option>
        </select>
        <select v-model="newGame.platform">
          <option value="" disabled>Выберите платформу</option>
          <option v-for="platform in platforms" :key="platform" :value="platform">{{ platform }}</option>
        </select>
      </div>
      <div class="row">
        <input type="number" placeholder="Год выпуска" v-model.number="newGame.year" />
        <input type="number" placeholder="Рейтинг (1–10)" min="1" max="10" v-model.number="newGame.rating" />
        <label class="checkbox-label">
          <input type="checkbox" v-model="newGame.completed" />
          Игра пройдена
        </label>
        <label class="checkbox-label">
          <input type="checkbox" v-model="newGame.favorite" />
          Добавить в избранное
        </label>
      </div>
      <button @click="addGame" :disabled="!isFormValid">Добавить игру</button>
    </div>

    <div class="filters-block">
      <h2>Поиск и фильтры</h2>
      <div class="row">
        <input type="text" placeholder="Поиск игры..." v-model.trim="searchQuery" />
        <select v-model="genreFilter">
          <option value="">Все жанры</option>
          <option v-for="genre in genres" :key="genre" :value="genre">{{ genre }}</option>
        </select>
        <select v-model="statusFilter">
          <option value="all">Все игры</option>
          <option value="completed">Пройденные</option>
          <option value="not-completed">Не пройденные</option>
          <option value="favorites">Избранные</option>
        </select>
      </div>
    </div>
    <div class="cards">
      <p v-if="filteredGames.length === 0" class="empty">Игры не найдены</p>
      <div v-for="game in filteredGames" :key="game.id" class="card"
           :class="{ 'is-completed': game.completed, 'is-favorite': game.favorite }">

        <template v-if="editingId !== game.id">
          <div class="card-header">
            {{ game.title }}
            <span v-if="game.favorite" class="fav-mark">★</span>
          </div>
          <div class="card-row">
            <span class="label">Жанр:</span>
            <span>{{ game.genre }}</span>
          </div>
          <div class="card-row">
            <span class="label">Платформа:</span>
            <span>{{ game.platform }}</span>
          </div>
          <div class="card-row">
            <span class="label">Год выпуска:</span>
            <span>{{ game.year }}</span>
          </div>
          <div class="card-row">
            <span class="label">Рейтинг:</span>
            <span>{{ game.rating }}/10</span>
          </div>
          <div class="card-row">
            <span class="label">Статус:</span>
            <span v-if="game.completed" class="status-done">Пройдена</span>
            <span v-else class="status-not">Не пройдена</span>
          </div>
          <div class="actions">
            <button @click="toggle(game, 'completed')">
              {{ game.completed ? 'Вернуть в список прохождения' : 'Отметить как пройденную' }}
            </button>
            <button class="btn-fav" @click="toggle(game, 'favorite')">
              {{ game.favorite ? 'Удалить из избранного' : 'Добавить в избранное' }}
            </button>
            <button @click="startEdit(game)">Редактировать</button>
            <button class="btn-delete" @click="deleteGame(game.id)">Удалить</button>
          </div>
        </template>

        <template v-else>
          <div class="card-header">Редактирование игры</div>
          <div class="edit-row">
            <input type="text" v-model.trim="editGame.title" placeholder="Название" />
          </div>
          <div class="edit-row">
            <select v-model="editGame.genre">
              <option v-for="genre in genres" :key="genre" :value="genre">{{ genre }}</option>
            </select>
            <select v-model="editGame.platform">
              <option v-for="platform in platforms" :key="platform" :value="platform">{{ platform }}</option>
            </select>
          </div>
          <div class="edit-row">
            <input type="number" v-model.number="editGame.year" placeholder="Год" />
            <input type="number" v-model.number="editGame.rating" min="1" max="10" placeholder="Рейтинг" />
          </div>
          <div class="actions">
            <button @click="saveEdit">Сохранить</button>
            <button @click="cancelEdit">Отмена</button>
          </div>
        </template>
      </div>
    </div>
    <footer class="site-footer">
      GameHub — библиотека ваших игр © 2026
    </footer>
  </div>
</template>

<style scoped>
.app-container {
  max-width: 900px;
  margin: 0 auto;
  padding: 1.5rem;
  font-family: Arial, sans-serif;
  color: #333;
}

.site-header {
  text-align: center;
  padding: 1rem;
  background-color: #2196f3;
  border-radius: 8px;
  color: white;
  margin-bottom: 1.5rem;
}

.logo {
  margin: 0;
  font-size: 1.8rem;
}

.stats-block {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
  gap: 0.75rem;
  margin-bottom: 1.5rem;
}

.stat-card {
  background: #f9f9f9;
  border: 1px solid #e0e0e0;
  border-radius: 8px;
  padding: 0.75rem;
  text-align: center;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

.stat-value {
  font-size: 1.4rem;
  font-weight: bold;
  color: #2196f3;
}

.stat-label {
  font-size: 0.85rem;
  color: #666;
  margin-top: 0.25rem;
}

.form-block,
.filters-block {
  background: #f9f9f9;
  padding: 1rem;
  border-radius: 8px;
  margin-bottom: 1.5rem;
}

h2 {
  text-align: center;
  margin-bottom: 1rem;
  font-size: 1.1rem;
}

.row {
  display: flex;
  gap: 1rem;
  margin-bottom: 0.75rem;
  flex-wrap: wrap;
}

input[type="text"],
input[type="number"],
select {
  padding: 0.5rem 0.75rem;
  border: 1px solid #ccc;
  border-radius: 4px;
  min-width: 160px;
}

input:focus,
select:focus {
  outline: none;
  border-color: #2196f3;
}

.checkbox-label {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  cursor: pointer;
}

button {
  padding: 0.5rem 1rem;
  background-color: #2196f3;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:hover:not(:disabled) {
  background-color: #1976d2;
}

button:disabled {
  background-color: #ccc;
  cursor: not-allowed;
}

.btn-delete {
  background-color: #ef4444;
}

.btn-delete:hover {
  background-color: #dc2626;
}

.btn-fav {
  background-color: #f59e0b;
}

.btn-fav:hover {
  background-color: #d97706;
}

.cards {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
  gap: 1rem;
}

.card {
  background: #fff;
  border: 1px solid #e0e0e0;
  border-radius: 8px;
  padding: 1rem;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.card.is-completed {
  border-left: 4px solid #22c55e;
}

.card.is-favorite {
  border: 1px solid #f59e0b;
  background: #fffbeb;
}

.card-header {
  font-weight: 600;
  font-size: 1.1rem;
  margin-bottom: 0.25rem;
}

.fav-mark {
  color: #f59e0b;
}

.card-row {
  display: flex;
  justify-content: space-between;
  font-size: 0.9rem;
}

.label {
  color: #666;
}

.status-done {
  color: #22c55e;
  font-weight: 600;
}

.status-not {
  color: #ef4444;
  font-weight: 600;
}

.actions {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  margin-top: auto;
  padding-top: 0.5rem;
  border-top: 1px solid #f0f0f0;
}

.actions button {
  font-size: 0.8rem;
  padding: 0.3rem 0.6rem;
}

.edit-row {
  display: flex;
  gap: 0.5rem;
  margin-bottom: 0.5rem;
}

.edit-row input,
.edit-row select {
  flex: 1;
  min-width: 0;
  font-size: 0.85rem;
  padding: 0.4rem 0.5rem;
}

.empty {
  grid-column: 1 / -1;
  text-align: center;
  color: #888;
  font-style: italic;
  padding: 2rem;
  border: 1px dashed #e0e0e0;
  border-radius: 8px;
}

.site-footer {
  text-align: center;
  padding: 1rem;
  margin-top: 1.5rem;
  color: #888;
  font-size: 0.85rem;
  border-top: 1px solid #e0e0e0;
}
</style> -->







<!-- урок1 -->
<!-- <script setup>
import Header from './components/Header.vue';
import MainContent from './components/MainContent.vue';
import Footer from './components/Footer.vue';
</script>

<template>
  <div>
    <h1>Главная страница</h1>
    <Header/>
    <MainContent/>
    <Footer/>
  </div>
</template>

<style scoped>


</style> -->


<!-- урок2 -->
<script setup>
import{ref} from 'vue'
import UserCard from './components/UserCard.vue';
// import UserCard from './components/UserCard.vue';
// const name=ref("qwerty")
// function changeName(){
//   name.value="dddddddddd"
// }

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
function removeUser(id){
  users.value=users.value.filter(user=>user.id!==id)
}

</script>
<template>
  <div>
    <!-- <UserCard
    :name="name"
    :age="age"
    @chande-name="changeName"
    /> -->


    <UserCard
    v-for="user in users":key="user.id"
    :id="user.id"
    :name="user.name"
    :age="user.age"
    @delete-user="removeUser"/>
  </div>
</template>

<style scoped>


</style>