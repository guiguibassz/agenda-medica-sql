# 🏥 Agenda Médica - Projeto de Banco de Dados

Projeto prático de modelagem de banco de dados em MySQL. O sistema simula o agendamento de consultas médicas em uma clínica, com foco em relacionamentos entre tabelas, procedures e views.

## 📦 Tecnologias usadas

- MySQL
- MySQL Workbench
- DBML (diagrama feito com dbdiagram.io)

## 🗃️ Entidades principais

- **pacientes**: armazena dados dos pacientes (nome, cpf, telefone)
- **medicos**: armazena dados dos médicos (nome, especialidade, CRM)
- **consultas**: vincula pacientes e médicos, com data e observações

## 🔁 Relacionamentos

- Um paciente pode ter várias consultas
- Um médico pode atender vários pacientes
- Cada consulta é de 1 paciente com 1 médico
- Os relacionamentos usam **chaves estrangeiras**

## 🛠️ Funcionalidades implementadas

- Criação das tabelas com constraints
- Relacionamentos 1:N entre entidades
- View `agenda_completa` para facilitar leitura de dados
- Procedure `agendar_consulta` para inserção automatizada

## 📐 Diagrama ER

Diagrama feito com o site [dbdiagram.io](https://dbdiagram.io):

📷 ![Diagrama ER](./assets/diagrama_agenda_medica.png)

## 🚀 Como executar

1. Abra o arquivo `script_banco.sql` no MySQL Workbench
2. Execute o script para criar as tabelas e inserir os dados
3. Teste os relacionamentos com consultas SQL
4. Use a procedure `agendar_consulta` para agendar novas consultas
5. Veja os dados completos usando a view `agenda_completa`

---

> Feito com 💻 por [Guilherme Gabriel Matos de Almeida](https://www.linkedin.com/in/guilherme-almeiida/)

