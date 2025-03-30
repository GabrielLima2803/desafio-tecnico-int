import { defineStore } from "pinia";
import { computed, reactive } from "vue";
import OperadoraService from "@/services/operadora";

export const useOperadoraStore = defineStore("operadora", () => {
  const state = reactive({
    operadoras: [],
  });

  const operadoras = computed(() => state.operadoras);

  async function getOperadoras(searchTerm = "") {
    try {
      const response = await OperadoraService.getOperadoras(searchTerm);
      state.operadoras = response;
    } catch (error) {
      console.error("Erro ao buscar operadoras:", error);
    }
  }

  return { operadoras, getOperadoras };
});
