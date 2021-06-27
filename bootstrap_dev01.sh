#!/bin/bash
yum update -y
yum install git go -y
cat <<EOT > /home/ec2-user/dev01.go
package main

import (
    "fmt"
    "net/http"
)

func main() {
    http.HandleFunc("/", HelloServer)
    http.ListenAndServe(":80", nil)
}

func HelloServer(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello World %s!", r.URL.Path[1:])
}
EOT
sudo go run /home/ec2-user/dev01.go

