
<template>
  <main class="pagina-testes">
    <h1>Teste de botões</h1>
    <p>Área para testar os componentes compartilhados do projeto.</p>

    <section class="grupo-botoes">
      <h2>Botões padrão</h2>

      <AppButton label="Primário" severity="primary" />
      <AppButton label="Secundário" severity="secondary" />
      <AppButton label="Perigo" severity="danger" />
    </section>

    <section class="grupo-botoes">
      <h2> Botões Sucesso & Falha </h2>
      <AppButton label="Sucesso" severity="success" />
      <AppButton label="Perigo" severity="danger" />
    </section>

    <section class="grupo-botoes">
      <h2>Botões com contorno</h2>

      <AppButton label="Primário" severity="primary" outlined />
      <AppButton label="Secundário" severity="secondary" outlined />
      <AppButton label="Perigo" severity="danger" outlined />
    </section>

    <section class="grupo-botoes">
      <h2>Estados</h2>

      <AppButton label="Desabilitado" disabled />
      <AppButton label="Clique aqui" @click="mostrarMensagem" />
    </section>

    <p v-if="mensagem" class="mensagem">{{ mensagem }}</p>
  </main>
</template>

<script>
import AppButton from '@/components/AppButton.vue'

export default {
  name: 'TesteBotoes',

  components: {
    AppButton
  },

  data() {
    return {
      mensagem: ''
    }
  },

  methods: {
    mostrarMensagem() {
      this.mensagem = 'O botão está funcionando!'
    }
  }
}
</script>

<style scoped>
.pagina-testes {
  padding: 2rem;
}

.grupo-botoes {
  margin-top: 2rem;
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 0.75rem;
}

.grupo-botoes h2 {
  width: 100%;
  font-size: 1.2rem;
}

.mensagem {
  margin-top: 1.5rem;
  color: green;
}
</style>
