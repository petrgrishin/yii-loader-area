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
    if context and context.onApply
      context.onApply ->
        response.apply()
        load()

  load()

  onApply: (callback) ->
    response.bindApply callback

  reload: ->
    load()
