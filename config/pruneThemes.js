var glob = require("glob");
var rimraf = require("rimraf");

glob("app/themes/!(right-theme)", function(er, files) {
  var int = files.length;

  if (er !== null) {
    console.warn(er);
  }

  function whatDeleted() {
    console.log(int + " entries deleted")
    console.log(files);
  }

  function handle(f) {
    files.map(function map(item) {
      rimraf.sync(item);
    });
    return whatDeleted();
  };

  return handle(files)
});
