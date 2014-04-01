# Description:
#   Toronto mayor Rob Ford is... not great
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   toronto - Send out some Rob Ford-ness

module.exports = (robot) ->

  fordisms = [
    "http://wpmedia.o.canada.com/2013/07/rob_ford_vice.jpg",
    "http://www.q92rocks.com/files/robford5.jpg",
    "http://cdn.newadnetwork.com/sites/prod/files/uploads/sskinner/robfordmeme.jpg"
  ]

  robot.hear /(Toronto|Torontonians|Rob Ford|Spadina)/i, (msg) ->
    msg.send msg.random(fordisms)
