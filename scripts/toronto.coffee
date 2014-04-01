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
    "http://cdn.newadnetwork.com/sites/prod/files/uploads/sskinner/robfordmeme.jpg",
    "http://upload.wikimedia.org/wikipedia/en/8/8f/RobFordCrackHouse.jpg",
    "http://backofthebook.ca/wp-content/uploads/2013/11/rob-ford.jpg",
    "http://markosun.files.wordpress.com/2013/12/rob-ford1.jpg",
    "http://torontoist.com/wp-content/uploads/2013/08/rob-ford-hulk-hogan-arm-wrestling-fan-expo-5.jpg",
    "http://wpmedia.news.nationalpost.com/2013/11/rob-ford-crack-2013.jpg?w=620",
    "http://www.marxist.ca/images/stories/rob-ford-drunk-2.jpg"
  ]

  robot.hear /(Toronto|Torontonians|Rob Ford|Spadina)/i, (msg) ->
    msg.send msg.random(fordisms)
