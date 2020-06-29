CREATE DATABASE bd_faculdade
GO
USE bd_faculdade

CREATE TABLE aluno(
ra   INT NOT NULL,
nome VARCHAR(150) NOT NULL
PRIMARY KEY(ra))

INSERT aluno values
--AOC (T e N)
(10001, 'AOC T 1'),(10002, 'AOC T 2'),(10003, 'AOC T 3'),
(10101, 'AOC N 1'),(10102, 'AOC N 2'),(10103, 'AOC N 3'),
--LH
(20001, 'LH 1'),(20002, 'LH 2'),(20003, 'LH 3'),(20004, 'LH 4'),
--BD
(30001, 'BD 1'),(30002, 'BD 2'),(30003, 'BD 3'),
--SOI (T e N)
(40001, 'SOI T 1'),(40002, 'SOI T 2'),
(40101, 'SOI N 1'),(40102, 'SOI N 2'),(40103, 'SOI N 3'),
--LBD
(50001, 'LBD 1'),(50002, 'LBD 2'),(50003, 'LBD 3'),
--MPC
(60001, 'MPC 1'),(60002, 'MPC 2')

CREATE TABLE disciplina(
codigo    INT NOT NULL,
nome      VARCHAR(120) NOT NULL,
sigla     CHAR(3) NOT NULL,
turno     CHAR(1),
num_aulas INT
PRIMARY KEY(codigo))

INSERT INTO disciplina VALUES
(4203010,'Arquitetura e Organização de Computadores','AOC','T',4),
(4203020,'Arquitetura e Organização de Computadores','AOC','N',4),
(4208010,'Laboratório de Hardware','LH','T',2),
(4226004,'Banco de Dados','BD','T',4),
(4213003,'Sistemas Operacionais I','SOI','T',4),
(4213013,'Sistemas Operacionais I','SOI','N',4),
(4233005,'Laboratório de Banco de Dados','LBD','T',4),
(5005220,'Produção do Conhecimento','MPC','',0)

CREATE TABLE faltas(
ra_aluno                     INT,
codigo_disciplina            INT,
data                         DATE NOT NULL,
presenca                     VARCHAR(4)
PRIMARY KEY(ra_aluno,codigo_disciplina,data)
FOREIGN KEY(ra_aluno) REFERENCES aluno(ra),
FOREIGN KEY(codigo_disciplina) REFERENCES disciplina(codigo))

