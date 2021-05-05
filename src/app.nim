import prologue
import prologue/middlewares

# Async Function
proc home*(ctx: Context) {.async.} =
  resp "<h1>Home</h1>"

proc helloName*(ctx: Context) {.async.} =
  resp "<h1>Hello, " & ctx.getPathParams("name", "Prologue") & "</h1>"

let settings = newSettings(appName = "Prologue")
var app = newApp(settings = settings)
app.use(debugRequestMiddleware())
app.addRoute("/", home, HttpGet)
app.addRoute("/home", home, HttpGet)
app.addRoute("/hello/{name}", helloName, HttpGet)
app.run()
