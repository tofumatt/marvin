# Description:
#   Deal With it.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   deal with it - summon the Deal With It Dinosaur.

module.exports = (robot) ->

  dealWithIt = """
                             __
                            /..)
                           / VV
                          / /
                         / /
    ,.--=^^^^^^^^^^^^=--/ /
 __/     DEAL WITH IT    /
<__.-|_|--------------|_|"""

  robot.hear /(deal with it)/i, (msg) ->
    msg.send dealWithIt
