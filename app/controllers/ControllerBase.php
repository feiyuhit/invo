<?php

class ControllerBase extends Phalcon\Mvc\Controller {

    protected function initialize() {
        Phalcon\Tag::prependTitle('INVO | ');
    }

    protected function forward($uri) {
        $uriParts = explode('/', $uri);
        return $this->dispatcher->forward(
                array(
                    'controller' => $uriParts[0],
                    'action' => $uriParts[1]
                )
        );
    }

    /**
     *
     * 把对象转成数组
     * @param $object 要转的对象$object
     */
    protected function objectToArray($object) {

        $result = array();

        $object = is_object($object) ? get_object_vars($object) : $object;

        foreach ($object as $key => $val) {

            $val = (is_object($val) || is_array($val)) ? objectToArray($val) : $val;

            $result[$key] = $val;
        }

        return $result;
    }

}
