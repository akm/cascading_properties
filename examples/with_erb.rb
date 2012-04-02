compiler {
  error {
    message {
      varNotFound "variable not found"
      incompatibleType "incompatible type"
    }
  }
  maxReport <%= ENV['MAX_REPORT'] %>
  files {
    input.encoding "SJIS"
    output.encoding  "UTF-8"
  }
}
