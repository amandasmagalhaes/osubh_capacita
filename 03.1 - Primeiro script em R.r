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
idade <- 20
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
alunos_nomes <- c(
  "Ana",
  "Bruno",
  "Carla",
  "Diego",
  "Elisa",
  "Felipe",
  "Gabriela",
  "Hugo",
  "Isabela",
  "João"
)
idades <- c(20, 22, 19, 25, 21, 23, 20, 24, 18, 22)
notas <- c(8.5, 6.0, 9.2, 7.5, 8.0, 5.5, 7.0, 9.5, 6.8, 8.7)

# Visualizando os vetores.
alunos_nomes
idades
notas

# length() informa quantos elementos existem no vetor.
length(alunos_nomes)

# Em R, a contagem das posições começa em 1 (e não em 0).
alunos_nomes[1]
alunos_nomes[2:4]
alunos_nomes[c(1, 5)]

# Também podemos realizar operações com todos os elementos do vetor.
notas + 1

# As funções recebem seus argumentos entre parênteses.
# Soma
sum(notas)
# Média
mean(notas)
# Mediana
median(notas)
# Mínimo
min(notas)
# Máximo
max(notas)
# Desvio-padrão
sd(notas)
# Resumo estatístico (mínimo, quartis, mediana, média e máximo)
summary(notas)


### Valores ausentes (NA) ####

# NA representa um valor ausente (missing value).
notas_com_na <- c(8.5, 6.0, NA, 7.5, 8.0)

# is.na() identifica quais posições possuem valores ausentes.
is.na(notas_com_na)

# na.rm = TRUE faz com que os valores ausentes sejam ignorados no cálculo.
mean(notas_com_na, na.rm = TRUE)


### Funções ####

# Funções executam tarefas e podem receber valores como argumentos.
# O R possui funções prontas, como mean(), e também permite criar funções.

# Esta função classifica a situação de um aluno a partir da sua nota.
verificar_situacao <- function(nota) {
  if (nota >= 7) {
    "Aprovado"
  } else {
    "Reprovado"
  }
}

# Para usar a função, fornecemos uma nota como argumento.
verificar_situacao(8.5)
verificar_situacao(6.0)


### Data frames (tabelas de dados) ####

# Até agora trabalhamos com vetores.
# Agora vamos reunir diferentes vetores em uma única tabela.

# Um data frame é uma tabela.
# Cada coluna representa uma variável e cada linha representa uma observação.

alunos <- data.frame(
  nome = alunos_nomes,
  idade = idades,
  nota = notas
)

# Visualizando a tabela.
alunos
View(alunos)

# Algumas funções úteis para conhecer uma base de dados.
# Primeiras linhas da tabela
head(alunos)
# Estrutura da tabela e o tipo de cada variável
str(alunos)
# Nome das colunas
names(alunos)
# Resumo descritivo da tabela
summary(alunos)

# O operador $ permite acessar uma coluna específica da tabela.
alunos$nome
alunos$nota

# Selecionando apenas os alunos com nota maior ou igual a 7.
alunos[alunos$nota >= 7, ]

# Selecionando apenas os alunos com idade menor que 21 anos.
alunos[alunos$idade < 21, ]

# Selecionando apenas a coluna "nome".
alunos[, "nome"]


### Gráfico básico ####

# O R permite criar diferentes tipos de gráficos.

barplot(
  # Valores representados pelas barras
  alunos$nota,
  # Nomes exibidos abaixo de cada barra
  names.arg = alunos$nome,
  # Cor das barras
  col = "lightblue",
  # Título do gráfico
  main = "Notas dos alunos",
  # Título do eixo Y
  ylab = "Nota"
)
