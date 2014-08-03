{EventEmitter} = require 'events'

class Collection extends EventEmitter
  constructor: (@store, @url) ->
    @ids = []
    @store.on 'update', @saveItem

  process: (results) =>
    @ids = results.map (item) -> item._id
    for item in results
      @store.saveItem item

  saveItem: (item) =>
    if -1 < @ids.indexOf item._id
      @emit 'save', item

module.exports = Collection
