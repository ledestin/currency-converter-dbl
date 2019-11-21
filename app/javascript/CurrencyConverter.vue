<template>
  <div>
    <h1>Convert currency</h1>
    <input type="number" step="0.01" />
    <select>
      <option>USD</option>
    </select>
    <button><--></button>
    <select>
      <option>AUD</option>
    </select>
    <button>></button>

    <br/>
    <h4>{{ from }} =</h4>
    <h1>{{ to }}</h1>
  </div>
</template>

<script>
export default {
  data() {
    return {
      from: "1 NZD",
      to: "0.64 USD"
    }
  }
}
</script>
