
<template>
  <div class="tela-login">
    <h1 class="titulo-login">Tela Login</h1>

    <form @submit.prevent="entrar">
      <div class="campo-login">
        <label for="login">Login</label>
        <IconField>
          <InputIcon>
            <i class="pi pi-user" />
          </InputIcon>

          <InputText
            id="login"
            v-model.trim="login"
            type="text"
            placeholder="Digite seu login"
            autocomplete="username"
            required
            fluid
          />
        </IconField>
      </div>

      <div class="campo-login">
        <label for="senha">Senha</label>
        <IconField>
          <InputIcon>
            <i class="pi pi-lock" />
          </InputIcon>

          <InputPassword
            inputId="senha"
            v-model="senha"
            placeholder="Digite sua senha"
            autocomplete="current-password"
            :feedback="false"
            toggleMask
            fluid
            required
          />
        </IconField>
      </div>

      <AppButton
        :label="carregando ? 'Entrando...' : 'Entrar'"
        type="submit"
        :disabled="carregando"
        class="botao-entrar"
      />

      <p v-if="erro" class="erro">{{ erro }}</p>
    </form>

    <p class="cadastro-link">
      Não tem conta?
      <router-link to="/cadastro">Cadastre-se</router-link>
    </p>
  </div>
</template>

<script>
import { saveAuth } from '@/services/auth'

import InputText from 'primevue/inputtext'
import IconField from 'primevue/iconfield'
import InputIcon from 'primevue/inputicon'
import InputPassword from 'primevue/inputpassword'

import AppButton from '@/components/AppButton.vue'

export default {
  name: 'telaLogin',

  components: {
    InputText,
    InputPassword,
    IconField,
    InputIcon,
    AppButton
  },

  data() {
    return {
      login: '',
      senha: '',
      erro: '',
      carregando: false
    }
  },

  methods: {
    async entrar() {
      this.erro = ''
      this.carregando = true

      try {
        const res = await fetch(
          `/api/usuarios/login/${encodeURIComponent(this.login)}`
        )

        if (res.status === 404) {
          this.erro = 'Usuário não encontrado.'
          return
        }

        if (!res.ok) {
          this.erro = `Erro ao consultar usuário (HTTP ${res.status}).`
          return
        }

        const usuario = await res.json()

        if (usuario.senha !== this.senha) {
          this.erro = 'Senha incorreta.'
          return
        }

        saveAuth(usuario)

        // Redireciona: prioridade para ?redirect, senão escolhe por perfil
        const redirect = this.$route.query.redirect

        if (redirect) {
          this.$router.replace(redirect)
        } else if (usuario.administrador === true) {
          this.$router.replace({ name: 'telaAdministrador' })
        } else {
          this.$router.replace({ name: 'telaUsuario' })
        }
      } catch (e) {
        this.erro = 'Falha de conexão com o servidor.'
      } finally {
        this.carregando = false
      }
    }
  }
}
</script>

<style scoped>
.tela-login {
  max-width: 400px;
  margin: 3rem auto;
  padding: 2rem;
  background: var(--surface-card);
  border: 1px solid var(--surface-border);
  border-radius: 12px;
}

.titulo-login {
  margin: 0 0 1.75rem;
  text-align: center;
  font-size: 1.8rem;
  font-weight: 700;
}

form {
  display: flex;
  flex-direction: column;
  gap: 1.25rem;
}

.campo-login {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.campo-login label {
  font-size: 0.9rem;
  font-weight: 600;
}

.campo-login :deep(.p-icon-field) {
  width: 100%;
}

.campo-login :deep(.p-inputtext),
.campo-login :deep(.p-password),
.campo-login :deep(.p-password-input) {
  width: 100%;
}

.botao-entrar {
  width: 100%;
}

.erro {
  margin: 0;
  color: #b00020;
  font-size: 0.9rem;
}

.cadastro-link {
  margin: 1.5rem 0 0;
  text-align: center;
  font-size: 0.9rem;
}

.cadastro-link a {
  font-weight: 600;
}

@media (max-width: 480px) {
  .tela-login {
    margin: 1.5rem 1rem;
    padding: 1.5rem;
  }
}
</style>