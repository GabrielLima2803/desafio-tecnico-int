## Projeto de Web Scraping em Java com Maven

Este README tem como objetivo orientar você a iniciar um projeto Java para web scraping utilizando o Maven como ferramenta de gerenciamento de dependências e build.

---

### Pré-requisitos

Antes de iniciar, certifique-se de ter instalado:

- **Java JDK** (versão 8 ou superior)
- **Apache Maven** (versão 3 ou superior)
- Um **IDE** de sua preferência (Eclipse, IntelliJ IDEA, VS Code, etc.)

Verifique as instalações com os comandos:

```bash
java -version
mvn -version
```

### Como excutar

1. **Instale as dependências:**
```bash
mvn clean install
```

2. **Compile o projeto:**
```bash
mvn compile
```

3. **Execute a aplicação:**
```bash
mvn exec:java -Dexec.mainClass="com.lima.App"
```