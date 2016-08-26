
from __future__ import print_function
from system.core.model import Model
import sys #sys.stderr.write('text_you_want_to_print\n')
class ExamModel(Model):
    def __init__(self):
        super(ExamModel, self).__init__()
   
    def add_user(self, user):
        query = "INSERT INTO users (name, alias, email, password, dob, created_at) VALUES (:name, :alias, :email, :password, :dob, NOW())"
        sys.stderr.write('Test6\n')

        self.db.query_db(query, user)

        query = 'SELECT * FROM users WHERE users.email = :email AND users.password = :password'
        sys.stderr.write('Test7\n')
        return self.db.query_db(query, user)


    def get_users(self, user):
        query = 'SELECT * FROM users WHERE id = id'
        data = {'id' : id}
        return self.db.query_db(query)



    def login_user(self, user):

        query ='SELECT * FROM users WHERE users.email = :email AND users.password = :password'
        return self.db.query_db(query, user)


    def poke_users(self,user):
        query = 'INSERT INTO pokes WHERE user.id = id'
        data = {'id' : id}
        return self.db.query_db(query)