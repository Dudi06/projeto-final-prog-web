<!--Ex1: https://primevue.dev/toolbar/-->
<template>
  <Toolbar class="app-toolbar">
    <template #start>
      <div class="flex items-center gap-2">
        <Button
          icon="pi pi-bars"
          variant="text"
          severity="secondary"
          aria-label="Abrir menu"
        />

        <span class="text-lg font-bold">YUGIOH STORE</span>
      </div>
    </template>

    <template #center>
      <IconField>
        <InputText
          v-model="searchQuery"
          placeholder="Procure por Card e Produtos"
          class="search-input"
          @keyup.enter="searchProducts"
        />
        <InputIcon>
          <i class="pi pi-search search-icon" />
        </InputIcon>
      </IconField>
    </template>

    <template #end>
      <div class="flex items-center gap-2">
        <AppButton
          label="Login"
          icon="pi pi-user"
          variant="text"
          severity="primary"
          aria-label="Minha conta"
          @click="$router.push('/usuario')"
        />
        <AppButton
          icon="pi pi-shopping-cart"
          variant="text"
          severity="primary"
          aria-label="Carrinho"
          @click="$router.push('/carrinho')"
        />
      </div>
    </template>
  </Toolbar>
</template>

<script setup>
import { ref } from 'vue';

import Toolbar from 'primevue/toolbar';
import Button from 'primevue/button';
import InputText from 'primevue/inputtext';
import IconField from 'primevue/iconfield';
import InputIcon from 'primevue/inputicon';
import AppButton from './AppButton.vue';

import { useRouter } from 'vue-router';

const searchQuery = ref('');
const router = useRouter();

function searchProducts() {
  if (!searchQuery.value.trim()) return;

  router.push({
    path: '/produto',
    query: { busca: searchQuery.value.trim() }
  });
}
</script>

<style scoped>
  .app-toolbar {
    border: none;
    border-radius: 0;
    background: #000000;
    color: #ffffff;
  
  .search-icon {
    color: red
  }
}

.search-input {
  width: min(35vw, 400px);
  background-color: lightgray;
}

.search-input::placeholder{
  font-style: italic;
  color: darkslategray;
}

</style>
