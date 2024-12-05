# Requisitos do Projeto

## Requisitos Funcionais:

1. **Cadastro e Autenticação de Usuários:**

   - **RF01:** O sistema deve permitir o cadastro de usuários.
   - **RF02:** O sistema deve permitir o login de usuários cadastrados com autenticação **JWT (JSON Web Token)**.
   - **RF03:** O sistema deve permitir que o usuário delete sua conta.
   - **RF04:** O sistema deve permitir que o usuário encerre sua sessão.

2. **Análise de Problemas de Pele:**

   - **RF05:** O sistema permite até **20 análises mensais** por usuário.
   - **RF06:** O sistema deve exibir as todas as análises do usuário.
   - **RF07:** O sistema deve permitir realizar análises a partir da câmera ou galeria do dispositivo.
   - **RF08:** O modelo gerado deve ser um modelo CNN para a classificação de imagens.
   - **RF09:** Apenas análises com confiança superior a **0.4** são exibidas com detalhes para os usuários.

3. **Página de Detalhes e Informações Adicionais:**
   - **RF10:** O sistema deve exibir detalhes sobre cada análise feita pelo usuário.
   - **RF11:** O sistema deve exibir conteúdo sobre a análise feita pelo usuário.

---

## Requisitos Não Funcionais:

1. **Segurança e Privacidade:**

   - **RNF01:** O sistema deve garantir a segurança dos dados do usuário.

2. **Desempenho:**

   - **RNF02:** O sistema deve ter um bom desempenho.

3. **Usabilidade:**

   - **RNF03:** O sistema deve ter uma interface intuitiva e fácil de utilizar.

4. **Manutenibilidade:**

   - **RNF04:** O sistema deve ser modular e bem arquitetado, permitindo atualizações futuras e fácil manutenção.

5. **Testes e Validação:**
   - **RNF05:** O sistema deve apresentar testes unitários.

---

## Funcionalidades Específicas do Sistema:

- **Cadastro e Exclusão de Conta:**  
  Usuários podem registrar-se, autenticar-se e encerrar sua conta. A exclusão dos dados está em conformidade com a **LGPD**.

- **Análises de Pele:**  
  Os usuários podem realizar até **20 análises mensais** utilizando a câmera ou galeria do dispositivo. Apenas análises com confiança superior a **0.4** são exibidas ao usuário.

- **Histórico de Análises:**  
  O histórico exibe as **3 análises mais recentes**, permitindo que os usuários revisitem os resultados.

- **Informações Educacionais:**  
  O aplicativo inclui **perguntas frequentes** e **dicas práticas de cuidados com a pele** para ajudar os usuários no dia a dia.

- **IA Generativa para Explicações Detalhadas:**  
  A página de detalhes de uma análise utiliza **ChatGPT** para gerar explicações personalizadas sobre o problema identificado.

---
