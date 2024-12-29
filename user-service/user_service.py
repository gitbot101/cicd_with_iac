# user_service.py
from flask import Flask, request, jsonify
import jwt
import datetime

app = Flask(__name__)
app.config['SECRET_KEY'] = 'your_secret_key'

users = {}

@app.route('/register', methods=['POST'])
def register():
    print("Received request: ")
    print(request)
    print("End")
    user_id = request.json['id']
    username = request.json['username']
    password = request.json['password']
    users[user_id] = {'username': username, 'password': password}
    return jsonify({"message": "User registered"}), 201

@app.route('/login', methods=['POST'])
def login():
    username = request.json['username']
    password = request.json['password']
    for user_id, user in users.items():
        if user['username'] == username and user['password'] == password:
            token = jwt.encode({'user_id': user_id, 'exp': datetime.datetime.utcnow() + datetime.timedelta(hours=1)}, app.config['SECRET_KEY'])
            return jsonify({'token': token}), 200
    return jsonify({"message": "Invalid credentials"}), 401

@app.route('/profile/<user_id>', methods=['GET'])
def profile(user_id):
    user = users.get(user_id, {})
    return jsonify(user), 200

if __name__ == "__main__":
    app.run(host='0.0.0.0',port=5001)

