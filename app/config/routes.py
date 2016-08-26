
from system.core.router import routes

routes['default_controller'] = 'Exam'
routes['POST']['/create'] = 'Exam#create'
routes['POST']['/login'] = 'Exam#login'
routes['POST']['/logout'] = 'Exam#logout'
routes['POST']['/poke'] = 'Exam#poke'