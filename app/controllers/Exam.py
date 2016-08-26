
from __future__ import print_function
from system.core.controller import *
import sys #sys.stderr.write('text_you_want_to_print\n')
class Exam(Controller):
    def __init__(self, action):
        super(Exam, self).__init__(action)
    
        self.load_model('ExamModel')
        self.db = self._app.db


   
    def index(self):
        return self.load_view('index.html')

    def create(self):
        user_info = {
            "name" : request.form['name'],
            "alias" : request.form['alias'],
            "email" : request.form['email'],
            "password" : request.form['password'],
            "dob" : request.form['dob']
        }

        print(user_info, file=sys.stderr)
        user_id = self.models['ExamModel'].add_user(user_info)

        session['id'] = user_id[0]['id']
        session['name'] = user_id[0]['name']
        session['alias'] = user_id[0]['alias']
        # session['email'] = user_id[0]['email']
        # session['last_name'] = user_id[0]['last_name']

        users = self.models['ExamModel'].get_users(user_id)

        sys.stderr.write('Test2\n')
        return self.load_view('pokes.html', users=users)

    def login(self):
        user_info = {
            "email" : request.form['email'],
            "password" : request.form['password']
        }
        sys.stderr.write('Test3\n')
        user_id = self.models['ExamModel'].login_user(user_info)

        session['id'] = user_id[0]['id']
        session['name'] = user_id[0]['name']
        session['alias'] = user_id[0]['alias']
        # session['email'] = user_id[0]['email']
        # session['last_name'] = user_id[0]['last_name']
        sys.stderr.write('Test4\n')

        users = self.models['ExamModel'].get_users(user_id)
        sys.stderr.write('Test5\n')
        return self.load_view('pokes.html', users=users)
    # def pokes(self):
    #     return self.load_view('pokes.html')

    def logout(self):
        session.clear()
        return self.load_view('index.html')

    def poke(self):
        sys.stderr.write('Test6\n')
        users = self.models['ExamModel'].poke_users(user_id)
        sys.stderr.write('Test7\n')
        return self.load_view('pokes.html')