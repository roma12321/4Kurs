<script setup>
defineProps({
    name:String,
    age:Number
})
</script>
<template>
    <div class="card">
        <h2>{{ name }}</h2>
        <p>
            Возраст:{{ age }}
        </p>
    </div>
</template>
<style scoped>
.card {
  background-color: #ffffff;
  padding: 24px;
  border-radius: 16px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
  width: 280px;           
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  transition: box-shadow 0.2s ease, transform 0.2s ease;
}

.card h2 {
  font-size: 22px;
  font-weight: 700;
  color: #1a1a1d;
  margin: 0 0 8px;
}

.card p {
  font-size: 16px;
  color: #6b7280;
  margin: 0;
}

</style>
