<template>
  <div>
    <h1>Convert currency</h1>
    <input type="number" step="0.01" />
    <select>
      <option v-for="currency in availableCurrencies">{{ currency }}</option>
    </select>
    <button><--></button>
    <select>
      <option v-for="currency in availableCurrencies">{{ currency }}</option>
    </select>
    <button>></button>

    <br/>
    <h4>{{ from }} =</h4>
    <h1>{{ to }}</h1>
  </div>
</template>

<script>
import axios from "axios"

export default {
  data() {
    return {
      availableCurrencies: [],
      from: "1 NZD",
      to: "0.64 USD"
    }
  },
  mounted() {
    axios.get("/currencies").then(response => {
      this.availableCurrencies = response.data.available_currencies
    })
  }
}
</script>
