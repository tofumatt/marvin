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

  topThese = [
    "http://media.giphy.com/media/Z5Ns7jpdNqD04/giphy.gif",
    "http://media.giphy.com/media/2vLKvKhQuD3eE/giphy.gif",
    "http://media.giphy.com/media/wYipAUNUI2PpS/giphy.gif",
    "http://media.giphy.com/media/Qhrh5BB78Z1qU/giphy.gif",
    "http://media.giphy.com/media/12UUxHcN25DqqQ/giphy.gif",
    "http://media.giphy.com/media/gPa9YSHtPnj4A/giphy.gif"
  ]

  robot.hear /(top that)/i, (msg) ->
    msg.send msg.random(topThese)