INSERT INTO faltas VALUES
--AOC(T)
(10001,4203010,'01/02/2020',''),(10001,4203010,'02/02/2020',''),(10001,4203010,'03/02/2020',''),(10001,4203010,'04/02/2020',''),(10001,4203010,'05/02/2020',''),
(10001,4203010,'06/02/2020',''),(10001,4203010,'07/02/2020',''),(10001,4203010,'08/02/2020',''),(10001,4203010,'09/02/2020',''),(10001,4203010,'10/02/2020',''),
(10001,4203010,'11/02/2020',''),(10001,4203010,'12/02/2020',''),(10001,4203010,'13/02/2020',''),(10001,4203010,'14/02/2020',''),(10001,4203010,'15/02/2020',''),
(10001,4203010,'16/02/2020',''),(10001,4203010,'17/02/2020',''),(10001,4203010,'18/02/2020',''),(10001,4203010,'19/02/2020',''),(10001,4203010,'20/02/2020',''),
(10002,4203010,'01/02/2020',''),(10002,4203010,'02/02/2020',''),(10002,4203010,'03/02/2020',''),(10002,4203010,'04/02/2020',''),(10002,4203010,'05/02/2020',''),
(10002,4203010,'06/02/2020',''),(10002,4203010,'07/02/2020',''),(10002,4203010,'08/02/2020',''),(10002,4203010,'09/02/2020',''),(10002,4203010,'10/02/2020',''),
(10002,4203010,'11/02/2020',''),(10002,4203010,'12/02/2020',''),(10002,4203010,'13/02/2020',''),(10002,4203010,'14/02/2020',''),(10002,4203010,'15/02/2020',''),
(10002,4203010,'16/02/2020',''),(10002,4203010,'17/02/2020',''),(10002,4203010,'18/02/2020',''),(10002,4203010,'19/02/2020',''),(10002,4203010,'20/02/2020',''),
(10003,4203010,'01/02/2020',''),(10003,4203010,'02/02/2020',''),(10003,4203010,'03/02/2020',''),(10003,4203010,'04/02/2020',''),(10003,4203010,'05/02/2020',''),
(10003,4203010,'06/02/2020',''),(10003,4203010,'07/02/2020',''),(10003,4203010,'08/02/2020',''),(10003,4203010,'09/02/2020',''),(10003,4203010,'10/02/2020',''),
(10003,4203010,'11/02/2020',''),(10003,4203010,'12/02/2020',''),(10003,4203010,'13/02/2020',''),(10003,4203010,'14/02/2020',''),(10003,4203010,'15/02/2020',''),
(10003,4203010,'16/02/2020',''),(10003,4203010,'17/02/2020',''),(10003,4203010,'18/02/2020',''),(10003,4203010,'19/02/2020',''),(10003,4203010,'20/02/2020',''),
--AOC(N)
(10101,4203020,'01/02/2020',''),(10101,4203020,'02/02/2020',''),(10101,4203020,'03/02/2020',''),(10101,4203020,'04/02/2020',''),(10101,4203020,'05/02/2020',''),
(10101,4203020,'06/02/2020',''),(10101,4203020,'07/02/2020',''),(10101,4203020,'08/02/2020',''),(10101,4203020,'09/02/2020',''),(10101,4203020,'10/02/2020',''),
(10101,4203020,'11/02/2020',''),(10101,4203020,'12/02/2020',''),(10101,4203020,'13/02/2020',''),(10101,4203020,'14/02/2020',''),(10101,4203020,'15/02/2020',''),
(10101,4203020,'16/02/2020',''),(10101,4203020,'17/02/2020',''),(10101,4203020,'18/02/2020',''),(10101,4203020,'19/02/2020',''),(10101,4203020,'20/02/2020',''),
(10102,4203020,'01/02/2020',''),(10102,4203020,'02/02/2020',''),(10102,4203020,'03/02/2020',''),(10102,4203020,'04/02/2020',''),(10102,4203020,'05/02/2020',''),
(10102,4203020,'06/02/2020',''),(10102,4203020,'07/02/2020',''),(10102,4203020,'08/02/2020',''),(10102,4203020,'09/02/2020',''),(10102,4203020,'10/02/2020',''),
(10102,4203020,'11/02/2020',''),(10102,4203020,'12/02/2020',''),(10102,4203020,'13/02/2020',''),(10102,4203020,'14/02/2020',''),(10102,4203020,'15/02/2020',''),
(10102,4203020,'16/02/2020',''),(10102,4203020,'17/02/2020',''),(10102,4203020,'18/02/2020',''),(10102,4203020,'19/02/2020',''),(10102,4203020,'20/02/2020',''),
(10103,4203020,'01/02/2020',''),(10103,4203020,'02/02/2020',''),(10103,4203020,'03/02/2020',''),(10103,4203020,'04/02/2020',''),(10103,4203020,'05/02/2020',''),
(10103,4203020,'06/02/2020',''),(10103,4203020,'07/02/2020',''),(10103,4203020,'08/02/2020',''),(10103,4203020,'09/02/2020',''),(10103,4203020,'10/02/2020',''),
(10103,4203020,'11/02/2020',''),(10103,4203020,'12/02/2020',''),(10103,4203020,'13/02/2020',''),(10103,4203020,'14/02/2020',''),(10103,4203020,'15/02/2020',''),
(10103,4203020,'16/02/2020',''),(10103,4203020,'17/02/2020',''),(10103,4203020,'18/02/2020',''),(10103,4203020,'19/02/2020',''),(10103,4203020,'20/02/2020',''),
--LH
(20001,4208010,'01/03/2020',''),(20001,4208010,'02/03/2020',''),(20001,4208010,'03/03/2020',''),(20001,4208010,'04/03/2020',''),(20001,4208010,'05/03/2020',''),
(20002,4208010,'01/03/2020',''),(20002,4208010,'02/03/2020',''),(20002,4208010,'03/03/2020',''),(20002,4208010,'04/03/2020',''),(20002,4208010,'05/03/2020',''),
(20003,4208010,'01/03/2020',''),(20003,4208010,'02/03/2020',''),(20003,4208010,'03/03/2020',''),(20003,4208010,'04/03/2020',''),(20003,4208010,'05/03/2020',''),
(20004,4208010,'01/03/2020',''),(20004,4208010,'02/03/2020',''),(20004,4208010,'03/03/2020',''),(20004,4208010,'04/03/2020',''),(20004,4208010,'05/03/2020',''),
--BD
(30001,4226004,'01/03/2020',''),(30001,4226004,'02/03/2020',''),(30001,4226004,'03/03/2020',''),(30001,4226004,'04/03/2020',''),(30001,4226004,'05/03/2020',''),
(30002,4226004,'01/03/2020',''),(30002,4226004,'02/03/2020',''),(30002,4226004,'03/03/2020',''),(30002,4226004,'04/03/2020',''),(30002,4226004,'05/03/2020',''),
(30003,4226004,'01/03/2020',''),(30003,4226004,'02/03/2020',''),(30003,4226004,'03/03/2020',''),(30003,4226004,'04/03/2020',''),(30003,4226004,'05/03/2020',''),
--SOI (T)
(40001,4213003,'01/05/2020',''),(40001,4213003,'02/05/2020',''),(40001,4213003,'03/05/2020',''),(40001,4213003,'04/05/2020',''),(40001,4213003,'05/05/2020',''),
(40002,4213003,'01/05/2020',''),(40002,4213003,'02/05/2020',''),(40002,4213003,'03/05/2020',''),(40002,4213003,'04/05/2020',''),(40002,4213003,'05/05/2020',''),
--SOI (N)
(40101,4213013,'01/05/2020',''),(40101,4213013,'02/05/2020',''),(40101,4213013,'03/05/2020',''),(40101,4213013,'04/05/2020',''),(40101,4213013,'05/05/2020',''),
(40102,4213013,'01/05/2020',''),(40102,4213013,'02/05/2020',''),(40102,4213013,'03/05/2020',''),(40102,4213013,'04/05/2020',''),(40102,4213013,'05/05/2020',''),
(40103,4213013,'01/05/2020',''),(40103,4213013,'02/05/2020',''),(40103,4213013,'03/05/2020',''),(40103,4213013,'04/05/2020',''),(40103,4213013,'05/05/2020',''),
--LBD
(50001,4233005,'01/07/2020',''),(50001,4233005,'02/07/2020',''),(50001,4233005,'03/07/2020',''),(50001,4233005,'04/07/2020',''),(50001,4233005,'05/07/2020',''),
(50002,4233005,'01/07/2020',''),(50002,4233005,'02/07/2020',''),(50002,4233005,'03/07/2020',''),(50002,4233005,'04/07/2020',''),(50002,4233005,'05/07/2020',''),
(50003,4233005,'01/07/2020',''),(50003,4233005,'02/07/2020',''),(50003,4233005,'03/07/2020',''),(50003,4233005,'04/07/2020',''),(50003,4233005,'05/07/2020',''),
--MPC
(60001,5005220,'01/08/2020',''),(60001,5005220,'02/08/2020',''),(60001,5005220,'03/08/2020',''),(60001,5005220,'04/08/2020',''),(60001,5005220,'05/08/2020',''),
(60002,5005220,'01/08/2020',''),(60002,5005220,'02/08/2020',''),(60002,5005220,'03/08/2020',''),(60002,5005220,'04/08/2020',''),(60002,5005220,'05/08/2020','')


