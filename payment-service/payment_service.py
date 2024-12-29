# payment_service.py
from flask import Flask, request, jsonify

app = Flask(__name__)

payments = {}

@app.route('/payment', methods=['POST'])
def create_payment():
    payment_id = request.json['id']
    order_id = request.json['order_id']
    amount = request.json['amount']
    payments[payment_id] = {'order_id': order_id, 'amount': amount, 'status': 'processed'}
    return jsonify({"message": "Payment processed"}), 201

@app.route('/payment/<payment_id>', methods=['GET'])
def get_payment(payment_id):
    payment = payments.get(payment_id, {})
    return jsonify(payment), 200

if __name__ == "__main__":
    app.run(host='0.0.0.0',port=5003)

