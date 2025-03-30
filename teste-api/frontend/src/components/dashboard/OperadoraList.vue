<template>
  <div>
    <SearchPrompt v-if="operadoraStore.operadoras.length === 0 && searchTerm.trim() === ''" />

    <v-row v-if="operadoraStore.operadoras.length > 0">
      <v-col
        v-for="operadora in operadoraStore.operadoras"
        :key="operadora.registro_ans"
        cols="12"
        sm="6"
        md="4"
      >
        <v-card class="mb-4">
          <v-card-title class="headline">
            {{ operadora.razao_social }}
          </v-card-title>
          <v-card-text>
            <div><strong>CNPJ:</strong> {{ operadora.cnpj }}</div>
            <div><strong>Nome Fantasia:</strong> {{ operadora.nome_fantasia }}</div>
            <div><strong>Modalidade:</strong> {{ operadora.modalidade }}</div>
            <div><strong>Cidade:</strong> {{ operadora.cidade }} - {{ operadora.uf }}</div>
          </v-card-text>
          <v-card-actions>
            <v-btn @click="showModal(operadora)">Ver Mais</v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>

    <v-dialog v-model="dialog" max-width="600px">
      <v-card>
        <v-card-title class="headline">Detalhes da Operadora</v-card-title>
        <v-card-text>
          <div><strong>Razão Social:</strong> {{ selectedOperadora.razao_social }}</div>
          <div><strong>CNPJ:</strong> {{ selectedOperadora.cnpj }}</div>
          <div><strong>Nome Fantasia:</strong> {{ selectedOperadora.nome_fantasia }}</div>
          <div><strong>Modalidade:</strong> {{ selectedOperadora.modalidade }}</div>
          <div><strong>Representante:</strong> {{ selectedOperadora.representante }}</div>
          <div><strong>Telefone:</strong> {{ selectedOperadora.telefone }}</div>
          <div><strong>Endereço:</strong> {{ selectedOperadora.logradouro }} - {{ selectedOperadora.numero }}, {{ selectedOperadora.complemento }}, {{ selectedOperadora.bairro }}</div>
          <div><strong>Cidade:</strong> {{ selectedOperadora.cidade }} - {{ selectedOperadora.uf }}</div>
          <div><strong>Data Registro ANS:</strong> {{ selectedOperadora.data_registro_ans }}</div>
        </v-card-text>
        <v-card-actions>
          <v-btn color="primary" @click="dialog = false">Fechar</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script setup>
import { useOperadoraStore } from "@/stores/operadora";
import { ref, watch } from "vue";
import SearchPrompt from "./SearchPrompt.vue";

const operadoraStore = useOperadoraStore();
const searchTerm = ref("");

const dialog = ref(false);
const selectedOperadora = ref(null);

const showModal = (operadora) => {
  selectedOperadora.value = operadora;
  dialog.value = true;
}

watch(searchTerm, (newValue) => {
  if (newValue !== "") {
    operadoraStore.getOperadoras(searchTerm.value);
  }
});
</script>
