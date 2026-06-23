from peewee import *
from werkzeug.security import generate_password_hash, check_password_hash

# Cria o arquivo do banco de dados na raiz do projeto
db = SqliteDatabase('petway.db')

class BaseModel(Model):
    class Meta:
        database = db

class Usuario(BaseModel):
    nome = CharField()
    email = CharField(unique=True) # apenas um email por usuário
    senha_hash = CharField()
    role = CharField() # 'walker' ou 'owner'

    def checar_senha(self, senha_digitada):
        return check_password_hash(self.senha_hash, senha_digitada)

# Conecta e garante que as tabelas sejam criadas se não existirem
db.connect()
db.create_tables([Usuario], safe=True)