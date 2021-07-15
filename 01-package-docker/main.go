package main

import (
    "fmt"
    "net/http"
    "os"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w,"%s%s\n", os.Getenv("PREFIX"), r.URL.Path[1:])
}


func main() {
    http.HandleFunc("/", handler)
    _ = http.ListenAndServe(":10000", nil)
}