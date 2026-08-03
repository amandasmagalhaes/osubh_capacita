### PRIMEIRO SCRIPT EM R ####

# Este arquivo apresenta alguns dos principais comandos
# para quem está começando a programar em R.

### Comentários ####

# O símbolo # inicia um comentário.
# Tudo o que vem depois dele na mesma linha é ignorado pelo R.
# Comentários são úteis para explicar o que o código faz.

### Operações básicas ####

# O R também pode ser utilizado como uma calculadora.
# Soma
2 + 3
# Subtração
10 - 4
# Multiplicação
5 * 2
# Divisão
20 / 4
# Potência
2^3

# Também podemos combinar operações usando parênteses.
(10 + 5) * 2


### Objetos e atribuição de valores ####

# O operador <- atribui um valor a um objeto.
# Objetos são utilizados para armazenar informações.
nome <- "Ana"
idade <- 30
cidade <- "Belo Horizonte"
altura <- 1.60

# Para visualizar o conteúdo de um objeto, basta escrever seu nome.
nome
idade
cidade
altura

# Também podemos utilizar objetos em cálculos.
ano_nascimento <- 2026 - idade
ano_nascimento

# A função ls() lista todos os objetos criados na sessão atual.
ls()


### Tipos de dados ####

# Existem diferentes tipos de dados em R.
# numeric: números
numero <- 10.5
# character: textos (sempre entre aspas)
texto <- "OSUBH"
# logical: resultado de uma condição (TRUE ou FALSE)
maior_de_idade <- idade >= 18

# class() informa o tipo (classe) de um objeto.
numero
class(numero)
texto
class(texto)
maior_de_idade
class(maior_de_idade)


### Vetores ####

# Um vetor armazena vários valores do mesmo tipo.
# A função c() (combine) reúne vários valores em um único vetor.
frutas <- c("Banana", "Maçã", "Manga", "Morango", "Uva")
precos <- c(5.99, 8.49, 6.99, 12.90, 9.99)

# Visualizando os vetores.
frutas
precos

# length() informa quantos elementos existem no vetor.
length(frutas)

# Em R, a contagem das posições começa em 1 (e não em 0).
frutas[1]
frutas[2:4]
frutas[c(1, 5)]

# Também podemos realizar operações com todos os elementos do vetor.
precos + 2

# As funções recebem seus argumentos entre parênteses.
# Soma
sum(precos)
# Média
mean(precos)
# Mediana
median(precos)
# Mínimo
min(precos)
# Máximo
max(precos)
# Desvio-padrão
sd(precos)
# Resumo estatístico (mínimo, quartis, mediana, média e máximo)
summary(precos)


### Valores ausentes (NA) ####

# NA representa um valor ausente (missing value).
precos2 <- c(5.99, 8.49, NA, 12.90, 9.99)

# is.na() identifica quais posições possuem valores ausentes.
is.na(precos2)

# na.rm = TRUE faz com que os valores ausentes sejam ignorados no cálculo.
mean(precos2, na.rm = TRUE)


### Data frames (tabelas de dados) ####

# Até agora trabalhamos com vetores.
# Agora vamos reunir diferentes vetores em uma única tabela.

# Um data frame é uma tabela.
# Cada coluna representa uma variável e cada linha representa uma observação.

mercado <- data.frame(
  produto = c(
    "Café",
    "Banana",
    "Maçã",
    "Morango",
    "Uva",
    "Arroz",
    "Feijão",
    "Leite",
    "Macarrão",
    "Óleo"
  ),
  categoria = c(
    "Bebida",
    "Fruta",
    "Fruta",
    "Fruta",
    "Fruta",
    "Grão",
    "Grão",
    "Laticínio",
    "Massa",
    "Óleo"
  ),
  preco = c(
    19.90,
    5.99,
    8.49,
    12.90,
    9.99,
    28.90,
    9.49,
    6.80,
    7.99,
    8.99
  )
)

# Visualizando a tabela.
mercado
View(mercado)

# Algumas funções úteis para conhecer uma base de dados.
# Primeiras linhas da tabela
head(mercado)
# Estrutura da tabela e o tipo de cada variável
str(mercado)
# Nome das colunas
names(mercado)
# Resumo descritivo da tabela
summary(mercado)

# O operador $ permite acessar uma coluna específica da tabela.
mercado$produto
mercado$preco

# Selecionando apenas os produtos com preço maior que R$ 10.
mercado[mercado$preco > 10, ]

# Selecionando apenas os produtos da categoria "Fruta".
mercado[mercado$categoria == "Fruta", ]

# Selecionando apenas a coluna "produto".
mercado[, "produto"]


### Gráfico básico ####

# O R permite criar diferentes tipos de gráficos.

barplot(
  # Valores representados pelas barras
  mercado$preco,
  # Nomes exibidos abaixo de cada barra
  names.arg = mercado$produto,
  # Cor das barras
  col = "lightblue",
  # Título do gráfico
  main = "Preço dos produtos",
  # Título do eixo Y
  ylab = "Preço (R$)"
)

### Boas práticas ####
# - Utilize comentários para explicar o código.
# - Dê nomes claros e descritivos aos objetos.
# - Organize o script em seções.
# - Execute os comandos passo a passo.
# - Observe os resultados no Console.
# - Salve seus scripts para reutilizá-los posteriormente.
# - Consulte a ajuda das funções usando ?nome_da_funcao ou help(nome_da_funcao).
