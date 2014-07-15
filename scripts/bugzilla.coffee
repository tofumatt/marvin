# Get bug information from bugzilla.
#
# bug <bugnumber> - Get bug information.

Bz = require "bz"
Client = Bz.createClient({
  url: "https://api-dev.bugzilla.mozilla.org/1.3/"
})

module.exports = (robot) ->
  robot.hear /bug (\d+)/i, (msg) ->
    Client.getBug msg.match[1], (error, bug) ->

      title = "Bug #{bug.id}"

      # bug.url isn't set properly, so build it ourselves
      url = makeBugURL bug.id
      # url = "https://bugzilla.mozilla.org/show_bug.cgi?id=#{bug.id}"

      msg.send [title, url].join " | "

makeBugURL = (number, comment) ->
  url = "http://bugzil.la/#{number}"
  url += "##{comment}" if comment
  return url
