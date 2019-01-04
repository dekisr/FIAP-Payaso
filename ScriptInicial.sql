/* Usar DROPs caso já tenha as tabelas e sequencias criadas */
DROP TABLE T_PAY_USUARIO CASCADE CONSTRAINTS;
DROP TABLE T_PAY_ENDERECO CASCADE CONSTRAINTS;
DROP TABLE T_PAY_ESCOLA CASCADE CONSTRAINTS;
DROP TABLE T_PAY_MENSAGEM CASCADE CONSTRAINTS;
DROP TABLE T_PAY_MENSAGEM_ESCOLA CASCADE CONSTRAINTS;
DROP TABLE T_PAY_QUESTAO CASCADE CONSTRAINTS;
DROP TABLE T_PAY_QUESTIONARIO CASCADE CONSTRAINTS;
DROP TABLE T_PAY_RESPOSTA CASCADE CONSTRAINTS;

DROP SEQUENCE seq_usu_id;
DROP SEQUENCE seq_esc_id;
DROP SEQUENCE seq_end_id;
DROP SEQUENCE seq_msg_id;
DROP SEQUENCE seq_msg_esc_id;


/* INICIO DO SCRIPT */
CREATE TABLE T_PAY_ENDERECO(
    ID_ENDERECO INTEGER PRIMARY KEY,
    NM_ENDERECO VARCHAR2(50) NOT NULL,
    NR_ENDERECO NUMERIC(6) NOT NULL,
    NM_COMPLEMENTO VARCHAR2(30),
    NR_CEP NUMERIC(8) NOT NULL
);
CREATE TABLE T_PAY_ESCOLA(
    ID_ESCOLA INTEGER PRIMARY KEY,
    NM_ESCOLA VARCHAR2(50) NOT NULL,
    ID_ENDERECO INTEGER,
    DS_IMG VARCHAR2(256),
    DS_BIO VARCHAR2(300),
    NR_PONTO NUMERIC(8,2),
    FOREIGN KEY(ID_ENDERECO) REFERENCES T_PAY_ENDERECO(ID_ENDERECO) 
);
CREATE TABLE T_PAY_USUARIO(
    ID_USUARIO INTEGER PRIMARY KEY,
    NM_USUARIO VARCHAR2(50) NOT NULL,
    DS_SENHA VARCHAR2(20) NOT NULL,
    DS_IMG VARCHAR2(256),
    DS_EMAIL VARCHAR2(100) UNIQUE NOT NULL,
    DS_BIO_USUARIO VARCHAR2(300),
    NR_PONTUACAO NUMERIC(6,2),
    ID_ESCOLA INTEGER,
    FOREIGN KEY(ID_ESCOLA) REFERENCES T_PAY_ESCOLA(ID_ESCOLA)
);
CREATE TABLE T_PAY_RESPOSTA(
    ID_RESPOSTA INTEGER PRIMARY KEY,
    DS_RESPOSTA VARCHAR2(50) NOT NULL
);
CREATE TABLE T_PAY_QUESTAO(
    ID_QUESTAO INTEGER PRIMARY KEY,
    DS_QUESTAO VARCHAR2(150) NOT NULL,
    ID_RESPOSTA INTEGER,
    FOREIGN KEY(ID_RESPOSTA) REFERENCES T_PAY_RESPOSTA(ID_RESPOSTA)
);
CREATE TABLE T_PAY_QUESTIONARIO(
    ID_QUESTIONARIO INTEGER,
    ID_USUARIO INTEGER,
    ID_QUESTAO INTEGER,
    DT_QUESTIONARIO DATE,
    PRIMARY KEY(ID_QUESTIONARIO,ID_USUARIO),
    FOREIGN KEY(ID_USUARIO) REFERENCES T_PAY_USUARIO(ID_USUARIO),
    FOREIGN KEY(ID_QUESTAO) REFERENCES T_PAY_QUESTAO(ID_QUESTAO)
);
CREATE TABLE T_PAY_MENSAGEM(
    ID_MENSAGEM INTEGER PRIMARY KEY,
    ID_USUARIO INTEGER,
    DS_MENSAGEM VARCHAR2(256) NOT NULL,
    ID_DESTINATARIO INTEGER NOT NULL,
    FOREIGN KEY(ID_USUARIO) REFERENCES T_PAY_USUARIO(ID_USUARIO)
);
CREATE TABLE T_PAY_MENSAGEM_ESCOLA(
    ID_MENSAGEM_ESCOLA INTEGER PRIMARY KEY,
    ID_USUARIO INTEGER,
    ID_ESCOLA INTEGER,
    DS_MENSAGEM_ESCOLA VARCHAR2(256) NOT NULL,
    FOREIGN KEY(ID_USUARIO) REFERENCES T_PAY_USUARIO(ID_USUARIO),
    FOREIGN KEY(ID_ESCOLA) REFERENCES T_PAY_ESCOLA(ID_ESCOLA)
);

