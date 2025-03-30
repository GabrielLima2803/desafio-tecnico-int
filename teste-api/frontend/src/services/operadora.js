import axios from "axios";

class OperadoraService {
  async getOperadoras(searchTerm = "") {
    try {
      const response = await axios.get(`/operadoras/?search=${encodeURIComponent(searchTerm)}`);
      return response.data.results; 
    } catch (error) {
      console.error("Erro ao buscar operadoras:", error.response?.status, error.response?.data || error.message);
      throw new Error("Erro ao buscar operadoras. Verifique a API.");
    }
  }
}

export default new OperadoraService();
