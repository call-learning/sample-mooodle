<?php

namespace local_ldap;

use core\event\user_loggedin;
use local_ldap\task\adhoctest_task;

class observer {
    static function user_has_logged_in(user_loggedin $event) {
        $task = new adhoctest_task();
        $task->set_custom_data($event);
        \core\task\manager::queue_adhoc_task($task);
    }
}
