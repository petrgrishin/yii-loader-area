<?php
/**
 * @var \PetrGrishin\View\View $this
 * @author Petr Grishin <petr.grishin@grishini.ru>
 */
use PetrGrishin\HtmlTag\HtmlTag;

HtmlTag::create(HtmlTag::TAG_DIV)
    ->attr('id', $containerId = $this->getUniqueIdentifier('container'))
    ->run();

$this->setJsParams(array(
    'containerId' => $containerId,
    'url' => $this->getParam('url')
));