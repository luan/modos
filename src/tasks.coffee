Tasks = new Meteor.Collection('tasks')

Tasks.finder = 
  sort:
    order: -1
    time: -1
    
Tasks.all = ->
  Tasks.find {}, Tasks.finder

Tasks.last = ->
  Tasks.findOne {}, Tasks.finder

