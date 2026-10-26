<template>
  <div id="nav">
      <p> Navegação temporaria do site </p>
      <router-link to="/"> Tela Principal</router-link> |
      <router-link to="/login"> Tela Login</router-link> |
      <router-link to="/cadastro">Tela Cadastro</router-link> |
      <router-link to="/produto"> Tela Produto</router-link> |
      <router-link to="/carrinho"> Tela Carrinho</router-link> |
      <router-link to="/usuario"> Tela Usuario</router-link> |
      <router-link to="/administrador"> Tela Administrador</router-link> 
  </div>
</template>

<script>            
export default {
  name: 'tempNav'
}
</script>