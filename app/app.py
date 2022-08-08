from flask import Flask
app = Flask(__name__)

@app.route("/")
def index():
  return """
  <!DOCTYPE html>
  <html>
    <body style="background-color:powderblue;">
      <h1>Hello World!</h1>
      <p>This is running on Flask. It is version:4.</p>
    </body>
  </html>
  """

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
