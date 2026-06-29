from peewee import *
from werkzeug.security import generate_password_hash, check_password_hash
db = SqliteDatabase('petway.db')

class BaseModel(Model):
    class Meta:
        database = db

class Usuario(BaseModel):
    nome = CharField()
    email = CharField(unique=True) 
    senha_hash = CharField()
    role = CharField() #'walker' ou 'owner'

    def checar_senha(self, senha_digitada):
        return check_password_hash(self.senha_hash, senha_digitada)
class Pet(BaseModel):
    nome = CharField()
    raca = CharField()
    sexo = CharField()
    #um pet está ligado a um dono (Usuario)
    dono = ForeignKeyField(Usuario, backref='pets', on_delete='CASCADE')

db.connect()
db.create_tables([Usuario, Pet], safe=True)