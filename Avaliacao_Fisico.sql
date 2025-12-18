/* Avaliacao_Lógica: */

CREATE TABLE Usuario (
    fk_Endereco_Endereco_PK string(30),
    Telefone number(11),
    Nome CHAR(12),
    Email string(25),
    Data_Nascimento number(8),
    ID_Usuario number(8) PRIMARY KEY
);

CREATE TABLE Musica (
    Data_Lancamento number(8),
    Nome CHAR(12),
    ID_Musica number(8) PRIMARY KEY,
    fk_Playlist_ID_Playlist number(8),
    fk_Artista_ID_Artista number(8),
    fk_Album_ID_Album number(8)
);

CREATE TABLE Playlist (
    ID_Playlist number(8) PRIMARY KEY,
    Nome CHAR(12),
    Data_Criacao number(8),
    Participantes number(20),
    fk_Usuario_ID_Usuario number(8),
    fk_Conteudo_ID_Conteudo number(8)
);

CREATE TABLE Artista (
    ID_Artista number(8) PRIMARY KEY,
    Nome CHAR(12)
);

CREATE TABLE Album (
    ID_Album number(8) PRIMARY KEY,
    Nome CHAR(12),
    fk_Artista_ID_Artista number(8)
);

CREATE TABLE Genero (
    ID_Genero number(8) PRIMARY KEY,
    Nome CHAR(12)
);

CREATE TABLE Plano_Assinatura (
    Valor number(4),
    Anuncio CHAR(3),
    Qualidade_Audio CHAR(3),
    ID_Plano_Assinatura number(8) PRIMARY KEY,
    Skips CHAR(3),
    fk_Usuario_ID_Usuario number(8)
);

CREATE TABLE Basico (
    fk_Plano_Assinatura_ID_Plano_Assinatura number(8) PRIMARY KEY
);

CREATE TABLE Premium (
    fk_Plano_Assinatura_ID_Plano_Assinatura number(8) PRIMARY KEY
);

CREATE TABLE Conteudo (
    ID_Conteudo number(8) PRIMARY KEY,
    Tipo CHAR(12),
    Duracao number(5),
    Idioma CHAR(15),
    fk_Artista_ID_Artista number(8)
);

CREATE TABLE Endereco (
    Endereco_PK string(30) NOT NULL PRIMARY KEY,
    Cep CHAR(8),
    Rua string(25),
    Numero number(5),
    Cidade CHAR(25)
);

CREATE TABLE Tem (
    fk_Musica_ID_Musica number(8),
    fk_Genero_ID_Genero number(8)
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_Endereco_Endereco_PK)
    REFERENCES Endereco (Endereco_PK)
    ON DELETE SET NULL;
 
ALTER TABLE Musica ADD CONSTRAINT FK_Musica_2
    FOREIGN KEY (fk_Playlist_ID_Playlist)
    REFERENCES Playlist (ID_Playlist)
    ON DELETE RESTRICT;
 
ALTER TABLE Musica ADD CONSTRAINT FK_Musica_3
    FOREIGN KEY (fk_Artista_ID_Artista)
    REFERENCES Artista (ID_Artista)
    ON DELETE RESTRICT;
 
ALTER TABLE Musica ADD CONSTRAINT FK_Musica_4
    FOREIGN KEY (fk_Album_ID_Album)
    REFERENCES Album (ID_Album)
    ON DELETE RESTRICT;
 
ALTER TABLE Playlist ADD CONSTRAINT FK_Playlist_2
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE Playlist ADD CONSTRAINT FK_Playlist_3
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE Album ADD CONSTRAINT FK_Album_2
    FOREIGN KEY (fk_Artista_ID_Artista)
    REFERENCES Artista (ID_Artista)
    ON DELETE RESTRICT;
 
ALTER TABLE Plano_Assinatura ADD CONSTRAINT FK_Plano_Assinatura_2
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE Basico ADD CONSTRAINT FK_Basico_2
    FOREIGN KEY (fk_Plano_Assinatura_ID_Plano_Assinatura)
    REFERENCES Plano_Assinatura (ID_Plano_Assinatura)
    ON DELETE CASCADE;
 
ALTER TABLE Premium ADD CONSTRAINT FK_Premium_2
    FOREIGN KEY (fk_Plano_Assinatura_ID_Plano_Assinatura)
    REFERENCES Plano_Assinatura (ID_Plano_Assinatura)
    ON DELETE CASCADE;
 
ALTER TABLE Conteudo ADD CONSTRAINT FK_Conteudo_2
    FOREIGN KEY (fk_Artista_ID_Artista)
    REFERENCES Artista (ID_Artista)
    ON DELETE RESTRICT;
 
ALTER TABLE Tem ADD CONSTRAINT FK_Tem_1
    FOREIGN KEY (fk_Musica_ID_Musica)
    REFERENCES Musica (ID_Musica)
    ON DELETE RESTRICT;
 
ALTER TABLE Tem ADD CONSTRAINT FK_Tem_2
    FOREIGN KEY (fk_Genero_ID_Genero)
    REFERENCES Genero (ID_Genero)
    ON DELETE RESTRICT;