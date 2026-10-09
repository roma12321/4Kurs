<script setup>
import { ref, computed } from 'vue';

const games = [
  { id: 1, name: 'CS2', game: 'RPG', rating: 9.7 },
  { id: 2, name: 'Dota 2', game: 'Action RPG', rating: 9.2 },
  { id: 3, name: 'CS0', game: 'Puzzle', rating: 9.5 },
  { id: 4, name: 'Dota 0', game: 'Simulation', rating: 9.0 },
  { id: 5, name: 'CS1', game: 'Platformer', rating: 9.3 },
  { id: 6, name: 'Dota 1', game: 'Metroidvania', rating: 9.4 },
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
