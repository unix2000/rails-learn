words = ['foobar', 'baz', 'quux']
secret = words[rand(3)]

print "guess?"
while guess = STDIN.gets
  guess.chop!
  if guess == secret
    puts "You win!"
    break
  else
    puts "Sorry, you lose."
  end
  print "guess?"
end
puts "The word was " + secret + "."

# curl -i -X PUT -d "user[name]=gg-user" --header "Authorization: Token token=zjyOzovdnuwUausPeQgp/7GbFrHsaQ/4H6wG9vjQ0kpm6VkWFpU/dXovD4GS2b4YO8sSrKtwdXVXQX7Po5GsXg==,email=test-user-00@mail.com" http://localhost:3000/api/v1/users/1
