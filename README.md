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

### 2. Breve descrição das Entidades e Atributos (MER) que construímos para o trabalho:

#### Area_cultivada: 
Descreve a area cultivada, tipo de solo e localização por coordenadas do GPS. Se relaciona diretamente com outras tabelas como Plantio, Adubação, Irrigação e Sensores (Npk, Umidade e PH).

#### Plantio:
Descreve o plantio que foi realizado na área cultivada, características de rotação da cultura (tipo e número), data (timestamp) de plantio e colheitas (última e futura). Se relaciona diretamente com área cultivada e cultura.

#### Adubação:
Descreve a aplicação da adubação sobre a área cultivada, quantidades de nutrientes aplicados e datas (timestamp). Se relaciona diretamente com área cultivada.

#### Irrigacao
Descreve a aplicação da adubação sobre a área cultivada, data da irrigação (timestamp), area irrigada em m2, volumes de irrigação e método. Se relaciona diretamente com área cultivada e irrigadores.

#### Irrigadores
Descreve os comportamento dos aparelhos de irrigação, data de disparo (timestamp), status de operação, volume de agua esperados, tipo do irrigador e localização no gps. Se relaciona diretamente com irrigação.

#### Cultura
Descreve as culturas cultivadas, com nomes, especies, variedades e requisitos de agua e nutrientes da adubação. Se relaciona diretamente com plantio.

#### Sensor_NPK
Descreve as medições dos sensores de NPK: com métricas específicas para Fosforo, Nitrogenio, PH e datas (timestamp) de medição. Se relaciona diretamente com área cultivada.

#### Sensor_Umidade
Descreve as medições dos sensores de Umidade: com a métrica específica de VWC (Conteúdo Volumetrico de agua em percentual) e datas (timestamp) de medição. Se relaciona diretamente com área cultivada.

#### Sensor_PH
Descreve as medições dos sensores de PH: com métrica específica de PH e datas (timestamp) de medição. Se relaciona diretamente com área cultivada.


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

| Nome                          | RM         |
|-------------------------------|------------|
| Jonas T V Fernandes           | RM563027   |
| Ranna Leslie                  | RM562685   |
| Raphael da Silva              | RM561452   |
| Raphael Dinelli Neto          | RM562892   |
| Levi Passos Silveira Marques  | RM565557   |

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