create sequence seq_end_id
    start with 6
    increment by +1
    nocache;
create sequence seq_esc_id
    start with 6
    increment by +1
    nocache;
create sequence seq_usu_id
    start with 27
    increment by +1
    nocache;
create sequence seq_msg_id
    start with 41
    increment by +1
    nocache;
create sequence seq_msg_esc_id
    start with 36
    increment by +1
    nocache;


/*INSERT ENDERECO*/
INSERT INTO T_PAY_ENDERECO(ID_ENDERECO,NM_ENDERECO,NR_ENDERECO,NM_COMPLEMENTO,NR_CEP)
VALUES(1,'Av. Paulista',2413,'Apt. 6','02201002');
INSERT INTO T_PAY_ENDERECO(ID_ENDERECO,NM_ENDERECO,NR_ENDERECO,NM_COMPLEMENTO,NR_CEP)
VALUES(2,'Av. Jardim Japão',314,'Edifício Paris','02201002');
INSERT INTO T_PAY_ENDERECO(ID_ENDERECO,NM_ENDERECO,NR_ENDERECO,NM_COMPLEMENTO,NR_CEP)
VALUES(3,'Av. Vergueiro',25,'4° Andar','02201002');
INSERT INTO T_PAY_ENDERECO(ID_ENDERECO,NM_ENDERECO,NR_ENDERECO,NM_COMPLEMENTO,NR_CEP)
VALUES(4,'Av. Julio Buono',394,null,'02201002');
INSERT INTO T_PAY_ENDERECO(ID_ENDERECO,NM_ENDERECO,NR_ENDERECO,NM_COMPLEMENTO,NR_CEP)
VALUES(5,'Av. Lins de Vasconcelos',3680,'Bloco A','02201002');

/*INSERT ESCOLA*/
INSERT INTO T_PAY_ESCOLA(ID_ESCOLA,NM_ESCOLA,ID_ENDERECO,DS_IMG,DS_BIO)
VALUES(1,'Centro Educacional Gondo',1,'images/avatars/avatarEsc_Gondo.jpg','Somos os filhos de Gondo! Nada poderá nos deter, nosso pai irá nos Salvar! (while i < infinito) Pai Nosso que estais nos Céu, santificado seja o vosso Nome, venha a nós o vosso Reino, seja feita a vossa vontade assim na terra como no Céu. O pão nosso de cada dia nos dai hoje, perdoai as... i++ Amém');
INSERT INTO T_PAY_ESCOLA(ID_ESCOLA,NM_ESCOLA,ID_ENDERECO,DS_IMG,DS_BIO)
VALUES(2,'Instituto de Tecnologia Allen',2,'images/avatars/avatarEsc_Allen.jpg','Venha aprender no Instituo de Tecnologia Allen');
INSERT INTO T_PAY_ESCOLA(ID_ESCOLA,NM_ESCOLA,ID_ENDERECO,DS_IMG,DS_BIO)
VALUES(3,'Irmandade Beneficente Israel',3,'images/avatars/avatarEsc_Israel.jpg','Onde arte encontra a ciência. A paixão com a razão. Do belo ao funcional. Não deixamos a peteca cair, assumimos a bronca dos que caem. Em nossa irmandade você nunca está sozinho! Como já dizia o grande poeta, "Tipo efeito borboleta, tento voltar pra concertar, mas sempre dá alguma treta" - Emicida');
INSERT INTO T_PAY_ESCOLA(ID_ESCOLA,NM_ESCOLA,ID_ENDERECO,DS_IMG,DS_BIO)
VALUES(4,'Instituição Solidária Purcino',4,'images/avatars/avatarEsc_Purcino.jpg','Somos os alunos do Purcino. O mundo está dado. Geramos dados e somos dados. Com tantos dados... para quê eles servem? O quê fazer com eles? Nós sabemos! "Se você não construir o seu sonho, alguém irá contratá-lo para ajudar a construir o dele" - Tony Gaskins');
INSERT INTO T_PAY_ESCOLA(ID_ESCOLA,NM_ESCOLA,ID_ENDERECO,DS_IMG,DS_BIO)
VALUES(5,'Retiro dos Humbertos e Braufagélios',5,'images/avatars/avatarEsc_Humberto.jpg','Somos apaixonados, loucos e viciados. Temos apenas uma coisa a dizer: Moh Fácil!!!');

