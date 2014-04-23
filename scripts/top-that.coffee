# Description:
#   Top that.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   top that - TOP THAT!

module.exports = (robot) ->

  robot.hear /(top that)/i, (msg) ->
    msg.send "http://media.giphy.com/media/Z5Ns7jpdNqD04/giphy.gif"
