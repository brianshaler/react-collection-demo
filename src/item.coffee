React = require 'react'
{div} = React.DOM

Item = React.createClass
  getDefaultProps: ->
    key: '_id'

  render: ->
    div {className: @props.item._id}, "#{@props.item._id}: #{@props.item.time}"

module.exports = Item
