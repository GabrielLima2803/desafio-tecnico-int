<template>
  <v-row justify="center">
    <v-col cols="12" md="8">
      <v-text-field
        v-model="searchTerm"
        label="Buscar operadoras"
        outlined
        clearable
        append-icon="mdi-magnify"
      />
    </v-col>
  </v-row>
</template>

<script setup>
import { ref, watch } from "vue";

const searchTerm = ref("");

const emit = defineEmits(["search"]);

const onSearch = () => {
  emit("search", searchTerm.value);
};

watch(searchTerm, (newValue) => {
  if (newValue) {
    onSearch();
  }
});
</script>
