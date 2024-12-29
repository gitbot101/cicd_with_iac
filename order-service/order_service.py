# order_service.py
from flask import Flask, request, jsonify

app = Flask(__name__)

orders = {}

@app.route('/order', methods=['POST'])
def create_order():
    order_id = request.json['id']
    user_id = request.json['user_id']
    items = request.json['items']
    orders[order_id] = {'user_id': user_id, 'items': items}
    print("new order list ...")
    print(orders)
    return jsonify({"message": "Order created"}), 201

@app.route('/order/<order_id>', methods=['GET'])
def get_order(order_id):
    print("orders ...")
    print(orders)

    order = orders.get(order_id, {})
    return jsonify(order), 200

if __name__ == "__main__":
    app.run(host='0.0.0.0',port=5002)

