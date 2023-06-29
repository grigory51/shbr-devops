package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
)

func handle(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("X-Shbr-Lang", "go")
	_, _ = io.WriteString(w, fmt.Sprintf("%s%s\n", os.Getenv("PREFIX"), r.URL.Path[1:]))
}

func main() {
	host := os.Getenv("HOST")
	if host == "" {
		host = "0.0.0.0"
	}

	port := os.Getenv("PORT")
	if port == "" {
		port = "10000"
	}

	router := http.NewServeMux()
	router.HandleFunc("/", handle)

	if err := http.ListenAndServe(fmt.Sprintf("%s:%s", host, port), router); err != nil {
		log.Fatal(err)
	}
}
