<?php

namespace local_ldap\task;

use core\task\scheduled_task;

class test_task extends scheduled_task {

    public function get_name() {
        return get_string('testtask', 'local_ldap');
    }

    public function execute() {
        mtrace('Hello world !');
        $iteration = get_config('local_ldap', 'testtaskrun');
        if (!$iteration) {
            $iteration = 1;
        }
        set_config('testtaskrun', ++$iteration, 'local_ldap');
        mtrace('Finished !');
    }
}
