test 'Query'

is !!Minimongo::Query, true

test 'oid'

s = '586278860aec08b7d397d06d'
is oid(nil), BSON::ObjectId
is oid('val'), BSON::ObjectId
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

test 'sort'
m = find(:models).sort(:duration => 1).limit(2).to_a
is m, Array
is m.size, 2

test 'limit'
m = find(:models).sort(:duration => -1).limit(5).to_a
is m, Array
is m.size, 5
is m.first, BSON::Document

test 'first'

m = first(:models, :goal => 7)
is m, nil

m = first(:models)
is m, BSON::Document

test 'last'
n = last(:models)
is n, BSON::Document
is n[:_id].to_s, :ne => m[:_id].to_s

test 'all'
n = all(:models)
is n, Array

m = last(:models, :duration => {:$ne => 6})
is m, BSON::Document

m = all(:models, :duration => {:$gt => 6})
is m, Array