CREATE TABLE avaliacao(
codigo INT NOT NULL,
tipo   VARCHAR(2) NOT NULL
PRIMARY KEY(codigo))

INSERT avaliacao values
(1,'P1'),(2,'P2'),(3,'P3'),
(4,'P4'),(5,'PE'),(6,'T'),
(7,'MC'),(8,'MR'),(9,'MS')

CREATE TABLE notas(
ra_aluno          INT,
codigo_disciplina INT,
codigo_avaliacao  INT,
nota              DECIMAL(4,2)
PRIMARY KEY(ra_aluno, codigo_disciplina,codigo_avaliacao)
FOREIGN KEY(ra_aluno) REFERENCES aluno(ra),
FOREIGN KEY(codigo_disciplina) REFERENCES disciplina(codigo),
FOREIGN KEY(codigo_avaliacao) REFERENCES avaliacao(codigo))

INSERT INTO notas values
--AOC (P1,P2,T,P3)
(10001,4203010,1,0.0),(10001,4203010,2,0.0),(10001,4203010,6,0.0),(10001,4203010,3,0.0),
(10002,4203010,1,0.0),(10002,4203010,2,0.0),(10002,4203010,6,0.0),(10002,4203010,3,0.0),
(10003,4203010,1,0.0),(10003,4203010,2,0.0),(10003,4203010,6,0.0),(10003,4203010,3,0.0),
(10101,4203020,1,0.0),(10101,4203020,2,0.0),(10101,4203020,6,0.0),(10101,4203020,3,0.0),
(10102,4203020,1,0.0),(10102,4203020,2,0.0),(10102,4203020,6,0.0),(10102,4203020,3,0.0),
(10103,4203020,1,0.0),(10103,4203020,2,0.0),(10103,4203020,6,0.0),(10103,4203020,3,0.0),
--LH (P1,P2,T,P3)
(20001,4208010,1,0.0),(20001,4208010,2,0.0),(20001,4208010,6,0.0),(20001,4208010,3,0.0),
(20002,4208010,1,0.0),(20002,4208010,2,0.0),(20002,4208010,6,0.0),(20002,4208010,3,0.0),
(20003,4208010,1,0.0),(20003,4208010,2,0.0),(20003,4208010,6,0.0),(20003,4208010,3,0.0),
(20004,4208010,1,0.0),(20004,4208010,2,0.0),(20004,4208010,6,0.0),(20004,4208010,3,0.0),
--BD (P1,P2,T,P3)
(30001,4226004,1,0.0),(30001,4226004,2,0.0),(30001,4226004,6,0.0),(30001,4226004,3,0.0),
(30002,4226004,1,0.0),(30002,4226004,2,0.0),(30002,4226004,6,0.0),(30002,4226004,3,0.0),
(30003,4226004,1,0.0),(30003,4226004,2,0.0),(30003,4226004,6,0.0),(30003,4226004,3,0.0),
--SOI (P1,P2,T,PE,P3)
(40001,4213003,1,0.0),(40001,4213003,2,0.0),(40001,4213003,6,0.0),(40001,4213003,5,0.0),(40001,4213003,3,0.0),
(40002,4213003,1,0.0),(40002,4213003,2,0.0),(40002,4213003,6,0.0),(40002,4213003,5,0.0),(40002,4213003,3,0.0),
(40101,4213013,1,0.0),(40101,4213013,2,0.0),(40101,4213013,6,0.0),(40101,4213013,5,0.0),(40101,4213013,3,0.0),
(40102,4213013,1,0.0),(40102,4213013,2,0.0),(40102,4213013,6,0.0),(40102,4213013,5,0.0),(40102,4213013,3,0.0),
(40103,4213013,1,0.0),(40103,4213013,2,0.0),(40103,4213013,6,0.0),(40103,4213013,5,0.0),(40103,4213013,3,0.0),
--LBD (P1,P2,P3,P4)
(50001,4233005,1,0.0),(50001,4233005,2,0.0),(50001,4233005,3,0.0),(50001,4233005,4,0.0),
(50002,4233005,1,0.0),(50002,4233005,2,0.0),(50002,4233005,3,0.0),(50002,4233005,4,0.0),
(50003,4233005,1,0.0),(50003,4233005,2,0.0),(50003,4233005,3,0.0),(50003,4233005,4,0.0),
--MPC (MC,MR,MS)
(60001,5005220,7,0.0),(60001,5005220,8,0.0),(60001,5005220,9,0.0),
(60002,5005220,7,0.0),(60002,5005220,8,0.0),(60002,5005220,9,0.0)

