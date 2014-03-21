# Marvin the Paranoid Android

`marvin` is the IRC bot that hangs out in a few channels on `irc.mozilla.org`,
chiefly `#apps` and `#webdev`. It's based on [Hubot](http://hubot.github.com/)
and deployed on Heroku.

## IRC Adapter changes

Because of a bug in the IRC adapter, I've made a
[single modification](https://github.com/tofumatt/marvin/blob/master/node_modules/hubot-irc/src/irc.coffee#L168)
to prevent the bot from joining the server but not joining any channels.
