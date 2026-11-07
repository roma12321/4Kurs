<script setup>
import { ref, computed } from 'vue';

</script>

<template>
  <footer class="footer-styled">
    <span>Aboba Project</span>
    <span>Сделано с ❤️</span>
  </footer>
</template>

<style scoped>
.footer-styled {
  background: linear-gradient(135deg, #f8fafc 0%, #ffffff 100%);
  border-top: 1px solid #e0e7ff;
  padding: 24px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  max-width: 420px; 
  margin: 40px auto 0;
  border-radius: 0 0 24px 24px;
  color: #374151;
  font-size: 14px;
}

</style>

