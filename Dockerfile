FROM ruby:3.1.0

# Instalar dependências do sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Configurar diretório de trabalho
WORKDIR /my_portfolio

# Copiar arquivos de dependências
COPY Gemfile /my_portfolio/Gemfile
COPY Gemfile.lock /my_portfolio/Gemfile.lock

# Instalar Bundler e as dependências do projeto
RUN gem install bundler:2.5.21
RUN bundle install

# Copiar o restante do código do aplicativo
COPY . /my_portfolio

# Atrasar a criação e migração do banco de dados para o comando de inicialização
CMD ["sh", "-c", "bundle exec rails db:create db:migrate && bundle exec puma -C config/puma.rb"]

