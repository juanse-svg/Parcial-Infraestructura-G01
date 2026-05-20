from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route("/health")
def health():
    return jsonify({"status": "ok", "service": "aws-infra-final"}), 200

@app.route("/")
def index():
    return jsonify({"message": "API funcionando correctamente"}), 200

@app.route("/api/test")
def test():
    return jsonify({"test": "passed", "env": os.getenv("ENV", "production")}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)