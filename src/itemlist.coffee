React = require 'react'
{div} = React.DOM

Item = require './item'

ItemList = React.createClass
  getInitialState: ->
    items: []

  saveItem: (newItem) ->
    items = @state.items
    for item, i in items
      if item._id == newItem._id
        items[i] = newItem
        return @setState items: items
    items.push newItem
    @setState items: items

  componentDidMount: ->
    @unsubscribe = @props.collection.stream.onValue @saveItem

  componentWillUnmount: ->
    @unsubscribe()

  render: ->
    if @state.items.length == 0
      return div {className: 'list-empty'}, 'no items'
    children = @state.items.map (item) ->
      Item
        item: item
        key: item._id
    div {}, children

module.exports = ItemList
