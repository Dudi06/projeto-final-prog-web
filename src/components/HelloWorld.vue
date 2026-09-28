<template>
  <div>
    <p>{{ message }}</p>
    <button @click="fetchData">Buscar do Backend</button>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'

const message = ref('')

const fetchData = async () => {
  try {
    const response = await axios.get('/api/hello')
    message.value = response.data.message
  } catch (error) {
    console.error('Erro na requisição:', error)
    if (error.response) {
      message.value = `Erro ${error.response.status}: ${JSON.stringify(error.response.data)}`
    } else if (error.request) {
      message.value = 'Sem resposta do servidor (proxy/backend fora do ar?)'
    } else {
      message.value = `Erro: ${error.message}`
    }
  }
}
</script>