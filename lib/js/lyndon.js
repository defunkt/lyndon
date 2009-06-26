var Lyndon = {
  required: {},

  require: function(file) {
    var directory, path, loadPath = Ruby('$LOAD_PATH')
    file = Ruby.File_join(Ruby.File_dirname(file),
                          Ruby.File_basename(file, ".js") + ".js")

    if (Lyndon.required[file]) return false

    for (var i = 0; i < Ruby('$LOAD_PATH').length; i++) {
      directory = loadPath[i]
      path = Ruby.File_join(directory, file)

      if (Ruby.File_file(path)) {
        Lyndon.required[file] = true
        eval(Ruby.File_read(path))

        return true
      }
    }

    throw Ruby.LoadError
  }
}