
from system.core.model import Model

class Friend(Model):
    def __init__(self):
        super(Friend, self).__init__()

    def get_friends(self, info):
        data={
            'id' : info['id']
        }
        query = 'SELECT *, user.id AS myID, user.alias AS myAlias, friend.alias AS friendAlias, friend.id AS friendID FROM user LEFT JOIN friends ON user.id = friends.user_id LEFT JOIN user AS friend ON friends.friend_id = friend.id WHERE friends.user_id = :id;'
        return self.db.query_db(query, data)

    def get_non_friends(self,info):
        data = {
            'id' : info['id']
        }
        # query = 'SELECT * FROM user AS friend LEFT JOIN friends ON friend.id = friends.friend_id LEFT JOIN user ON friends.user_id = user.id WHERE friends.user_id <> :id;'
        my_friends_query = 'SELECT *, friends.friend_id AS friendID FROM user JOIN friends ON user.id = friends.user_id WHERE friends.friend_id = :id;'

        myfriends = self.db.query_db(my_friends_query, data)
        idList = [info['id']]
        for friend in myfriends:
            idList.append(friend['user_id'])
        data['idList'] = idList
        print '--------------------'
        print data['idList']

        query = 'SELECT *, user.id AS myID, user.alias AS myAlias, friend.alias AS friendAlias, friend.id AS friendID FROM user LEFT JOIN friends ON user.id = friends.user_id LEFT JOIN user AS friend ON friends.friend_id = friend.id WHERE user.id NOT IN :idList GROUP BY user.id;'
        return self.db.query_db(query, data)

    def add_friend(self, info):
        data = {
            'id' : info['id'],
            'friend_id' : info['friend_id']
        }

        add_friend_query = 'INSERT INTO friends (user_id, friend_id, created_at, updated_at) VALUES (:id, :friend_id, NOW(), NOW());'

        add_friend_recip = 'INSERT INTO friends (user_id, friend_id, created_at, updated_at) VALUES (:friend_id, :id, NOW(), NOW());'


        self.db.query_db(add_friend_query, data)
        self.db.query_db(add_friend_recip, data)
        return


    def remove_friend(self, info):
        data = {
            'id' : info['id'],
            'friend_id' : info['friend_id']
        }

        remove_friend_query = 'DELETE FROM friends WHERE friend_id = :friend_id AND user_id = :id;'

        remove_friend_recip = 'DELETE FROM friends WHERE user_id = :friend_id AND friend_id = :id ;'

        self.db.query_db(remove_friend_query, data)
        self.db.query_db(remove_friend_recip, data)
        return
