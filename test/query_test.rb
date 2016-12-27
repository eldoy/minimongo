test 'Query'

Minimongo.model = false

is !!Minimongo::Helpers::Query, true

test 'oid'

s = '586278860aec08b7d397d06d'
is oid(nil), nil
is oid('val'), 'val'
is oid(s), BSON::ObjectId

test 'view'

is find(:models), Mongo::Collection::View

test 'insert'

insert(:models, :duration => 60)

test 'update'

t = update(:models, {:duration => 60}, :duration => 50)

test 'find'

m = find(:models, :duration => 50).to_a

is m, Array

is m.size, :gt => 0

m = find(:models).first

is m, BSON::Document

c = find(:models).count

is c, Integer
is c, :gt => 0

m = delete(:models, :_id => m[:_id])

d = find(:models).count

is d, Integer
is d, :lt => c
