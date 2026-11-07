<!-- урок1 -->
<script setup>
import { ref, computed } from 'vue';

</script>

<template>
  <div class="body">
    <div class="header">
      <div class="name">Данные пользователей</div>
      <div class="buttons-container">
        <button class="button">Главная</button>
        <button class="button">О нас</button>
        <button class="button">Контакты</button>
        <button class="button">Гео</button>
      </div>
    </div>
  </div>
</template>

<style scoped>
.body {
  width: 100%;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.header {
  position: sticky;
  top: 0;
  z-index: 10;
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  min-height: 80px;
  background: linear-gradient(135deg, #4facfe 0%, #00c6fb 100%);
  padding: 12px 40px;
  flex-wrap: wrap;
  gap: 16px;
}

.name {
  font-size: 28px;
  font-weight: 800;
  color: #ffffff;
  line-height: 1.2;
  letter-spacing: 1px;
  text-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
  white-space: nowrap;
}

.buttons-container {
  display: flex;
  gap: 12px;
  flex-wrap: wrap;
}

.button {
  padding: 10px 22px;
  border: 1px solid rgba(255, 255, 255, 0.4);
  border-radius: 24px;
  background-color: rgba(255, 255, 255, 0.15);
  color: #ffffff;
  font-size: 14px;
  font-weight: 600;
  letter-spacing: 0.3px;
  cursor: pointer;
  transition: all 0.25s ease;
  backdrop-filter: blur(6px);
}



</style>

