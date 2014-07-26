<?php
/**
 * @author Petr Grishin <petr.grishin@grishini.ru>
 */

namespace PetrGrishin\LoaderArea;


use PetrGrishin\Widget\BaseWidget;

class LoaderAreaWidget extends BaseWidget {
    public $url;

    public function run() {
        $this->render('loaderArea', array(
            'url' => $this->url
        ));
    }
}
