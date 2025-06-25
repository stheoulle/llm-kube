from flask import Flask, request, jsonify
from transformers import pipeline

app = Flask(__name__)
model = pipeline('text-generation', model='gpt2')

@app.route('/generate', methods=['POST'])
def generate():
    data = request.json
    text = data.get('input', '')
    result = model(text, max_length=100)
    return jsonify(result)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
