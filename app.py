from flask import Flask, request

app = Flask(__name__)

items = [
    {
        "name": "momos",
        "price": 100
    },
    {
        "name": "kurkure",
        "price": 20
    }
]

# GET All Items
@app.get('/get-items')
def get_items():
    return {"items": items}


# GET Single Item
@app.get('/get/<string:name>')
def get_item(name):

    for item in items:
        if name == item['name']:
            return item

    return {'message': 'Item not found'}


# POST Item
@app.route('/add-items', methods=['POST'])
def post_items():

    request_data = request.get_json()

    items.append(request_data)

    return {"message": "Item created"}, 201


# PUT Item (Update)
@app.route('/update-item', methods=['PUT'])
def put_items():

    request_data = request.get_json()

    for item in items:
        if item['name'] == request_data['name']:

            item['price'] = request_data['price']

            return {"message": "Item updated"}

    return {'message': 'Item not available'}


if __name__ == "__main__":
    app.run(debug=True)