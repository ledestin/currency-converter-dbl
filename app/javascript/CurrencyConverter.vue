<template>
  <div>
    <h1>Convert currency</h1>
    <form id="convert_form">
      <input name="date" type="date" v-model="date" />
      <br/>
      <input name="amount" type="number" step="0.01" v-model="amount"/>
      <select name="source_currency" v-model="sourceCurrency">
        <option v-for="currency in availableCurrencies">{{ currency }}</option>
      </select>
      <button @click.prevent="swapCurrencies"><--></button>
      <select name="destination_currency" v-model="destinationCurrency">
        <option v-for="currency in availableCurrencies">{{ currency }}</option>
      </select>
      <button type="submit" @click.prevent="convertCurrency">></button>
    </form>

    <br/>
    <div v-if="showConversionOutput">
      <h4>{{ amount }} {{ sourceCurrency }} =</h4>
      <h1>{{ convertedAmount }} {{ destinationCurrency }}</h1>
    </div>
  </div>
</template>

<script>
import axios from "axios"

export default {
  data() {
    return {
      availableCurrencies: [],
      amount: 1,
      sourceCurrency: "NZD",
      destinationCurrency: "USD",
      date: null,
      showConversionOutput: false,
      convertedAmount: null
    }
  },
  watch: {
    amount() {
      this.hideConversionOutput()
    },
    sourceCurrency() {
      this.hideConversionOutput()
    },
    destinationCurrency() {
      this.hideConversionOutput()
    },
    date() {
      this.hideConversionOutput()
    }
  },
  methods: {
    hideConversionOutput() {
      this.showConversionOutput = false
    },
    convertCurrency() {
      const form = document.getElementById("convert_form")
      const formData = new FormData(form)
      const queryString = new URLSearchParams(formData).toString()

      axios.get(`/convert?${queryString}`).then(response => {
        this.convertedAmount = response.data.converted_amount
        this.showConversionOutput = true
      })
    },
    fetchAvailableCurrencies() {
      axios.get("/currencies").then(response => {
        this.availableCurrencies = response.data.available_currencies
      })
    },
    swapCurrencies() {
      [this.destinationCurrency, this.sourceCurrency] =
        [this.sourceCurrency, this.destinationCurrency]
    }
  },
  mounted() {
    this.fetchAvailableCurrencies()
  }
}
</script>
