<template>
  <div id="app">
    <CurrencyConverter class="center" />
  </div>
</template>

<script>
import CurrencyConverter from "./CurrencyConverter"

export default {
  components: {
    CurrencyConverter
  }
}
</script>

<style>
p {
  font-size: 2em;
  text-align: center;
}

.center {
  text-align: center;
}
</style>