--A) Fazer o sistema, com Stored Procedure para inserção de notas; 
CREATE PROCEDURE sp_inserirnota(@ra INT, @codigo_disciplina INT, @codigo_avaliacao INT, @nota DECIMAL(4,2))
AS
BEGIN	
	IF(@nota BETWEEN 0.0 AND 10.0) BEGIN
		UPDATE notas SET nota = @nota WHERE ra_aluno = @ra AND codigo_disciplina = @codigo_disciplina
		AND codigo_avaliacao = @codigo_avaliacao
	END
	ELSE 
	BEGIN
		RAISERROR('Nota inválida!',16,1)
	END
END	

select * from notas Where codigo_avaliacao= 1 and codigo_disciplina =4203010

--B) Fazer o sistema com Stored Procedure para inserção de faltas; 
CREATE PROCEDURE sp_inserirfaltas(@ra INT, @codigo_disciplina INT, @data DATE, @presenca VARCHAR(4))
AS
BEGIN
	UPDATE faltas SET presenca = @presenca
	WHERE ra_aluno = @ra AND codigo_disciplina = @codigo_disciplina AND data = @data
END

Select * from faltas

--C) Apresentar em tela, a saída de uma UDF, com cursor, que apresenta um quadro com as notas 
--da turma: (RA_Aluno, Nome_Aluno, Nota1, Nota2, ..., Média_Final, Situação(Aprovado ou Reprovado))
--AOC,LH,BD
CREATE FUNCTION fn_notasAocLhBd(@codigo_disciplina INT)
RETURNS @tabela TABLE(
RA_Aluno      INT,
Nome_Aluno    VARCHAR(150),
P1            DECIMAL(4,2),
P2            DECIMAL(4,2),
T             DECIMAL(4,2),
P3            DECIMAL(4,2),
Media_Final   DECIMAL(4,2),
Situacao      VARCHAR(9),
Disciplina	  VARCHAR(120)
)
AS
BEGIN
	DECLARE @ra_aluno    INT,
			@nome_aluno  VARCHAR(150),
			@P1          DECIMAL(4,2),
			@P2          DECIMAL(4,2),
			@T           DECIMAL(4,2),
			@P3          DECIMAL(4,2),
			@media_final DECIMAL(4,2),
			@situacao    VARCHAR(9),
			@disciplina  VARCHAR(120)

	SET @disciplina = (Select nome from disciplina WHERE codigo = @codigo_disciplina)
	--CRIAR O CURSOR
    DECLARE cursor_buscanotas        CURSOR FOR
        SELECT notas.ra_aluno, aluno.nome 
		FROM notas INNER JOIN aluno
		ON notas.ra_aluno = aluno.ra
		WHERE codigo_disciplina = @codigo_disciplina
		GROUP BY notas.ra_aluno,aluno.nome

    --ABRIR O CURSOR
    OPEN cursor_buscanotas

    --POSICIONAR NO PRIMEIRO REGISTRO
    FETCH NEXT FROM cursor_buscanotas INTO @ra_aluno,@nome_aluno
	
    --VERIFICAR SE HOUVE REGISTRO
	WHILE @@FETCH_STATUS = 0
    BEGIN
	
		SET @P1 = (SELECT nota FROM notas WHERE ra_aluno= @ra_aluno AND
		codigo_disciplina = @codigo_disciplina AND 
		codigo_avaliacao = (SELECT codigo FROM avaliacao WHERE tipo ='P1')) 
	
		SET @P2 = (SELECT nota FROM notas WHERE ra_aluno= @ra_aluno AND
		codigo_disciplina = @codigo_disciplina AND 
		codigo_avaliacao = (SELECT codigo FROM avaliacao WHERE tipo ='P2'))

		SET @T = (SELECT nota FROM notas WHERE ra_aluno= @ra_aluno AND
		codigo_disciplina = @codigo_disciplina AND 
		codigo_avaliacao = (SELECT codigo FROM avaliacao WHERE tipo ='T'))

		SET @P3 =(SELECT nota FROM notas WHERE ra_aluno= @ra_aluno AND
		codigo_disciplina = @codigo_disciplina AND 
		codigo_avaliacao = (SELECT codigo FROM avaliacao WHERE tipo ='P3'))

		--Calculo da Média
		SET @media_final = (@P1*0.3) + (@P2*0.5) + (@T*0.2)
		
		IF (@media_final >= 3.0 AND @media_final < 6.0) BEGIN
			SET @media_final= (@media_final*0.5) + (@P3*0.5)
		END
		--Situação
		IF (@media_final> 6.0) BEGIN
			SET @situacao = 'Aprovado'
		END
		ELSE
		BEGIN
			SET @situacao = 'Reprovado'
		END
		
		INSERT INTO @tabela VALUES
			(@ra_aluno, @nome_aluno, @P1,@P2,@T,@P3,@media_final ,@situacao, @disciplina)
		
		--INCREMENTO(POSICIONAR NO PRÓXIMO REGISTRO)
        FETCH NEXT FROM cursor_buscanotas INTO @ra_aluno,@nome_aluno
	END

	CLOSE cursor_buscanotas
    DEALLOCATE cursor_buscanotas
 
    RETURN
