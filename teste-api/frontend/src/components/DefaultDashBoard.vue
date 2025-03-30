<template>
  <SearchBar @search="handleSearch" />
  <OperadoraList :searchTerm="searchTerm" />
</template>

<script setup>
import { useOperadoraStore } from "@/stores/operadora";
import OperadoraList from "./dashboard/OperadoraList.vue";
import SearchBar from "./dashboard/SearchBar.vue";
import { ref } from "vue";

const searchTerm = ref(""); 

const operadoraStore = useOperadoraStore();

const handleSearch = async (searchTermValue) => {
  searchTerm.value = searchTermValue; 
  await operadoraStore.getOperadoras(searchTerm.value);
};
</script>
