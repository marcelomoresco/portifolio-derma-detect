# Requisitos do Projeto

## Requisitos Funcionais:

1. **Cadastro e Autenticação de Usuários:**

   - **RF1:** Usuários podem se registrar no sistema com autenticação segura baseada em **JWT (JSON Web Token)**.
   - **RF2:** Usuários podem fazer login e logout com segurança.
   - **RF3:** Usuários podem encerrar sua conta e solicitar a exclusão de seus dados seguindo políticas de conformidade com a **LGPD**.

2. **Análise de Problemas de Pele:**

   - **RF4:** Usuários podem realizar análises de pele utilizando a câmera ou galeria do dispositivo.
   - **RF5:** O sistema permite até **20 análises mensais** por usuário.
   - **RF6:** Usuários podem visualizar o histórico das **3 últimas análises realizadas** diretamente da home.
   - **RF7:** Usuários podem visualizar a quantidade de análises restantes dentro da home do app.
   - **RF8:** Usuários podem visualizar tods as análises direto da opção de análises.
   - **RF9:** O modelo gerado deve ser um modelo CNN para a classificação de imagens.
   - **RF10:** Apenas análises com confiança superior a **0.4** são exibidas com detalhes para os usuários, garantindo precisão e confiabilidade.

3. **Informações Educacionais e Dicas:**

   - **RF11:** O aplicativo disponibiliza uma seção com **perguntas frequentes** para educar os usuários sobre problemas de pele.
   - **RF12:** O aplicativo fornece **dicas de cuidados** com a pele.

4. **Página de Detalhes e Informações Adicionais:**
   - **RF13:** Na página de detalhes de uma análise, os usuários podem acessar uma explicação adicional gerada por **IA generativa (ChatGPT)** com informações personalizadas sobre o problema de pele identificado.

---

## Requisitos Não Funcionais:

1. **Segurança e Privacidade:**

   - **RNF1:** Implementação de criptografia de dados para garantir a segurança das informações enviadas pelos usuários.
   - **RNF2:** O sistema deve utilizar autenticação segura baseada em JWT para controle de acesso.

2. **Desempenho:**

   - **RNF3:** O sistema deve garantir uma resposta rápida, mesmo com um grande volume de usuários e análises simultâneas.

3. **Usabilidade:**

   - **RNF4:** A interface do aplicativo deve ser intuitiva e de fácil navegação para todos os usuários.

4. **Manutenibilidade:**

   - **RNF5:** O código deve ser modular e bem documentado, permitindo atualizações futuras e fácil manutenção.

5. **Testes e Validação:**
   - **RNF6:** O sistema será submetido a testes unitários para assegurar o funcionamento adequado de suas funcionalidades.

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
