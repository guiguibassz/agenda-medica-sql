create table pacientes (
id int auto_increment primary key,
nome varchar(100) not null,
cpf varchar(14) unique not null,
telefone varchar(20)
);

create table medicos (
id int auto_increment primary key,
nome varchar(100) not null,
especialidade varchar(50) not null,
crm varchar(20) unique not null
);

create table consultas (
id  int auto_increment primary key,
id_paciente int not null,
id_medico int not null,
data_consulta datetime not null,
observacoes text,
foreign key (id_paciente) references pacientes(id),
foreign key (id_medico) references medicos(id),
constraint consulta_unica unique (id_medico, data_consulta)
);

insert into pacientes (nome, cpf, telefone) values
('Carlos Souza', '123.456.789-00', '(11) 98765-4321'),
('Ana Lima', '987.654.321-00', '(11) 97654-1234');

insert into medicos (nome, especialidade, crm) values
('Dra. Fernanda Alves', 'Cardiologia', 'CRM123456'),
('Dr. João Mendes', 'Dermatologia', 'CRM654321');

insert into consultas(id_paciente, id_medico, data_consulta, observacoes) values
(1, 1, '2025-06-21 10:00:00', 'Primeira consulta, paciente com pressão alta.'),
(2,2, '2025-06-22 15:30:00', 'Paciente relatou alergias na pele.');

create view agenda_completa AS 
select 
c.id as id_consulta,
p.nome as paciente,
m.nome as medico,
m.especialidade,
c.data_consulta,
c.observacoes
from consultas c 
join pacientes p on c.id_paciente = p.id
join medicos m on c.id_medico = m.id;

select* from agenda_completa;

DELIMITER //

create procedure agendar_consulta(
in pid_paciente int,
in pid_medico int,
in pdata datetime,
in pobservacoes text
)
begin
	insert into consultas (id_paciente, id_medico, data_consulta, observacoes)
    values (pid_paciente, pi_medico, pdata, pobservacoes);
end//

DELIMITER ;


call agendar_consulta(1,1, '2025-07-01 09:00:00', 'Consulta de retorno');


