import http from "k6/http";
import { check, sleep } from "k6";

export let options = {
  stages: [
    { duration: "30s", target: 10 },  // sube a 10 usuarios
    { duration: "1m", target: 50 },   // sube a 50 usuarios
    { duration: "30s", target: 0 },   // baja a 0
  ],
  thresholds: {
    http_req_duration: ["p(95)<500"],  // 95% de requests bajo 500ms
    http_req_failed: ["rate<0.01"],    // menos del 1% de errores
  },
};

const BASE_URL = __ENV.BASE_URL || "http://localhost:5000";

export default function () {
  let res = http.get(`${BASE_URL}/health`);
  check(res, {
    "status 200": (r) => r.status === 200,
    "respuesta ok": (r) => r.json("status") === "ok",
  });
  sleep(1);

  let res2 = http.get(`${BASE_URL}/api/test`);
  check(res2, {
    "api/test status 200": (r) => r.status === 200,
  });
  sleep(1);
}