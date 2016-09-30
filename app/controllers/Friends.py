
from system.core.controller import *

class Friends(Controller):
    def __init__(self, action):
        super(Friends, self).__init__(action)

        self.load_model('User')
        self.load_model('Friend')


    def index(self):

        return self.load_view('index.html')

    def register(self):
        data={
            'name' : request.form['name'],
            'alias' : request.form['alias'],
            'email' : request.form['email'],
            'password' : request.form['password'],
            'password2' : request.form['password2'],
            'birthday' : request.form['birthday']
        }

        user = self.models['User'].create_user(data)
        if user['status'] == False:
            for error in user['errors']:
                flash(error, 'error')
            return redirect('/')
        if user['status'] == True:
            session['user'] = user['user']
            return redirect('/friends')

    def login(self):
        data = {
            'email' : request.form['email'],
            'password' : request.form['password']
        }

        user = self.models['User'].login_user(data)

        if user['status'] == False:
            for error in user['errors']:
                flash(error, 'error2')
            return redirect('/')
        if user['status'] == True:
            session['user'] = user['user']
            return redirect('/friends')

    def friend(self):
        #user homepage
        if not 'user' in session: return redirect('/')

        data = {
            'id' : session['user']['id']
        }
        friends = self.models['Friend'].get_friends(data)

        nonFriends = self.models['Friend'].get_non_friends(data)

        return self.load_view('/friends/index.html', user=session['user'], friends = friends, nonFriends = nonFriends)


    def add_friend(self,id):
        data={
            'id' : session['user']['id'],
            'friend_id' : id
        }

        self.models['Friend'].add_friend(data)
        return redirect('/friends')


    def remove_friend(self, id):
        data = {
            'id' : session['user']['id'],
            'friend_id' : id
        }

        self.models['Friend'].remove_friend(data)
        return redirect('/friends')

    def user(self, id):
        if not 'user' in session: return redirect('/')
        data = {
            'id' : id
        }
        user = self.models['User'].get_one_user(data)
        return self.load_view('/users/index.html', user = user)


    def logout(self):
        session.clear()
        return redirect('/')