END

---SOI
CREATE FUNCTION fn_notasSOI(@codigo_disciplina INT)
RETURNS @tabela TABLE(
RA_Aluno      INT,
Nome_Aluno    VARCHAR(150),
P1            DECIMAL(4,2),
P2            DECIMAL(4,2),
T             DECIMAL(4,2),
PE            DECIMAL(4,2),
P3            DECIMAL(4,2),
Media_Final   DECIMAL(4,2),
Situacao      VARCHAR(9)
)
AS
BEGIN
	DECLARE @ra_aluno    INT,
			@nome_aluno  VARCHAR(150),
			@P1          DECIMAL(4,2),
			@P2          DECIMAL(4,2),
			@T           DECIMAL(4,2),
			@PE          DECIMAL(4,2),
			@P3          DECIMAL(4,2),
			@media_final DECIMAL(4,2),
			@situacao    VARCHAR(9)

	 --CRIAR O CURSOR
    DECLARE cursor_buscanotas        CURSOR FOR
        SELECT notas.ra_aluno, aluno.nome 
		FROM notas INNER JOIN aluno
		ON notas.ra_aluno = aluno.ra
		WHERE codigo_disciplina = @codigo_disciplina
		GROUP BY notas.ra_aluno,aluno.nome

    --ABRIR O CURSOR
    OPEN cursor_buscanotas

    --POSICIONAR NO PRIMEIRO REGISTRO
    FETCH NEXT FROM cursor_buscanotas INTO @ra_aluno,@nome_aluno
	
    --VERIFICAR SE HOUVE REGISTRO
	WHILE @@FETCH_STATUS = 0
    BEGIN
	
		SET @P1 = (SELECT nota FROM notas WHERE ra_aluno= @ra_aluno AND
		codigo_disciplina = @codigo_disciplina AND 
		codigo_avaliacao = (SELECT codigo FROM avaliacao WHERE tipo ='P1')) 
	
		SET @P2 = (SELECT nota FROM notas WHERE ra_aluno= @ra_aluno AND
		codigo_disciplina = @codigo_disciplina AND 
		codigo_avaliacao = (SELECT codigo FROM avaliacao WHERE tipo ='P2'))

		SET @T = (SELECT nota FROM notas WHERE ra_aluno= @ra_aluno AND
		codigo_disciplina = @codigo_disciplina AND 
		codigo_avaliacao = (SELECT codigo FROM avaliacao WHERE tipo ='T'))

		SET @PE = (SELECT nota FROM notas WHERE ra_aluno= @ra_aluno AND
		codigo_disciplina = @codigo_disciplina AND 
		codigo_avaliacao = (SELECT codigo FROM avaliacao WHERE tipo ='PE'))

		SET @P3 =(SELECT nota FROM notas WHERE ra_aluno= @ra_aluno AND
		codigo_disciplina = @codigo_disciplina AND 
		codigo_avaliacao = (SELECT codigo FROM avaliacao WHERE tipo ='P3'))

		--Calculo da Média
		SET @media_final = (@P1*0.35) + (@P2*0.35) + (@T*0.3)
		
		IF(@media_final >= 3.0 AND @media_final < 6.0) BEGIN
			SET @media_final += @PE*0.2
		END
		ELSE
		BEGIN
			SET @media_final = @media_final*0.5 + @P3*0.5
		END

		--Situação
		IF (@media_final> 6.0) BEGIN
			SET @situacao = 'Aprovado'
		END
		ELSE
		BEGIN
			SET @situacao = 'Reprovado'
		END
		
		INSERT INTO @tabela VALUES
			(@ra_aluno, @nome_aluno, @P1,@P2,@T,@PE,@P3,@media_final ,@situacao)
		
		--INCREMENTO(POSICIONAR NO PRÓXIMO REGISTRO)
        FETCH NEXT FROM cursor_buscanotas INTO @ra_aluno,@nome_aluno
	END

	CLOSE cursor_buscanotas
    DEALLOCATE cursor_buscanotas
 
    RETURN
