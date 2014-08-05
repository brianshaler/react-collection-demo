class Collection
  constructor: (@store) ->
    @ids = []
    @stream = @store.stream.filter @filter

  filter: (item) =>
    @ids.some (id) -> id == item._id

  process: (results) =>
    @ids = results.map (item) -> item._id
    for item in results
      @store.saveItem item


module.exports = Collection
