import pytest
from app.main import app

@pytest.fixture
def client():
    app.config["TESTING"] = True
    with app.test_client() as client:
        yield client

def test_health(client):
    res = client.get("/health")
    assert res.status_code == 200
    assert res.json["status"] == "ok"

def test_index(client):
    res = client.get("/")
    assert res.status_code == 200

def test_api_test(client):
    res = client.get("/api/test")
    assert res.status_code == 200
    assert res.json["test"] == "passed"