END

---LBD
CREATE FUNCTION fn_notasLBD(@codigo_disciplina INT)
RETURNS @tabela TABLE(
RA_Aluno      INT,
Nome_Aluno    VARCHAR(150),
P1            DECIMAL(4,2),
P2            DECIMAL(4,2),
P3            DECIMAL(4,2),
P4            DECIMAL(4,2),
Media_Final   DECIMAL(4,2),
Situacao      VARCHAR(9)
)
AS
BEGIN
	DECLARE @ra_aluno    INT,
			@nome_aluno  VARCHAR(150),
			@P1          DECIMAL(4,2),
			@P2          DECIMAL(4,2),
			@P3          DECIMAL(4,2),
			@P4          DECIMAL(4,2),
			@media_final DECIMAL(4,2),
			@situacao    VARCHAR(9)

	 --CRIAR O CURSOR
    DECLARE cursor_buscanotas        CURSOR FOR
        SELECT notas.ra_aluno, aluno.nome 
		FROM notas INNER JOIN aluno
		ON notas.ra_aluno = aluno.ra
		WHERE codigo_disciplina = @codigo_disciplina
		GROUP BY notas.ra_aluno,aluno.nome

    --ABRIR O CURSOR
    OPEN cursor_buscanotas

    --POSICIONAR NO PRIMEIRO REGISTRO
    FETCH NEXT FROM cursor_buscanotas INTO @ra_aluno,@nome_aluno
	
    --VERIFICAR SE HOUVE REGISTRO
	WHILE @@FETCH_STATUS = 0
    BEGIN
	
		SET @P1 = (SELECT nota FROM notas WHERE ra_aluno= @ra_aluno AND
		codigo_disciplina = @codigo_disciplina AND 
		codigo_avaliacao = (SELECT codigo FROM avaliacao WHERE tipo ='P1')) 
	
		SET @P2 = (SELECT nota FROM notas WHERE ra_aluno= @ra_aluno AND
		codigo_disciplina = @codigo_disciplina AND 
		codigo_avaliacao = (SELECT codigo FROM avaliacao WHERE tipo ='P2'))

		SET @P3 = (SELECT nota FROM notas WHERE ra_aluno= @ra_aluno AND
		codigo_disciplina = @codigo_disciplina AND 
		codigo_avaliacao = (SELECT codigo FROM avaliacao WHERE tipo ='P3'))

		SET @P4 =(SELECT nota FROM notas WHERE ra_aluno= @ra_aluno AND
		codigo_disciplina = @codigo_disciplina AND 
		codigo_avaliacao = (SELECT codigo FROM avaliacao WHERE tipo ='P4'))

		--Calculo da Média
		SET @media_final = (@P1*0.33) + (@P2*0.33) + (@P3*0.33)
		
		IF(@media_final >= 3.0 AND @media_final < 6.0) BEGIN
			SET @media_final= (@media_final*0.5) + (@P4*0.5)
		END

		--Situação
		IF (@media_final> 6.0) BEGIN
			SET @situacao = 'Aprovado'
		END
		ELSE
		BEGIN
			SET @situacao = 'Reprovado'
		END
		
		INSERT INTO @tabela VALUES
			(@ra_aluno, @nome_aluno, @P1,@P2,@P3,@P4,@media_final ,@situacao)
		
		--INCREMENTO(POSICIONAR NO PRÓXIMO REGISTRO)
        FETCH NEXT FROM cursor_buscanotas INTO @ra_aluno,@nome_aluno
	END

	CLOSE cursor_buscanotas
    DEALLOCATE cursor_buscanotas
 
    RETURN
END

