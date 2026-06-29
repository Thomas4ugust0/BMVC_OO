from app.controllers.application import Application
from peewee import IntegrityError
from bottle import Bottle, redirect, response, run, request, static_file
import os
from app.models.user_account import Usuario, Pet
from werkzeug.security import generate_password_hash

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
STATIC_ROOT = os.path.join(BASE_DIR, 'app', 'static')
ASSETS_ROOT = os.path.join(STATIC_ROOT, 'assets')
CSS_ROOT = os.path.join(STATIC_ROOT, 'css')
JS_ROOT = os.path.join(STATIC_ROOT, 'js')
IMG_ROOT = os.path.join(STATIC_ROOT, 'img')

app = Bottle()
ctl = Application()

#-----------------------------------------------------------------------------
# Rotas Estáticas

@app.route('/static/<filepath:path>')
def serve_static(filepath):
    return static_file(filepath, root=STATIC_ROOT)

@app.route('/css/<filepath:path>')
def serve_css(filepath):
    return static_file(filepath, root=CSS_ROOT)

@app.route('/js/<filepath:path>')
def serve_js(filepath):
    return static_file(filepath, root=JS_ROOT)

@app.route('/images/<filepath:path>')
def serve_images(filepath):
    return static_file(filepath, root=IMG_ROOT)

@app.route('/assets/<filepath:path>')
def serve_assets(filepath):
    return static_file(filepath, root=ASSETS_ROOT)

#-----------------------------------------------------------------------------
# Rotas de Interface (Views)

@app.route('/')
@app.route('/index')
def index():
    return ctl.render('index')

@app.route('/portal', method='GET')
def portal():
    return ctl.render('portal')

@app.route('/passeador')
def action_passeador(parametro=None):
    if not parametro:
        return ctl.render('passeador')
    else:
        return ctl.render('passeador', parametro)

@app.route('/cliente')
def action_cliente():
    return ctl.render('cliente')

#-----------------------------------------------------------------------------
# Rotas de Autenticação e Banco de Dados

@app.route('/cadastro', method='POST')
def fazer_cadastro():
    nome = request.forms.get('nome')
    email = request.forms.get('email')
    senha_digitada = request.forms.get('senha')
    role = request.forms.get('role')
    try:
        senha_criptografada = generate_password_hash(senha_digitada)
        Usuario.create(
            nome=nome, 
            email=email, 
            senha_hash=senha_criptografada, 
            role=role
        )
        
    except IntegrityError:
        #e-mail duplicado no db
        return "Erro: Esse e-mail já está cadastrado no sistema."
        
    except Exception as erro:
        return f"Erro fatal desconhecido: {erro}"
    return redirect('/index')


@app.route('/login', method='POST')
def fazer_login():
    #formulário id="login-form" no HTML
    email = request.forms.get('email')
    senha = request.forms.get('senha')
    usuario = Usuario.get_or_none(Usuario.email == email)
    if usuario and usuario.checar_senha(senha):
        response.set_cookie('session_id', str(usuario.id), httponly=True, secure=True, max_age=3600)
        
        #roteamento do role
        if usuario.role == 'owner':
            return redirect(f'/cliente')
        elif usuario.role == 'walker':
            return redirect(f'/passeador/{usuario.nome}')
    else:
        return "E-mail ou senha incorretos. Tente novamente."


@app.route('/logout', method=['GET', 'POST'])
def logout():
    response.delete_cookie('session_id')
    return redirect('/index')

#-----------------------------------------------------------------------------
# CRUD - nível 2(BMVC)

#Rotas CREATE

@app.route('/adicionar_pet', method='POST')
def adicionar_pet():
    session_id = request.get_cookie('session_id')
    if not session_id:
        return redirect('/index')
        
    usuario_logado = Usuario.get_or_none(Usuario.id == session_id)
    
    nome = request.forms.get('nome')
    raca = request.forms.get('raca')
    sexo = request.forms.get('sexo')
    Pet.create(nome=nome, raca=raca, sexo=sexo, dono=usuario_logado)
    
    return redirect('/cliente#cadastrar-pet')

#Rotas DELETE

@app.route('/excluir_pet/<id_pet:int>', method='POST')
def excluir_pet(id_pet):
    session_id = request.get_cookie('session_id')
    if not session_id:
        return redirect('/index')
        
    usuario_logado = Usuario.get_or_none(Usuario.id == session_id)
    deleta_pet = Pet.get_or_none(Pet.id == id_pet)
    
    if deleta_pet and deleta_pet.dono == usuario_logado:
        deleta_pet.delete_instance() 

    return redirect('/cliente#cadastrar-pet')
#-----------------------------------------------------------------------------

if __name__ == '__main__':
    run(app, host='0.0.0.0', port=8080, debug=True)