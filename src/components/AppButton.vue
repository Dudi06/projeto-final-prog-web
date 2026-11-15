
<template>
  <RouterLink
    v-if="to"
    :to="to"
    custom
    v-slot="{ navigate }"
  >
    <Button
      :label="label"
      :severity="severity"
      :outlined="outlined"
      :disabled="disabled"
      @click="navigate"
    />
  </RouterLink>

  <Button
    v-else
    :label="label"
    :severity="severity"
    :outlined="outlined"
    :disabled="disabled"
    @click="$emit('click', $event)"
  />
</template>

<script>
import Button from 'primevue/button'
import { RouterLink } from 'vue-router'

export default {
  name: 'AppButton',

  components: {
    Button,
    RouterLink
  },

  props: {
    label: {
      type: String,
      required: true
    },

    to: {
      type: [String, Object],
      default: null
    },

    severity: {
      type: String,
      default: 'primary'
    },

    outlined: {
      type: Boolean,
      default: false
    },

    disabled: {
      type: Boolean,
      default: false
    }
  },

  emits: ['click']
}
</script>