/*INSERT ALUNO*/
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(1,'Gondo Feliz','123456','images/avatars/avatarAlu_Gondo01.jpg','gondo01@fiap.com.br',530,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',1);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(2,'Gondo Alegre','123456','images/avatars/avatarAlu_Gondo02.jpg','gondo02@fiap.com.br',450,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',1);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(3,'Gondo Contente','123456','images/avatars/avatarAlu_Gondo03.jpg','gondo03@fiap.com.br',660,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',1);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(4,'Gondo Muito Feliz','123456','images/avatars/avatarAlu_Gondo04.jpg','gondo04@fiap.com.br',700,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',1);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(5,'Gondo Emocionado','123456','images/avatars/avatarAlu_Gondo05.jpg','gondo05@fiap.com.br',230,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',1);

INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(6,'Allen Feliz','123456','images/avatars/avatarAlu_Allen01.jpg','allen01@fiap.com.br',510,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',2);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(7,'Allen Alegre','123456','images/avatars/avatarAlu_Allen02.jpg','allen02@fiap.com.br',610,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',2);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(8,'Allen Contente','123456','images/avatars/avatarAlu_Allen03.jpg','allen03@fiap.com.br',710,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',2);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(9,'Allen Muito Feliz','123456','images/avatars/avatarAlu_Allen04.jpg','allen04@fiap.com.br',810,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',2);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(10,'Allen Emocionado','123456','images/avatars/avatarAlu_Allen05.jpg','allen05@fiap.com.br',910,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',2);

INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(11,'Israel Feliz','123456','images/avatars/avatarAlu_Israel01.jpg','israel01@fiap.com.br',260,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',3);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(12,'Israel Alegre','123456','images/avatars/avatarAlu_Israel02.jpg','israel02@fiap.com.br',790,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',3);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(13,'Israel Contente','123456','images/avatars/avatarAlu_Israel03.jpg','israel03@fiap.com.br',120,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',3);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(14,'Israel Muito Feliz','123456','images/avatars/avatarAlu_Israel04.jpg','israel04@fiap.com.br',450,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',3);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(15,'Israel Emocionado','123456','images/avatars/avatarAlu_Israel05.jpg','israel05@fiap.com.br',660,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',3);

INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(16,'Purcino Feliz','123456','images/avatars/avatarAlu_Purcino01.jpg','purcino01@fiap.com.br',290,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',4);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(17,'Purcino Alegre','123456','images/avatars/avatarAlu_Purcino02.jpg','purcino02@fiap.com.br',190,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',4);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(18,'Purcino Contente','123456','images/avatars/avatarAlu_Purcino03.jpg','purcino03@fiap.com.br',490,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',4);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(19,'Purcino Muito Feliz','123456','images/avatars/avatarAlu_Purcino04.jpg','purcino04@fiap.com.br',440,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',4);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(20,'Purcino Emocionado','123456','images/avatars/avatarAlu_Purcino05.jpg','purcino05@fiap.com.br',770,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',4);

INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(21,'Humberto Feliz','123456','images/avatars/avatarAlu_Humberto01.jpg','humberto01@fiap.com.br',777,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',5);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(22,'Humberto Alegre','123456','images/avatars/avatarAlu_Humberto02.jpg','humberto02@fiap.com.br',123,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',5);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(23,'Humberto Contente','123456','images/avatars/avatarAlu_Humberto03.jpg','humberto03@fiap.com.br',444,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',5);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(24,'Humberto Muito Feliz','123456','images/avatars/avatarAlu_Humberto04.jpg','humberto04@fiap.com.br',555,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',5);
INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(25,'Humberto Emocionado','123456','images/avatars/avatarAlu_Humberto05.jpg','humberto05@fiap.com.br',745,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',5);

INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_IMG,DS_EMAIL,NR_PONTUACAO,DS_BIO_USUARIO,ID_ESCOLA)
VALUES(26,'Rita Admin','123456','images/avatars/avatarAdm_Rita.jpg','rita@fiap.com.br',9999,'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Autem ut odio, maxime rem voluptatem, cupiditate quisquam iusto cumque sint qui id aperiam fugiat facilis saepe ipsam quae esse veritatis sed? Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla, totam nam quia qui atque quoas it.',null);

/*INSERT MENSAGEM USUARIO*/
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(1,1,'Vou fazer mais pontos que você hahaha',6);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(2,6,'Quero só veerr',1);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(3,2,'Gosto muito de estudar aqui',7);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(4,7,'O site é muito intuitivo',2);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(5,3,'Vou ser o melhor daqui',8);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(6,8,'Ninguém me para kkk',3);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(7,4,'Vou levar minha escola ao topo',9);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(8,9,'Aprender algo novo é muito lega',4);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(9,5,'Todo dia aprendo algo novo',10);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(10,10,'Consegui bate meu recorde hoje',5);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(11,11,'To ganhando muito conhecimento',16);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(12,16,'Vamos competiir',11);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(13,12,'Estou entendendo tudo!',17);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(14,17,'Vamos ver quem é o melhor',12);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(15,13,'Gostei muito daqui',18);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(16,18,'Este site é muito bonito :D',13);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(17,14,'Que lugar sensacional aqui!!!',19);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(18,19,'Eu tenho muitos pontos',14);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(19,15,'Minha escola é a melhor do mundo',20);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(20,20,'Quero desenvolver quando crescer',15);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(21,21,'Bem vinndoo!!',1);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(22,1,'Hoje eu aprendi muitas coisas aqui, estou muito feliz',21);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(23,22,'Quem é o melhor?',2);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(24,2,'Quanto tempoo',22);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(25,23,'Vou ser o vencedor',3);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(26,3,'Tenho muitos pontos aqui',23);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(27,24,'Hoje é meu dia',4);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(28,4,'Hoje eu ganhoo',24);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(29,25,'Quero ver fazer mais do que eu',5);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(30,5,'Vamos ver quem faz mais pontos',25);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(31,6,'Hoje é dia de estudar',11);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(32,11,'Como vc tá?',6);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(33,7,'Estou amando programar',12);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(34,12,'Vamos ganhaar',7);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(35,8,'Estou aprendendo muito',13);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(36,13,'Aqui é sensacional',8);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(37,9,'Estou gostando muito do site',14);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(38,14,'Minha escola ta na frente',9);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(39,10,'Vou bater meu recorde',15);
INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,DS_MENSAGEM,ID_DESTINATARIO)
VALUES(40,15,'Quanto tempo!!',10);

/*INSERT MENSAGEM USUARIO PARA ESCOLA*/
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(1,1,1,'Oiii galeraa');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(2,2,1,'Vamoos ganhar');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(3,3,1,'Ae galera todo mundo estudando');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(4,4,1,'Vamoos pontuarr');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(5,5,1,'Vamos ganhar da escola da esquina');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(6,3,1,'Estouu estudando muito');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(7,1,1,'Eu tambeeem');
/*INSERT MENSAGEM USUARIO PARA ESCOLA*/
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(8,6,2,'Booa noite');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(9,7,2,'Estamos na frente');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(10,8,2,'Mas não vamos pararr');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(11,9,2,'Isso temos que continuar pontuando');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(12,10,2,'Vamos ser os melhores');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(13,7,2,'Estou focado nisso');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(14,9,2,'Todoos nós');
/*INSERT MENSAGEM USUARIO PARA ESCOLA*/
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(15,11,3,'Salvee gente');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(16,12,3,'Todos prontoss');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(17,13,3,'Vamoss estudar logo');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(18,14,3,'E pontuar muito também');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(19,15,3,'Vamos ganhar de todo mundo');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(20,13,3,'Estouu estudando a muito tempo');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(21,14,3,'WOW');
/*INSERT MENSAGEM USUARIO PARA ESCOLA*/
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(22,16,4,'Bomm diaa');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(23,17,4,'Vamoos estuudar');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(24,18,4,'Colocar uma música e voou');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(25,19,4,'Jáa to indo');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(26,20,4,'A escola da rua de cima ta ganhandoo');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(27,19,4,'Vou estuudar');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(28,16,4,'Eu tambeeem');
/*INSERT MENSAGEM USUARIO PARA ESCOLA*/
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(29,21,5,'Oiii pessoal');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(30,22,5,'Vamoos láa');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(31,23,5,'Quero ver todo mundo focado');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(32,24,5,'Vamoos vencerrr');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(33,25,5,'Jaja começo a estudar');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(34,23,5,'Vamoos logo');
INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA)
VALUES(35,21,5,'Focoo');

/*Insert Respostas*/
INSERT INTO T_PAY_RESPOSTA(ID_RESPOSTA,DS_RESPOSTA)
VALUES(1,'True ou False');
INSERT INTO T_PAY_RESPOSTA(ID_RESPOSTA,DS_RESPOSTA)
VALUES(2,'String');
INSERT INTO T_PAY_RESPOSTA(ID_RESPOSTA,DS_RESPOSTA)
VALUES(3,'Int');
INSERT INTO T_PAY_RESPOSTA(ID_RESPOSTA,DS_RESPOSTA)
VALUES(4,'Char');
INSERT INTO T_PAY_RESPOSTA(ID_RESPOSTA,DS_RESPOSTA)
VALUES(5,'Date');
INSERT INTO T_PAY_RESPOSTA(ID_RESPOSTA,DS_RESPOSTA)
VALUES(6,'If');
INSERT INTO T_PAY_RESPOSTA(ID_RESPOSTA,DS_RESPOSTA)
VALUES(7,'While');
INSERT INTO T_PAY_RESPOSTA(ID_RESPOSTA,DS_RESPOSTA)
VALUES(8,'For');
INSERT INTO T_PAY_RESPOSTA(ID_RESPOSTA,DS_RESPOSTA)
VALUES(9,'Foreach');
INSERT INTO T_PAY_RESPOSTA(ID_RESPOSTA,DS_RESPOSTA)
VALUES(10,'Do/While');

/*Insert Questoes*/
INSERT INTO T_PAY_QUESTAO(ID_QUESTAO,DS_QUESTAO,ID_RESPOSTA)
VALUES(1,'O tipo de variável boolean retorna que tipo de valor?',1);
INSERT INTO T_PAY_QUESTAO(ID_QUESTAO,DS_QUESTAO,ID_RESPOSTA)
VALUES(2,'Qual desses é um comando de condição?',6);

/*Insert Questionarios*/
INSERT INTO T_PAY_QUESTIONARIO(ID_QUESTIONARIO,ID_USUARIO,ID_QUESTAO,DT_QUESTIONARIO)
VALUES(1,1,1,'28/09/2018');
INSERT INTO T_PAY_QUESTIONARIO(ID_QUESTIONARIO,ID_USUARIO,ID_QUESTAO,DT_QUESTIONARIO)
VALUES(1,2,1,'30/09/2018');
INSERT INTO T_PAY_QUESTIONARIO(ID_QUESTIONARIO,ID_USUARIO,ID_QUESTAO,DT_QUESTIONARIO)
VALUES(1,3,1,'29/09/2018');
INSERT INTO T_PAY_QUESTIONARIO(ID_QUESTIONARIO,ID_USUARIO,ID_QUESTAO,DT_QUESTIONARIO)
VALUES(2,7,2,'27/09/2018');
INSERT INTO T_PAY_QUESTIONARIO(ID_QUESTIONARIO,ID_USUARIO,ID_QUESTAO,DT_QUESTIONARIO)
VALUES(2,8,2,'28/09/2018');
INSERT INTO T_PAY_QUESTIONARIO(ID_QUESTIONARIO,ID_USUARIO,ID_QUESTAO,DT_QUESTIONARIO)
VALUES(2,9,2,'27/09/2018');


/* FIM DO SCRIPT */
commit;