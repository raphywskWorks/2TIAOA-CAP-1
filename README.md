# 🌱 FarmTech Solutions – Modelagem de Banco de Dados

## 📘 Introdução

Este projeto faz parte da atividade acadêmica da disciplina de Banco de Dados da FIAP, onde atuamos como membros da equipe de desenvolvedores da startup fictícia **FarmTech Solutions**. A proposta envolve a modelagem de um banco de dados relacional com base em sensores utilizados na agricultura digital.

## 🎯 Objetivo

Desenvolver um **Modelo Entidade-Relacionamento (MER)** e um **Diagrama Entidade-Relacionamento (DER)** que representem um sistema capaz de armazenar e processar dados de sensores utilizados em plantações, otimizando o uso de recursos como água e nutrientes.

## 🧠 Contexto do Problema

O produtor rural utiliza três tipos de sensores:

- **S1**: Sensor de Umidade
- **S2**: Sensor de pH
- **S3**: Sensor de Nutrientes (Fósforo e Potássio - NPK)

Esses sensores coletam dados em tempo real, enviando-os para um sistema central que:
- Processa os dados,
- Sugere ajustes na irrigação e aplicação de nutrientes,
- Utiliza dados históricos para prever necessidades futuras.

---

## 📝 Requisitos da Modelagem

### 1. Informações Relevantes
Abaixo, listamos algumas informações que o sistema deve permitir consultar:

- Quantidade total de água aplicada por mês
  - Dados: `data_hora`, `quantidade_agua`
- Variação do pH ao longo do ano
  - Dados: `data_hora`, `valor_ph`
- Níveis de fósforo e potássio ao longo do tempo
  - Dados: `data_hora`, `valor_fosforo`, `valor_potassio`

---

### 2. Entidades e Atributos (MER)

#### 🌾 Cultivo
- `id_cultivo` (PK)
- `nome_cultura` (varchar)
- `localizacao` (varchar)

#### 🌡️ Sensor
- `id_sensor` (PK)
- `tipo_sensor` (varchar) — ex: Umidade, pH, Nutriente
- `descricao` (varchar)

#### 📊 Leitura
- `id_leitura` (PK)
- `id_sensor` (FK)
- `id_cultivo` (FK)
- `data_hora` (datetime)
- `valor_umidade` (double)
- `valor_ph` (double)
- `valor_fosforo` (double)
- `valor_potassio` (double)

#### 💧 Irrigacao
- `id_irrigacao` (PK)
- `id_cultivo` (FK)
- `data_hora` (datetime)
- `quantidade_agua` (double)

---

### 3. Cardinalidades

- Um **Cultivo** pode estar relacionado a **muitas Leituras** (1:N)
- Um **Sensor** pode gerar **muitas Leituras** (1:N)
- Um **Cultivo** pode ter **muitas Irrigações** (1:N)

---

### 4. Relacionamentos

- `Cultivo (1) --- (N) Leitura`
- `Sensor (1) --- (N) Leitura`
- `Cultivo (1) --- (N) Irrigacao`

---

### 5. Tipos de Dados

| Atributo             | Tipo de Dado |
|----------------------|--------------|
| id_cultivo           | int (PK)     |
| nome_cultura         | varchar(100) |
| localizacao          | varchar(100) |
| id_sensor            | int (PK)     |
| tipo_sensor          | varchar(50)  |
| descricao            | varchar(255) |
| id_leitura           | int (PK)     |
| data_hora            | datetime     |
| valor_umidade        | double       |
| valor_ph             | double       |
| valor_fosforo        | double       |
| valor_potassio       | double       |
| id_irrigacao         | int (PK)     |
| quantidade_agua      | double       |

---

## 🧩 Entregáveis

O repositório GitHub deve conter:

- [x] Arquivo `README.md` com a documentação do MER
- [x] Arquivo `.xml` do projeto do **SQL Developer Data Modeler**
- [x] Arquivo `.sql` com os comandos de criação do banco
- [x] Imagem `.png` com o DER gerado
- [ ] Documento PDF para entrega no portal da FIAP contendo:
  - Nome completo e RM do responsável
  - Fase e capítulo
  - Link do repositório GitHub

---

## 👨‍💻 Grupo

| Nome                  | RM         |
|-----------------------|------------|
| João da Silva         | RM123456   |
| Maria Oliveira        | RM234567   |
| Pedro Santos          | RM345678   |
| Ana Costa             | RM456789   |
| Lucas Almeida         | RM567890   |

---

## 📌 Observações

- O repositório **não deverá ser alterado após a data de entrega** no portal da FIAP.
- Alterações após o prazo podem impactar negativamente a nota do grupo.
- O uso de IA é permitido, mas as respostas devem ser revisadas criticamente para evitar plágio.

---

## 🛠️ Ferramentas Utilizadas

- Oracle SQL Developer Data Modeler: https://www.oracle.com/br/database/sqldeveloper/technologies/sql-data-modeler/download/
- GitHub para versionamento e entrega
- Markdown para documentação

---

