require "slack-notify"
require 'clockwork'
require 'active_support/time'
require 'dotenv'
Dotenv.load

module Clockwork
  client = SlackNotify::Client.new(
    webhook_url: ENV['slack_url'],
    channel: "#general",
    username: "incoming-webhook",
    icon_url: "http://mydomain.com/myimage.png",
    icon_emoji: ":shipit:",
    link_names: 1
  )
  every(3.minutes, 'notify') do
    client.notify("Hello There!")
  end
end