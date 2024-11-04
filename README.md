<h1>MyPortfolio</h1>
<code>
  MyPortfolio é um projeto de portfólio desenvolvido com Ruby on Rails no backend e Vue.js no frontend. O objetivo é criar um portfólio profissional que apresente suas informações pessoais e profissionais, com um painel de administração para gerenciar seus dados.
</code>

Tecnologias Utilizadas
Backend: Ruby on Rails

Frontend: Vue.js

Banco de Dados: PostgreSQL

Estilização: CSS

Animações: GSAP

Containerização: Docker e Docker Compose

Gerenciamento de Dependências: Yarn

Funcionalidades
Páginas Principais:

Informações Profissionais

Sobre Mim

Feed

Contato

Painel de Administração:

Gerenciar Informações Profissionais

Gerenciar Informações Pessoais

Configuração do Projeto
Pré-requisitos
Certifique-se de ter Docker e Docker Compose instalados na sua máquina.

Passos para Configuração
Clone o repositório:

bash

Copiar
git clone https://github.com/seu-usuario/my_portfolio.git
cd my_portfolio
Construir e Iniciar os Contêineres:

bash

Copiar
docker-compose build
docker-compose up
Configurar Banco de Dados:

bash

Copiar
docker-compose run web rake db:create db:migrate
Iniciar o Frontend:

bash

Copiar
cd frontend
yarn install
yarn serve
Acessando o Projeto
Backend: Acesse http://localhost:3000

Frontend: Acesse http://localhost:8080

Estrutura do Projeto
Backend: /my_portfolio

Frontend: /my_portfolio/frontend

Componentes Principais
Backend
User: Gerencia informações do usuário

ProfessionalInfo: Gerencia informações profissionais

PersonalInfo: Gerencia informações pessoais

Post: Gerencia posts do feed

Contact: Gerencia mensagens de contato

Frontend
AppHeader: Cabeçalho do aplicativo

ProfessionalInfo: Informações profissionais

AboutMe: Informações pessoais

UserFeed: Feed de posts

UserContact: Formulário de contato

AdminDashboard: Painel de administração

AdminProfessionalInfo: Gerenciamento de informações profissionais

AdminPersonalInfo: Gerenciamento de informações pessoais

Contribuição
Fork o projeto

Crie uma branch para sua feature (git checkout -b feature/nome-da-feature)

Commit suas mudanças (git commit -m 'Adiciona minha nova feature')

Push para a branch (git push origin feature/nome-da-feature)

Abra um Pull Request

Licença
Este projeto está licenciado sob a licença MIT.
