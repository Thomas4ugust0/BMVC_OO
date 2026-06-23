from app.controllers.application import Application
from peewee import IntegrityError
from bottle import Bottle, redirect, response, run, request, static_file
import os
from app.models.user_account import Usuario
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
@app.route('/passeador/<parametro>')
def action_passeador(parametro=None):
    if not parametro:
        return ctl.render('passeador')
    else:
        return ctl.render('passeador', parametro)

@app.route('/cliente')
@app.route('/cliente/<parametro>') 
def action_cliente(parametro=None):
    if not parametro:
        return ctl.render('cliente')
    else:
        return ctl.render('cliente', parametro)

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
    # Formulário id="login-form" no HTML
    email = request.forms.get('email')
    senha = request.forms.get('senha')
    usuario = Usuario.get_or_none(Usuario.email == email)
    if usuario and usuario.checar_senha(senha):
        # Criação do cookie de sessão com segurança básica
        response.set_cookie('session_id', str(usuario.id), httponly=True, secure=True, max_age=3600)
        
        # Roteamento do role
        if usuario.role == 'owner':
            return redirect(f'/cliente/{usuario.nome}')
        elif usuario.role == 'walker':
            return redirect(f'/passeador/{usuario.nome}')
    else:
        return "E-mail ou senha incorretos. Tente novamente."


@app.route('/logout', method=['GET', 'POST'])
def logout():
    response.delete_cookie('session_id')
    return redirect('/index')

#-----------------------------------------------------------------------------

if __name__ == '__main__':
    run(app, host='0.0.0.0', port=8080, debug=True)