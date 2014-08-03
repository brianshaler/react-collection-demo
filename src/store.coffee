{EventEmitter} = require 'events'

class Store extends EventEmitter
  items: []
  itemsById: {}

  saveItem: (item) =>
    #@items.push item
    @itemsById[item._id] = item
    @emit 'update', item

stores = {}
module.exports = (name = 'default') ->
  stores[name] = stores[name] ? new Store()
