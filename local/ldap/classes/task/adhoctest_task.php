<?php

namespace local_ldap\task;

use core\task\adhoc_task;

class adhoctest_task extends adhoc_task {
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
