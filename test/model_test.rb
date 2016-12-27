test 'Model'

Minimongo.model = true

test 'args'

args = [{:duration => 50}]

m = Model.new
t = m.arg(args)

test 'insert'

Model.insert(:duration => 60)

test 'find'

v = Model.find
is v, Mongo::Collection::View

m = Model.find.first
is m, Model

m = Model.find(:duration => 50).first
is m, Model

m = m.find.first
is m, Model
