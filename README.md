## How to send POST using curl

Need to run main using host=0.0.0.0. Otherwise the app will just start on the loopback address 127.0.0.1 which listens to http requests originating on the same machine (container).

Code:
if __name__ == "__main__":
    app.run(host='0.0.0.0',port=5001)

(base) srini@Srinivass-MacBook-Air-M1 cicd_with_iac % docker run -p 5002:5002 order-service 
  Serving Flask app 'order_service'
  Debug mode: off
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
  Running on all addresses (0.0.0.0)
  Running on http://127.0.0.1:5002
  Running on http://172.17.0.2:5002

Sample invocation of api:

(base) srini@Srinivass-MacBook-Air-M1 user-service % curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"id":100,"username":"xyz","password":"xyz"}' \
  http://localhost:5001/register 
{"message":"User registered"}

(base) srini@Srinivass-MacBook-Air-M1 user-service % curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"username":"srini","password":"srini"}' \
  http://localhost:5001/login  
{"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyMDAsImV4cCI6MTczNDIyMjM2M30.05-lC-wRgHI3HayrSWhEg3CC3RUDCzkeD8R3ROY4Zz0"}

