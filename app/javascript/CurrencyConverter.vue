<template>
  <div>
    <h1>Convert currency</h1>
    <form id="convert_form">
      <input name="date" type="date" v-model="date" />
      <br/>
      <input name="amount" type="number" step="0.01" v-model="amount"/>
      <select name="from_currency" v-model="from">
        <option v-for="currency in availableCurrencies">{{ currency }}</option>
      </select>
      <button @click.prevent="swapCurrencies"><--></button>
      <select name="to_currency" v-model="to">
        <option v-for="currency in availableCurrencies">{{ currency }}</option>
      </select>
      <button type="submit" @click.prevent="convertCurrency">></button>
    </form>

    <br/>
    <div v-if="showConversionOutput">
      <h4>{{ amount }} {{ from }} =</h4>
      <h1>{{ convertedAmount }} {{ to }}</h1>
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
      convertedAmount: null,
      from: "NZD",
      to: "USD",
      date: null,
      showConversionOutput: false
    }
  },
  watch: {
    amount() {
      this.hideConversionOutput()
    },
    from() {
      this.hideConversionOutput()
    },
    to() {
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
      [this.to, this.from] = [this.from, this.to]
    }
  },
  mounted() {
    this.fetchAvailableCurrencies()
  }
}
</script>
