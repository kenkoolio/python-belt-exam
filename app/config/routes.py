
from system.core.router import routes

routes['default_controller'] = 'Friends'
routes['/'] = 'Friends#index'
routes['POST']['/register'] = 'Friends#register'
routes['POST']['/login'] = 'Friends#login'
routes['GET']['/friends'] = 'Friends#friend'

routes['/add_friend/<int:id>'] = 'Friends#add_friend'
routes['/remove/<int:id>'] = 'Friends#remove_friend'

routes['/user/<int:id>'] = 'Friends#user'


routes['GET']['/logout'] = 'Friends#logout'
