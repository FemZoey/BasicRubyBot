require 'discordrb'
require 'base64'

TOKEN =  ''
bot = Discordrb::Bot.new token: TOKEN

#sends the list of commands for the bot
bot.message(with_text: '!commands') do |event|
    event.respond("The prefix is **!**. \n ping \n dice \n dm.")
end

#ping command that retrieves the time the bot takes to ping discord.
bot.message(with_text: '!ping') do |event|
    m = event.respond('ping time:')
    m.edit("ping time: #{Time.now - event.timestamp}ms")
end

#random number generator
bot.message(with_text: '!dice') do |event|
    number = rand(1..6)
    event.respond("You rolled a #{number}")
end

#dm a user when they use the !dm command
bot.message(with_text: '!dm') do |event|
    event.respond("dming you uwu")
    event.user.pm("uwu")
end

#encodes messages to base64
#bot.message() do |event|
#    encoded = Base64.encode64("#{event.author.username} | #{event.content}")
#    print("#{encoded}")
#end

bot.run