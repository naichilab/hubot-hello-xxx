# Description
#   A hubot script that does the things
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot hello - <what the respond trigger does>
#   orly - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   naichilab <naichilab@live.jp>

config =
  message: process.env.HUBOT_HELLO_XXX_MESSAGE
  messages: JSON.parse(process.env.HUBOT_HELLO_XXX_MESSAGES ? '[]')

module.exports = (robot) ->
  unless config.message?
    robot.logger.error 'process.env.HUBOT_HELLO_XXX_MESSAGE is not defined'
    return

  robot.respond /hello$/, (msg) ->
    msg.send "#{config.message}, #{msg.envelope.user.name}!"

  robot.respond /hello!$/, (msg) ->
    message = msg.random config.messages
    msg.send message if message?
