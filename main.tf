resource "local_file" "index_html" {
  filename = "index.html"
  content = "<h1>Hello world!</h1>"
}