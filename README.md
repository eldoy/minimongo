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

# Include methods in a class or module
include Minimongo::Query

# Include as helper in a Sinatra app
helpers Minimongo::Query

# Find needs first, count or to_a after
d = find(:domains).first
d = find(:domains).sort(:duration => -1).to_a
m = find(:messages, :_id => d._id).limit(1).first
c = find(:messages).count

# All
m = all(:messages)
m = all(:messages, :duration => {:$gt => 6})

# First
m = first(:models)
m = first(:models, :goal => 7)

# Last
m = last(:models)
m = last(:models, :duration => {:$ne => 6})

# Count
c = count(:messages)
c = count(:messages, :goal => 'hello')

# Insert
insert(:domains, :name => p[:name], :email => p[:email], :reply => p[:reply])

# Update
update(:domains, {:_id => p[:id]}, :name => p[:name], :email => p[:email])

# Delete
delete(:domains, :_id => p[:id])

# String to Object ID
oid('586333360aec08e87bd62180')

# New Object ID
oid(:new)

```

Created and maintained by [Fugroup Ltd.](https://www.fugroup.net) We are the creators of [CrowdfundHQ.](https://crowdfundhq.com)

`@authors: Vidar`
