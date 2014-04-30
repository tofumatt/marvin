# Description:
#   A response to "rimshot" in the chat.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   rimshot - Drum noise!

module.exports = (robot) ->

  robot.hear /rimshot/i, (msg) ->
    msg.send "http://isithackday.com/html5-rimshot/"
