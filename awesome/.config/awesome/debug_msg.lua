local naughty = require("naughty")

return function(msg)
  naughty.notify({ title = msg, message = msg, timeout = 5 })
end
