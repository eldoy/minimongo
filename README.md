# Minimongo
The world's tiniest MongoDB Ruby library.

### Installation
```
gem install minimongo
```
or add to Gemfile.

### Usage
```ruby
# All commands supported
# https://docs.mongodb.com/ruby-driver/master/quick-start

# Connect
Minimongo.db = Mongo::Client.new([ '127.0.0.1:27017' ], :database => "minimongo")

# Include as helper in your Sinatra app
helpers Minimongo::Query

# Find
d = find(:domains).first
d = find(:domains).sort(:duration => -1).to_a
m = find(:messages, :_id => d._id).limit(1).first

# Insert
insert(:domains, :name => p[:name], :email => p[:email], :reply => p[:reply])

# Update
update(:domains, {:_id => p[:id]}, :name => p[:name], :email => p[:email])

# Delete
delete(:domains, :_id => p[:id])
```

Created and maintained by [Fugroup Ltd.](https://www.fugroup.net) We are the creators of [CrowdfundHQ.](https://crowdfundhq.com)

`@authors: Vidar`
