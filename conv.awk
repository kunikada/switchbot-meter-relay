/Humiture/ {
  gsub(/:/, "")
  i = match($0, /^[0-9]+ \['(.*)', "Humiture([0-9.]+)'C ([0-9]+)%"\]/, m)
  if (i != 0) {
    key = m[1] "_t"
    data[key] = m[2]
    key = m[1] "_h"
    data[key] = m[3]
  }
}
END {
  if (length(data) > 0) {
    print "{"
    for (key in data) {
      print "\"" key "\": " data[key] ","
    }
    print "\"created_at\": \"" strftime("%Y-%m-%d %H:%M:%S", systime()) "\""
    print "}"
  }
}
