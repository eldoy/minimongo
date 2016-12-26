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
