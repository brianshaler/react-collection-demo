# React Collection Demo

Experimenting with [react](http://github.com/facebook/react) to display objects
in multiple lists while storing only the latest version of each item. Item
displays are synced across all lists.

### Views

Views (`src/itemlist.coffee`) contain a list of currently visible items and
subscribe to changes in a Collection.

### Collections

A Collection (`src/collection.coffee`) is responsible for retrieving items and
maintaining a list of IDs (`Item._id`). Collections receive update events for
each item saved in a centralized Store, and filter out events not related to
their current list of IDs.

### Stores

A Store (`src/store.coffee`) contains the latest version of all items of a
given type cached in the browser. When an item is added or updated, it emits an
`update` event.

## Setup

    $ # install dependencies
    $ npm install
    $ # compile js (coffee+browserify)
    $ gulp --require coffee-script/register
    $ # serve html & js files vi port 3000
    $ npm start
    $ # go to http://localhost:3000 and click on the buttons

## TODOs

If a collection updates its list of items and one is no longer present,
it should emit a `remove` event for that `_id` to trigger its removal from
any subscribing Views' `state.items[]`.

Should Collections be responsible for retrieving items via HTTP GET and/or
websocket, *or* should a separate module manage that? GET intervals and socket
sessions should be terminated when there are no longer any views relying on that
collection.

Currently doesn't persist items. What if we want to query for a list of
items by `[_id]`?