---MPC
CREATE FUNCTION fn_notasM(@codigo_disciplina INT)
RETURNS @tabela TABLE(
RA_Aluno      INT,
Nome_Aluno    VARCHAR(150),
MC            DECIMAL(4,2),
MR            DECIMAL(4,2),
MS            DECIMAL(4,2),
Media_Final   DECIMAL(4,2),
Situacao      VARCHAR(9)
)
AS
BEGIN
	DECLARE @ra_aluno    INT,
			@nome_aluno  VARCHAR(150),
			@MC          DECIMAL(4,2),
			@MR          DECIMAL(4,2),
			@MS          DECIMAL(4,2),
			@media_final DECIMAL(4,2),
			@situacao    VARCHAR(9)

	 --CRIAR O CURSOR
    DECLARE cursor_buscanotas        CURSOR FOR
        SELECT notas.ra_aluno, aluno.nome 
		FROM notas INNER JOIN aluno
		ON notas.ra_aluno = aluno.ra
		WHERE codigo_disciplina = @codigo_disciplina
		GROUP BY notas.ra_aluno,aluno.nome

    --ABRIR O CURSOR
    OPEN cursor_buscanotas

    --POSICIONAR NO PRIMEIRO REGISTRO
    FETCH NEXT FROM cursor_buscanotas INTO @ra_aluno,@nome_aluno
	
    --VERIFICAR SE HOUVE REGISTRO
	WHILE @@FETCH_STATUS = 0
    BEGIN
	
		SET @MC = (SELECT nota FROM notas WHERE ra_aluno= @ra_aluno AND
		codigo_disciplina = @codigo_disciplina AND 
		codigo_avaliacao = (SELECT codigo FROM avaliacao WHERE tipo ='MC')) 
	
		SET @MR = (SELECT nota FROM notas WHERE ra_aluno= @ra_aluno AND
		codigo_disciplina = @codigo_disciplina AND 
		codigo_avaliacao = (SELECT codigo FROM avaliacao WHERE tipo ='MR'))

		SET @MS = (SELECT nota FROM notas WHERE ra_aluno= @ra_aluno AND
		codigo_disciplina = @codigo_disciplina AND 
		codigo_avaliacao = (SELECT codigo FROM avaliacao WHERE tipo ='MS'))

		--Calculo da Média
		SET @media_final = (@MC*0.8) + (@MR*0.2)
		
		IF(@media_final >= 3.0 AND @media_final < 6.0) BEGIN
			SET @media_final= (@MS*0.8) + (@MR*0.2)
		END

		--Situação
		IF (@media_final> 6.0) BEGIN
			SET @situacao = 'Aprovado'
		END
		ELSE
		BEGIN
			SET @situacao = 'Reprovado'
		END
		
		INSERT INTO @tabela VALUES
			(@ra_aluno, @nome_aluno, @MC,@MR,@MS,@media_final ,@situacao)
		
		--INCREMENTO(POSICIONAR NO PRÓXIMO REGISTRO)
        FETCH NEXT FROM cursor_buscanotas INTO @ra_aluno,@nome_aluno
	END

	CLOSE cursor_buscanotas
    DEALLOCATE cursor_buscanotas
 
    RETURN
END
SELECT * FROM fn_notasM(5005220)

