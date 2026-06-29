import logging
from typing import Optional, Callable, Dict, Any
from bottle import template, request
from app.models.user_account import Usuario, Pet

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class Application:
    def __init__(self) -> None:
        self.pages: Dict[str, Callable] = {
            'index': self.index,
            'passeador': self.passeador,
            'cliente': self.cliente,
            'portal': self.portal
        }

    def render(self, page: str, parameter: Optional[str] = None) -> Any:
        try:
            content_function = self.pages.get(page, self.index)
            
            if parameter is None:
                return content_function()
            return content_function(parameter)
            
        except Exception as erro:
            logger.error(f"Erro no servidor ao tentar renderizar '{page}': {erro}")
            return self.index()

    def get_session_id(self) -> Optional[str]:
        return request.get_cookie('session_id')

    def get_current_user(self) -> Optional[Usuario]:
        """Busca o objeto completo do usuário logado no banco de dados."""
        session_id = self.get_session_id()
        if session_id and session_id.isdigit():
            return Usuario.get_or_none(Usuario.id == int(session_id))
        return None

    def index(self) -> str:
        return template('app/views/html/index.html')

    def passeador(self, parameter: Optional[str] = None) -> str:
        usuario_logado = self.get_current_user()
        email_usuario = usuario_logado.email if usuario_logado else "e-mail indisponível"
        
        return template('app/views/html/passeador.tpl', username=parameter, email=email_usuario)

    def portal(self) -> str:
        return template('app/views/html/portal.tpl')
    
    def cliente(self) -> str:
        usuario_logado = self.get_current_user()
        
        if not usuario_logado:
            return self.index()

        meus_pets = Pet.select().where(Pet.dono == usuario_logado)
        
        return template('app/views/html/cliente.tpl', usuario=usuario_logado, pets=meus_pets)