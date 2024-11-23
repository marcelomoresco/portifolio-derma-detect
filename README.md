## Índice

- [Objetivo](#objetivo)
- [Escopo](#escopo)
- [Contexto](#contexto)
- [Restrições](#restrições)
- [Trade-offs](#trade-offs)
- [C4 Model](#c4-model)
- [Requisitos e Casos de Uso](docs/requisitos.md)
- [Modelagem](#modelagem)
- [Instalação](#instalação)
- [Stacks](#stacks)
- [Monitoramento](#monitoramento)

---

## Objetivo

O principal objetivo deste projeto é fornecer um **aplicativo móvel** que auxilie tanto médicos quanto pacientes na **identificação precoce de problemas de pele**, utilizando inteligência artificial. Ele visa fornecer suporte adicional e reduzir a ansiedade dos pacientes, mas **não substitui o diagnóstico médico**. O app é de fácil utilização, permitindo o uso por profissionais e leigos com uma interface intuitiva.

---

## Escopo

**1. Coleta de Dados**

- **Dados do Usuário:** Nome, e-mail, senha, e imagens carregadas pelo usuário para análise de possíveis problemas de pele. O processo de autenticação usa JWT o que garante uma alta segurança para o usuários.
- **Interações:** Salvamos os registros das imagens enviadas, diagnósticos sugeridos e ações realizadas pelo usuário, além de que o usuário tem 20 análises de limite por mês.
- **Armazenamento de Imagens:** As imagens enviadas são salvas no banco de dados (MongoDB) em formato **Base64** para processamento e histórico.

**2. Pré-processamento**

- O backend, implementado em **Node.js**, processa os dados recebidos e interage com o modelo de machine learning para prever possíveis condições de pele. Para realizar essas predições, utilizamos um **algoritmo de CNN (Convolutional Neural Network)**.

  **Por que utilizamos uma CNN?**  
  Redes Neurais Convolucionais (CNNs) são uma classe de algoritmos de aprendizado profundo projetados especificamente para tarefas relacionadas a imagens. Elas se destacam em tarefas de **reconhecimento e classificação de padrões visuais**, sendo amplamente utilizadas para identificar objetos, texturas e outros elementos em imagens. No caso do nosso projeto, que lida com **diagnósticos de problemas de pele**, as CNNs são fundamentais por vários motivos:

**3. Design de Interface**

- O frontend, desenvolvido em **Flutter/Dart**, oferece uma interface responsiva e intuitiva, de fácil entendimento.
- As telas foram projetadas no **Figma** e priorizam a experiência do usuário, com explicações claras sobre como usar o app.

**4. Desenvolvimento**

- **Frontend:** Flutter/Dart para a criação do aplicativo móvel.
- **Backend:** Implementado em Node.js para processar solicitações, gerenciar autenticação e comunicar-se com o modelo de IA.
- **Modelo de IA:** Convolutional Neural Network (CNN), treinado em Python/TensorFlow, foi adaptado para uso em **JavaScript** após conversão.
- **Observabilidade:**: Utilização do próprio dashboard do atlas para a observabilidade do sistema, além dos sistema prometheus e grafana

**5. Escolha do DB**

A escolha do banco de dados para o sistema foi guiada pelas necessidades específicas do projeto e pelos princípios do **Teorema CAP (Consistência, Disponibilidade e Tolerância à Partição).**

### **Teorema CAP e sua Relevância**

De acordo com o Teorema CAP, um sistema distribuído deve priorizar **dois dos três atributos**, conforme as necessidades do projeto. Para o nosso sistema, priorizamos:

- **Disponibilidade (A):** Garantir que o sistema esteja sempre acessível para os usuários, permitindo consultas e interações constantes, como envio de imagens e recuperação de diagnósticos.
- **Tolerância à Partição (P):** Manter a funcionalidade mesmo em cenários de falhas ou desconexão de algum nó, pois trabalhamos com dados de usuários enviados de forma assíncrona.

Dessa forma, **abrimos mão de consistência imediata**, optando por uma eventual consistência para equilibrar essas prioridades.

### **Por que MongoDB foi escolhido?**

O MongoDB foi selecionado como o banco de dados para este sistema devido às suas características que atendem perfeitamente às exigências do projeto:

1. **Modelo de Dados Flexível:**  
   MongoDB é um banco de dados NoSQL baseado em documentos que utiliza o formato **JSON/BSON** para armazenar dados. Isso é ideal para o nosso sistema, pois podemos armazenar imagens (em formato Base64), metadados dos usuários e resultados do modelo de IA em estruturas flexíveis, sem a necessidade de esquemas rígidos.

2. **Alta Disponibilidade:**  
   MongoDB oferece replicação integrada por meio de **Replica Sets**, o que assegura que o sistema continue disponível mesmo em caso de falhas no nó principal. Isso é crucial para garantir que os usuários possam acessar o sistema 24/7.

3. **Suporte à Escalabilidade Horizontal:**  
   O sistema pode crescer facilmente utilizando a estratégia de **sharding** do MongoDB, o que permite distribuir grandes volumes de dados, como imagens de alta resolução, entre vários nós. Isso é importante à medida que mais usuários adotam o sistema.

4. **Tolerância à Partição:**  
   MongoDB é projetado para lidar bem com cenários em que a comunicação entre nós pode ser interrompida temporariamente. Mesmo nesses casos, ele garante a operação contínua do sistema com consistência eventual, recuperando os dados posteriormente.

5. **Armazenamento de Imagens:**  
   Como armazenamos imagens enviadas pelos usuários no formato Base64, o MongoDB se destaca por permitir o armazenamento desses dados como strings BSON diretamente no banco, simplificando a arquitetura sem necessidade de sistemas de arquivos externos.

6. **Desempenho em Consultas:**  
   O uso de índices no MongoDB permite realizar buscas rápidas, como o histórico de diagnósticos ou dados de usuário, essencial para melhorar a experiência do usuário.

**6. Arquitetura do Sistema**

### **Frontend**

No desenvolvimento do frontend, seguimos os **princípios do Clean Architecture**, uma abordagem que promove a separação de responsabilidades e a modularidade do sistema. O código foi estruturado em módulos distintos, garantindo organização e facilidade de manutenção. Cada módulo contém três camadas principais:

1. **Data:**  
   Contém a lógica relacionada a fontes de dados, como APIs e serviços externos. É responsável por realizar chamadas ao backend e tratar as respostas, isolando o fluxo de dados de outras partes do módulo.

2. **Domain:**  
   Reúne as regras de negócio do sistema, definindo a lógica essencial para o funcionamento do app. Essa camada é independente de detalhes de implementação e altamente testável, alinhada ao propósito de Clean Architecture.

3. **Presentation:**  
   Inclui todos os elementos relacionados à interface do usuário (UI) e ao fluxo de interação. É a camada que gerencia o que os usuários veem e interagem, garantindo que a experiência seja fluida e intuitiva.

### **Backend**

Para o backend, seguimos a **arquitetura padrão MVC (Model-View-Controller)**, uma escolha consolidada no desenvolvimento com **Node.js**, por sua simplicidade e eficácia em organizar o fluxo de dados. Os principais componentes são:

1. **Controller:**  
   Responsável por gerenciar as solicitações recebidas do cliente (frontend) e determinar as ações a serem executadas, delegando responsabilidades para o serviço correspondente.

2. **Router:**  
   Define as rotas da aplicação, conectando endpoints HTTP às funções adequadas no Controller.

3. **Models:**  
   Representam as estruturas de dados e gerenciam a interação com o banco de dados. No caso, os modelos utilizam **MongoDB** para armazenar as informações necessárias, como imagens e diagnósticos.

4. **Services:**  
   Contêm a lógica de negócios e manipulação dos dados, funcionando como intermediários entre os controllers e os models. Eles garantem que o fluxo de dados siga as regras definidas.

### **Uso do Docker**

No backend, utilizamos o **Docker** para facilitar o desenvolvimento, a implantação e a manutenção do sistema. O Docker permite que a aplicação seja executada em contêineres isolados, garantindo consistência no ambiente de execução. Algumas vantagens que destacam o uso do Docker incluem:

### **Conclusão**

Combinando o Clean Architecture no frontend e o MVC no backend, complementados pelo uso do Docker, criamos um sistema modular, escalável e altamente eficiente. Essa abordagem não apenas melhora a organização e a manutenção do código, mas também garante que a aplicação funcione de maneira confiável em diferentes ambientes.

**7. Qualidade**

- O código passa por testes unitários para garantir sua funcionalidade.
- Testes específicos do modelo de IA garantem precisão na predição de mais de 20 condições de pele, que foi treinado em cerca de 20 épocas.

**8. CI**

- A integração contínua é realizada com GitHub Actions e armazenamento local para versões de desenvolvimento.

**9. Observabilidade**

- Utilizamos **Grafana** e **Prometheus** para monitorar métricas e eventos do sistema, como uso do banco de dados e desempenho das solicitações.

---

## Contexto

O aplicativo é voltado para o apoio a profissionais médicos e pacientes no diagnóstico inicial de condições dermatológicas. Ele não substitui o diagnóstico médico, mas oferece uma análise prévia que pode agilizar a consulta médica ou reduzir a ansiedade de pacientes.

---

## Restrições

1. **Recursos financeiros limitados:** O app ainda não foi publicado na Play Store devido a restrições orçamentárias.
2. **Processamento no backend:** Imagens de alta resolução podem consumir mais recursos computacionais.

---

## Requisitos e Casos de Uso

Os requisitos funcionais e não funcionais estão detalhados [aqui](docs/requisitos.md).

---

## Modelagem

As atividades e avaliações do projeto foram organizadas no **Trello**, seguindo o **método Kanban** para gerenciamento de tarefas.

- **N1 (Prioridade Alta):**
- **N2 (Prioridade Média):**
- **N3 (Prioridade Baixa):**

No início, o foco foi em **estruturar a arquitetura do app**, garantindo que cada módulo tivesse suas responsabilidades bem definidas. Paralelamente, foi feito o planejamento sobre como desenvolver o modelo de IA, desde a coleta de dados até a integração ao sistema.

Uma decisão estratégica foi a **conversão do modelo de Python para Node.js**, utilizando TensorFlow.js. Essa escolha foi baseada na experiência prévia em desenvolvimento com Node.js, que facilitou a integração do modelo ao backend e otimizou o fluxo de desenvolvimento. O uso de Node.js para a manipulação do modelo também trouxe vantagens em termos de flexibilidade e interoperabilidade com o restante da aplicação.

---

## Stacks

- **Frontend:** Flutter/Dart
- **Backend:** Node.js + Express.js
- **Banco de Dados:** MongoDB
- **Modelo de IA:** TensorFlow (convertido para JS)
- **Observabilidade:** Grafana e Prometheus

## **Particularidades do Modelo**

O modelo foi construído utilizando **MobileNetV2** como base e adaptado para atender às necessidades específicas do projeto, focado na classificação de problemas de pele.

### **MobileNetV2 como base**

- Foi escolhido o **MobileNetV2** pré-treinado com pesos do **ImageNet**, que oferece excelente desempenho em reconhecimento de padrões visuais.
- O modelo base contém **2.257.984 parâmetros não-treináveis**, que já capturam padrões fundamentais.
- O uso de um modelo pré-treinado reduz o tempo de treinamento, melhora a precisão e aproveita o aprendizado prévio para identificar texturas e características específicas da pele.

### **Estrutura adicional personalizada**

Para adaptar o modelo ao nosso caso de uso, adicionamos as seguintes camadas:

1. **GlobalAveragePooling2D:**  
   Reduz as dimensões dos dados de saída da MobileNetV2 para **1280 neurônios**, mantendo informações relevantes.
2. **Dense (256 neurônios):**  
   Uma camada totalmente conectada com **327.936 parâmetros**, responsável por aprender características mais profundas e específicas.
3. **Dropout (40%):**  
   Adiciona regularização para evitar overfitting, desativando aleatoriamente 40% dos neurônios durante o treinamento.
4. **Dense (19 neurônios - Softmax):**  
   Camada de saída com **4.883 parâmetros**, configurada para classificar as imagens em **19 classes**, cada uma representando um tipo de problema de pele.

### **Parâmetros Totais do Modelo**

- **Parâmetros totais:** 2.590.803
- **Parâmetros treináveis:** 332.819
- **Parâmetros não-treináveis:** 2.257.984

### **Parâmetros de Treinamento**

O modelo foi configurado para otimizar o aprendizado e obter alto desempenho:

- **Função de perda:** Categorical Crossentropy, ideal para tarefas de classificação multiclasse.
- **Otimizador:** Adam, com taxa de aprendizado ajustada para **0.0005**, balanceando velocidade e estabilidade no treinamento.
- **Métricas:** Precisão (**accuracy**) para avaliar a performance durante e após o treinamento.

Essa estrutura permite que o modelo seja eficiente, leve e eficaz para identificar diferentes condições dermatológicas com alta precisão.
