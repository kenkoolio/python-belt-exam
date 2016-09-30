
from system.core.model import Model
import re
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9\.\+_-]+@[a-zA-Z0-9\.\_-]+\.[a-zA-Z]+$')
NAME_REGEX = re.compile(r'^[a-zA-Z]+$')

class User(Model):
    def __init__(self):
        super(User, self).__init__()

    def get_all_users(self):
        query = 'SELECT * FROM user;'
        return self.db.query_db(query)

    def get_one_user(self, info):
        data = {
            'id' : info['id']
        }
        query = 'SELECT * FROM user WHERE id=:id LIMIT 1;'
        user = self.db.query_db(query,data)
        return user[0]

    def create_user(self, info):
        errors = []
        data = {
            'name' : info['name'],
            'alias' : info['alias'],
            'email' : info['email'],
            'password' : info['password'],
            'password2' : info['password2'],
            'birthday' : info['birthday']
        }

        if not data['name']:
            errors.append('Name cannot be blank')
        elif len(data['name']) < 2:
            errors.append('Name must be at least 2 characters')
        elif not NAME_REGEX.match(data['name']):
            errors.append('Name cannot contain special characters or numbers')
        if not data['alias']:
            errors.append('Alias cannot be blank')
        elif len(data['alias']) < 2:
            errors.append('Alias must be at least 2 characters')
        if not data['email']:
            errors.append('Email cannot be blank')
        elif not EMAIL_REGEX.match(data['email']):
            errors.append('Email must be in correct format')
        if not data['password']:
            errors.append('Password cannot be blank')
        elif len(data['password']) < 8:
            errors.append('Password must be at least 8 characters')
        elif not data['password']==data['password2']:
            errors.append('Your passwords must match')
        if not data['birthday']:
            errors.append('Please enter your birthday!')

        if errors:
            return {'status':False, 'errors':errors}

        data['pw_hash'] = self.bcrypt.generate_password_hash(data['password'])
        insert_user_query = 'INSERT INTO user (name, alias, email, pw_hash, birthday, created_at, updated_at) VALUES (:name, :alias, :email, :pw_hash, :birthday, NOW(), NOW());'

        new_user = self.db.query_db(insert_user_query, data)
        new_user_data = {
            'id' : new_user
        }
        get_query = 'SELECT * FROM user WHERE id=:id LIMIT 1;'
        user = self.db.query_db(get_query, new_user_data)
        return {'status' : True, 'user' : user[0] }


    def login_user(self, info):
        errors = []
        data = {
            'email' : info['email'],
            'password' : info['password']
        }

        check_user_query = 'SELECT * FROM user WHERE email=:email LIMIT 1;'

        user = self.db.query_db(check_user_query, data)

        if user:
            if self.bcrypt.check_password_hash(user[0]['pw_hash'], data['password']):
                return {'status' : True, 'user' : user[0]}

        errors.append('Email or password is incorrect')
        return {'status' : False, 'errors' : errors}