--D) Apresentar, em tela, a saída de uma UDF, com cursor, que apresenta um quadro com as faltas 
--da turma, sendo que, para cada data deverá haver um F por falta e um P por presença: 
--(RA_Aluno, Nome_Aluno, Data1, Data2, ..., Total_Faltas)
CREATE FUNCTION fn_faltasDisciplina(@codigo_disciplina INT)
RETURNS @tabela TABLE(
RA_Aluno      INT,
Nome_Aluno    VARCHAR(150),
Data_1        VARCHAR(4),
Data_2        VARCHAR(4),
Data_3        VARCHAR(4),
Data_4        VARCHAR(4),
Data_5        VARCHAR(4),
Data_6        VARCHAR(4),
Data_7        VARCHAR(4),
Data_8        VARCHAR(4),
Data_9        VARCHAR(4),
Data_10       VARCHAR(4),
Data_11       VARCHAR(4),
Data_12       VARCHAR(4),
Data_13       VARCHAR(4),
Data_14       VARCHAR(4),
Data_15       VARCHAR(4),
Data_16       VARCHAR(4),
Data_17       VARCHAR(4),
Data_18       VARCHAR(4),
Data_19       VARCHAR(4),
Data_20       VARCHAR(4),
Total_Faltas  INT,
Disciplina    VARCHAR(120)
)
AS
BEGIN
	DECLARE @ra_aluno     INT,
			@nome_aluno   VARCHAR(150),
			@D1           VARCHAR(4),
			@D2           VARCHAR(4),
			@D3           VARCHAR(4),
			@D4           VARCHAR(4),
			@D5           VARCHAR(4),
			@D6           VARCHAR(4),
			@D7           VARCHAR(4),
			@D8           VARCHAR(4),
			@D9           VARCHAR(4),
			@D10          VARCHAR(4),
			@D11          VARCHAR(4),
			@D12          VARCHAR(4),
			@D13          VARCHAR(4),
			@D14          VARCHAR(4),
			@D15          VARCHAR(4),
			@D16          VARCHAR(4),
			@D17          VARCHAR(4),
			@D18          VARCHAR(4),
			@D19          VARCHAR(4),
			@D20          VARCHAR(4),
			@total_faltas INT,
			@disciplina   VARCHAR(120),
			@cont		  INT,
			@presenca	  VARCHAR(4),
			@total		  VARCHAR(100),
			@boolean      INT,
			@c1			  INT,
			@c2           INT

	SET @disciplina = (Select nome from disciplina WHERE codigo = @codigo_disciplina)
	SET @total = ''
	 --CRIAR O CURSOR
    DECLARE cursor_buscaaluno        CURSOR FOR
        SELECT faltas.ra_aluno, aluno.nome 
		FROM faltas INNER JOIN aluno
		ON faltas.ra_aluno = aluno.ra
		WHERE codigo_disciplina = @codigo_disciplina
		GROUP BY faltas.ra_aluno,aluno.nome

    --ABRIR O CURSOR
    OPEN cursor_buscaaluno

    --POSICIONAR NO PRIMEIRO REGISTRO
    FETCH NEXT FROM cursor_buscaaluno INTO @ra_aluno,@nome_aluno
	SET @c1 = @@FETCH_STATUS
    --VERIFICAR SE HOUVE REGISTRO
	WHILE @c1 = 0
    BEGIN
		
		DECLARE cursor_buscafaltas CURSOR FOR 
			SELECT presenca from faltas 
			WHERE ra_aluno = @ra_aluno  AND codigo_disciplina = @codigo_disciplina
		
		OPEN cursor_buscafaltas
		
		FETCH NEXT FROM cursor_buscafaltas INTO @presenca

		
		SET @cont = 1
		SET @c2 = @@FETCH_STATUS
		WHILE ( @cont<21 AND @c2 = 0)
		BEGIN
			IF(@presenca IS NULL ) BEGIN
				SET  @presenca = '' 
			END
			IF(@cont = 1)BEGIN
				SET @D1 = @presenca
			END

			IF(@cont = 2)BEGIN
				SET @D2 = @presenca
			END
			IF(@cont = 3)BEGIN
				SET @D3 = @presenca
			END
			IF(@cont = 4)BEGIN
				SET @D4 = @presenca
			END
			IF(@cont = 5)BEGIN
				SET @D5 = @presenca
			END
			IF(@cont = 6)BEGIN
				SET @D6 = @presenca
			END
			IF(@cont = 7)BEGIN
				SET @D7 = @presenca
			END
			IF(@cont = 8)BEGIN
				SET @D8 = @presenca
			END
			IF(@cont = 9)BEGIN
				SET @D9 = @presenca
			END
			IF(@cont = 10)BEGIN
				SET @D10 = @presenca
			END
			IF(@cont = 11)BEGIN
				SET @D11 = @presenca
			END
			IF(@cont = 12)BEGIN
				SET @D12 = @presenca
			END
			IF(@cont = 13)BEGIN
				SET @D13 = @presenca
			END
			IF(@cont = 14)BEGIN
				SET @D14 = @presenca
			END
			IF(@cont = 15)BEGIN
				SET @D15 = @presenca
			END
			IF(@cont = 16)BEGIN
				SET @D16 = @presenca
			END
			IF(@cont = 17)BEGIN
				SET @D17 = @presenca
			END
			IF(@cont = 18)BEGIN
				SET @D18 = @presenca
			END
			IF(@cont = 19)BEGIN
				SET @D19 = @presenca
			END
			IF(@cont = 20)BEGIN
				SET @D20 = @presenca
			END
			SET @total += @presenca
			SET @cont += 1
			FETCH NEXT FROM cursor_buscafaltas INTO @presenca
			SET @c2 = @@FETCH_STATUS
		END

		CLOSE cursor_buscafaltas
		DEALLOCATE cursor_buscafaltas

		SET @cont = 1
		SET @total_faltas = 0;
		WHILE(@cont <= LEN(@total))
		BEGIN 
			IF (SUBSTRING(@total,@cont,1) = 'F')
			BEGIN
				SET @total_faltas += 1
			END

			SET @cont += 1
		END
		
		INSERT INTO @tabela VALUES
			(@ra_aluno, @nome_aluno, @D1,@D2,@D3,@D4,@D5,@D6,@D7,@D8,@D9,@D10,
			@D11,@D12,@D13,@D14,@D15,@D16,@D17,@D18,@D19,@D20,@total_faltas,@disciplina)
		SET @total = ''
		--INCREMENTO(POSICIONAR NO PRÓXIMO REGISTRO)
        FETCH NEXT FROM cursor_buscaaluno INTO @ra_aluno,@nome_aluno
		SET @c1 = @@FETCH_STATUS
	END

	CLOSE cursor_buscaaluno
    DEALLOCATE cursor_buscaaluno

    RETURN
END
SELECT * FROM fn_faltasDisciplina(4203010)
SELECT * FROM fn_faltasDisciplina(5005220)

--G)  Fazer um gatilho que identifique se uma disciplina estiver sendo atualizada ou excluída, 
--lance um erro e não permita que a operação ocorra
CREATE TRIGGER t_disciplina ON disciplina
FOR UPDATE,DELETE
AS
BEGIN
	ROLLBACK TRANSACTION 
	RAISERROR('Não é permitido apagar ou alterar dados da disciplina',16,1)
END

