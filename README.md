# Minimongo
MongoDB ruby helpers for flat space ruby apps.

### Installation
```
gem install minimongo
```
or add to Gemfile.

### Usage
```ruby

# Connect
$db = Mongo::Client.new([ '127.0.0.1:27017' ], :database => "minimongo")

# Include as helper in your Sinatra app
helpers Minimongo::Helpers::Request

# Find
@message = find_by_id(:messages, p[:id])
@domains = find(:domains)

# Insert
insert(:domains, :name => p[:name], :email => p[:email], :reply => p[:reply])

# Update
update(:domains, {:_id => p[:id]}, :name => p[:name], :email => p[:email])

# Delete
delete(:domains, :_id => p[:id])
```

Created and maintained by [Fugroup Ltd.](https://www.fugroup.net) We are the creators of [CrowdfundHQ.](https://crowdfundhq.com)

`@authors: Vidar`
