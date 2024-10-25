## Índice

- [Objetivo](#objetivo)
- [Escopo](#escopo)
- [Contexto](#Contexto)
- [Restrições](#Restrições)
- [Trade-offs](#Trade-offs)
- [C4 Model](#C4Model)
- [Requisitos e casos de uso](#RequisitoseCasosdeuso)
- [Modelagem]()
- [Instalação]()
- [Stacks]()
-
- [Monitoramento](Docs/Monitoramento.md)

## Objetivo

Este projeto tem como objetivo principal ser uma lista de tarefas, o Task Scribe, com foco em ajudar a organizar os objetivos de curto e longo prazo. Sendo fácil e prático de utilizar para que todos consigam compreender como funciona.

## Escopo

**Coleta de dados**

- Dados do Usuário: Coletamos informações de registro, como nome de usuário, e-mail (se necessário) e senha para autenticação;
- Tarefas do Usuário: Coletamos detalhes das tarefas, como título, descrição, data de vencimento e status de conclusão, que são armazenados no sistema;
- Atividades do Usuário: Registramos ações do usuário, como adição, edição, marcação como concluída ou exclusão de tarefas, para fornecer histórico e insights;
- Logs e Erros: Mantemos registros de eventos e possíveis erros no sistema para depuração e melhorias;
- Análise de Uso: Coletamos dados de uso, como tempo gasto, frequência de login e padrões de uso, para melhorar a experiência do usuário.

**Pré-processamento**

- Vai ser utilizado o firebase para coletar os dados, o usuário irá fazer o login com a conta do google, assim criará suas tarefas e poderá edita-lás. Assim será salvo e os dados poderão ser analisados para futuras melhorias no projeto.

**3. Design de Interface:**

- Todas as telas serão criadas no figma para base, assim que for para o código irá ser um desgin responsivo.

**4. Desenvolvimento:**

- O projeto terá o front-end desenvolvido em Next.js, já com o back-end a API poderá ler, editar e excluir as tarefas, que serão salvas no banco de dados utilizado (Firebase).

**5. Qualidade:**

- Para garantir que o projeto funcione e tenha qualidade, será utilizado teste unitário, assim validando o código e seu funcionamento.

**6. CI/CD:**

- A implementação de Continuous Integration e Continuous Delivery será realizada com o próprio GitHub e também em um armanzenamento da máquina local, aonde o projeto está sendo realizado.

**7. Observabilidade:**

- Para esse requisito, o próprio Firebase será utilizado, pois o mesmo possuí a capacidade de análise de desempenho, rastreamento de erros, análise de eventos e muito mais.

## Contexto

O objetivo principal de um site de lista de tarefas é permitir que os usuários organizem suas tarefas pessoais ou profissionais. Isso pode incluir coisas como compras de supermercado, tarefas domésticas, projetos de trabalho, prazos acadêmicos e muito mais.

## Restrições

Recursos Financeiros Limitados: Se o desenvolvimento e a manutenção do site de lista de tarefas estiverem sujeitos a restrições orçamentárias, isso pode limitar a escolha de tecnologias, recursos e funcionalidades disponíveis.

## Trade-offs

- **Portabilidade:**

O site irá funcionar em todos os dispositivos e plataformas, onde o usuário poderá acessar tanto no navegador do seu computador quanto no navegador do celular, assim facilitando a visibilidade de seus afazeres a qualquer momento em qualquer lugar.

- **Funcionalidade:**

Será um site prático e fácil de utilizar, sendo bem informativo em relação a como criar, excluir ou editar cada tarefa e lista. Sendo assim, o Task Scribe irá atender a necessecidade do usuário de forma simples e eficiente.

- **Confiabilidade:**

O site irá funcionar 24/7, sendo assim sempre estará disponível para o usuário. Terá o sistema de backup, que ficará guardado dentro no banco de dados, facilitando que qualquer processo possa ser revisado, caso necessário. Assim, também terá o sistema de login pela conta do google, mantendo em sigilo cada perfil de usuário.

- **Usabilidade:**

O site terá uma interface de usuário limpa e intuitiva que seja fácil de entender e usar. Os elementos da interface, como botões, menus e formulários, serão organizados de maneira lógica e fácil de navegar.

- **Eficiência:**

Além da interface simplificada, terá também agrupamento lógico e carregamento rápido, facilitando o uso do site e aprimorando a experiência do usuário.

- **Manutenibilidade:**

Por ser um site simples e fácil manutenção, dependendo do tempo e do requiremento de uso, pode ser necessário o investimento em programas para realizar o serviço de manutenção.

## C4 Model

O diagramas com base no modelo C4 se encontram [aqui.](Docs/C4diagrams.md)

## Requisitos e Casos de uso

O requisitos funcionais e não funcionais se encontram [aqui.](Docs/requisitos.md)

## Modelagem

Foi utilizado o Trello, para organizar as atividades e avaliações a serem realizadas, de acordo com cada cronograma. Foi dividido em três partes, sendo classificadas como N1, N2 e N3.
