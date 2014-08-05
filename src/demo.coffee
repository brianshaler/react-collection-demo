React = require 'react'

{div, span} = React.DOM

Collection = require './collection'
Store = require './store'

ItemList = require './itemlist'

React.renderComponent ItemList(collection: window.collection1 = new Collection Store), document.getElementById 'list1'
React.renderComponent ItemList(collection: window.collection2 = new Collection Store), document.getElementById 'list2'

btn1 = document.getElementById 'btn1'
btn1.addEventListener 'click', (e) ->
  e.preventDefault()
  collection1.process [{_id: 'a', time: 1}, {_id: 'b', time: 1}]
  false

btn2 = document.getElementById 'btn2'
btn2.addEventListener 'click', (e) ->
  e.preventDefault()
  collection2.process [{_id: 'b', time: 2}, {_id: 'c', time: 2}]
  false
