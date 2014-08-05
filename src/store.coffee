Bacon = require("baconjs").Bacon

class Store
  constructor: ->
    @stream = new Bacon.Bus()

  saveItem: (item) =>
    @stream.push item

module.exports = new Store()
