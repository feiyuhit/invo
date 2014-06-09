<?php

class IndexController extends ControllerBase {

    public function initialize() {
        $this->view->setTemplateAfter('main');
        Phalcon\Tag::setTitle('Welcome');
        parent::initialize();
    }

    public function indexAction() {
        //Setting it by its name
        //Setting it by its name
        if (!$this->request->isPost()) {
            $this->flash->notice('This is a sample application of the Phalcon PHP Framework.
                Please don\'t provide us any personal information. Thanks');
        }
    }

    public function testAction() {

        /**
         * 查询
         */
        //方法1:
        $robots = Robots::find(array(
                "conditions" => " 10",
                "type = '1'",
                "order" => "name desc",
                "limit" => "10"));
        //方法2:
        $robots = Robots::find(array(
                "conditions" => " type = :type: and conditions= :conditions:  ",
                "bind" => array("type" => 1, "conditions" => 10),
                "limit" => 2,
        ));
        echo "There are ", count($robots), "\n";

        /**
         * 数学计算
         */
        $total = Robots::sum(
                array(
                    "column" => "conditions",
                    "conditions" => "type = 1 "
                )
        );
        echo $total . "\n";
        ;
        $group = Robots::sum(
                array(
                    "column" => "conditions",
                    "group" => "type"
                )
        );

        foreach ($group as $row) {
//             var_dump($row);  //注意这里计算之后的结果存储字段事sumatory
            echo "The sum of salaries of the ", $row->type, " is ", $row->sumatory;
        }
        echo "\n";


        /**
         * 写操作
         */
        $robot = new Robots();

        //对象保存操作
        $robot->type = 2;
        $robot->name = "Astro Boy";
        $robot->year = 1952;
        $res = $robot->save();

        //数组操作
        $robot->save(array(
            "type" => "mechanical",
            "name" => "Astro Boy",
            "year" => 1952
        ));

        //数组保存操作
        if (!$res) {
            echo "Umh, We can't store robots right now: \n";
            foreach ($robot->getMessages() as $message) {
                echo $message, "\n";
            }
        } else {
            echo "Great, a new robot was created successfully!";
        }


        exit;

        foreach ($robots as $robot) {
            echo $robot->name, "\n";
        }
        exit;
// Get first 100 virtual robots ordered by name
        $robots = Robots::find(array(
                "type => virtual",
                "order" => "name",
                "limit" => 100
        ));
        foreach ($robots as $robot) {
            echo $robot->name, "\n";
        }
        exit;

//        echo 1;exit;
        $user = Users::find();
        $user = iterator_to_array($user, true);
        var_dump($user);
        exit;
        echo $user[1]->username;
        exit;
        foreach ($user as $u) {
            echo $u->username;
        }
        exit;
        var_dump($user->username);
        exit;
        echo "There are ", count($user), "\n";
        exit;
    }

    public function beforeExecuteRoute($dispatcher) {
        // This is executed before every found action
//        if ($dispatcher->getActionName() == 'test') {
//            file_put_contents("./1.log", "ddd");
//            return false;
//        }
    }

}
