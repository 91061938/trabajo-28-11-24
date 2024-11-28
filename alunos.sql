CREATE TABLE alunos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL
);

CREATE TABLE disciplinas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE notas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    disciplina_id INT,
    nota DECIMAL(5, 2),
    FOREIGN KEY (aluno_id) REFERENCES alunos(id),
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id)
);

class Aluno:
    def __init__(self, id, nome, idade):
        self.id = id
        self.nome = nome
        self.idade = idade
    
    def __str__(self):
        return f"Aluno(ID: {self.id}, Nome: {self.nome}, Idade: {self.idade})"

    def get_notas(self, conexao):
        # Método para obter as notas associadas ao aluno
        cursor = conexao.cursor()
        cursor.execute("SELECT d.nome, n.nota FROM disciplinas d JOIN notas n ON d.id = n.disciplina_id WHERE n.aluno_id = %s", (self.id,))
        notas = cursor.fetchall()
        return notas

        class Disciplina:
    def __init__(self, id, nome):
        self.id = id
        self.nome = nome

    def __str__(self):
        return f"Disciplina(ID: {self.id}, Nome: {self.nome})"

        class Nota:
    def __init__(self, aluno, disciplina, nota):
        self.aluno = aluno
        self.disciplina = disciplina
        self.nota = nota

    def __str__(self):
        return f"Nota(Aluno: {self.aluno.nome}, Disciplina: {self.disciplina.nome}, Nota: {self.nota})"


        def cadastrar_aluno(conexao, nome, idade):
    cursor = conexao.cursor()
    cursor.execute("INSERT INTO alunos (nome, idade) VALUES (%s, %s)", (nome, idade))
    conexao.commit()

    def cadastrar_disciplina(conexao, nome):
    cursor = conexao.cursor()
    cursor.execute("INSERT INTO disciplinas (nome) VALUES (%s)", (nome,))
    conexao.commit()

    def registrar_nota(conexao, aluno_id, disciplina_id, nota):
    cursor = conexao.cursor()
    cursor.execute("INSERT INTO notas (aluno_id, disciplina_id, nota) VALUES (%s, %s, %s)", (aluno_id, disciplina_id, nota))
    conexao.commit()

    def consultar_notas_por_aluno(conexao, aluno_id):
    cursor = conexao.cursor()
    cursor.execute("SELECT d.nome, n.nota FROM disciplinas d JOIN notas n ON d.id = n.disciplina_id WHERE n.aluno_id = %s", (aluno_id,))
    return cursor.fetchall()

    def calcular_media(conexao, aluno_id):
    cursor = conexao.cursor()
    cursor.execute("SELECT AVG(n.nota) FROM notas n WHERE n.aluno_id = %s", (aluno_id,))
    media = cursor.fetchone()[0]
    return media

#victor trabalho 28 11 2024