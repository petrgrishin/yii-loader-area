App.register "{{id}}", (params, scope, widgets) ->
  $container = scope.$id params["containerId"]
  response = scope.createResponse()
  loader = scope.createLoader response

  load = ->
    loader.pull params["url"]

  response.bindLoad ->
    $container.html @getContent()

  response.bindContext ->
    context = @getContext()
    if context and context.bindApply
      context.bindApply ->
        response.triggerApply()
        load()

  load()

  bindApply: (callback) ->
    response.bindApply callback

  reload: ->
    load()
