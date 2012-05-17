Template.tasks.tasks = ->
  Tasks.all()

Template.entry.events =
  'submit #new_task': (event) ->
    event.preventDefault()
    last = Tasks.last()

    order = last? && last.order + 1 || 0

    Tasks.insert
      title: $('#task_title').val()
      order: order

    $('#new_task').get(0).reset()

Template.task.events =
  'click .remove': (event) ->
    event.preventDefault()
    Tasks.remove _id: @_id

  'reorder li': (event) ->
    array = $("#tasks").children().toArray().filter (e) -> e.tagName is 'LI'
    order = array.length - array.indexOf(event.target) - 1
    Tasks.update {_id: @_id},
      $set: order: order

Meteor.startup ->
  $('#tasks').sortable
    update: (event) ->
      $(this).children().trigger('reorder')

