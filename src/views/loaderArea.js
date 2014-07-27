/**
 * Author: Petr Grishin <petr.grishin@grishini.ru>
 */
App.register('{{id}}', function(params, scope, widgets) {
    var $container = $('#' + params['containerId']);
    var response = scope.createResponse();
    var loader = scope.createLoader(response);
    var load = function() {
        loader.pull(params['url']);
    };
    response.bindLoad(function() {
        $container.html(this.getContent());
    });
    response.bindApply(function() {
        var context = this.getContext();
        context && context.bindApply && context.bindApply(function() {
            response.apply();
            load();
        });
    });
    load();
    return {
        onApply: function(callback) {
            response.bindApply(callback);
        },
        reload: function() {
            load();
        }
    }
});