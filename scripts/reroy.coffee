# Description:
#   rerun a leeroy job
#
# Configuration:
#   LEEROY_SERVER
#
# Commands:
#   hubot rerun <project> <pull-request-#>
#   hubot reroy <project> <pull-request-#>
#
# Author:
#   lonnen

module.exports = (robot) ->

  leeroy_server = process.env.LEEROY_SERVER

  robot.respond /rer(?:un|oy) (\w+) (\d+)/i, (msg) ->
    unless leeroy_server
      msg.send "Please set the LEEROY_SERVER environment variable."
      return

    project = msg.match[1]
    pull = msg.match[2]
    full_name = "mozilla/#{ project }"

    pullRequestURL = "https://github.com/#{ full_name }/pulls/#{ pull }"
    console.log pullRequestURL
    robot.http("https://api.github.com/repos/#{ full_name }/pulls/#{ pull }")
      .get() (err, res, body) ->
        parsed = JSON.parse body
        if err
          console.log err
          msg.send "There was a problem. Sorry"
          return
        if res.headers["X-RateLimit-Remaining"] is "0"
          msg.send "Rate limited exceeded. Try again later."
          return
        if parsed.message is "Not Found"
          msg.send "Couldn't find that project/pull request combo."
          return
        if parsed.merged
          msg.send "That PR was already merged by #{ parsed.merged_by.login }"
          return
        if parsed.state is "closed"
          msg.send "That PR was closed without merging."
          return

        robot.http(leeroy_server + "/notification/github")
          .header('content-type', 'application/json')
          .post(JSON.stringify({
            "type": "SimulatedPullRequestEvent",
            "action": "synchronize",
            "pull_request": {
              "number": pull,
              "html_url": pullRequestURL,
              "base": {
                "repo": {
                  "full_name": full_name
                }
              },
              "head": {
                "repo": {
                  "full_name": parsed.head.repo.full_name
                },
                "sha": parsed.head.sha
              }
            }
          })) (err, res, body) ->
          if err
            console.log err
            msg.send "There was a problem. Sorry"
          msg.send "Restarted -- #{ pullRequestURL }"
