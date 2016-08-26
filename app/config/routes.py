
from system.core.router import routes

routes['default_controller'] = 'Exam'
routes['/pokes'] = 'Exam#pokes'
routes['POST']['/create'] = 'Exam#create'
routes['POST']['/login'] = 'Exam#login'
routes['POST']['/logout'] = 'Exam#logout'