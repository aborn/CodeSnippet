<?php
  /***
   * INTRO
   *   This class uses to monitor all redis cluster pool
   *
   * DEPENDS
   *  phpredis and iredis
   *
   * VERSION
   *  2014-03-19 1.0
   *
   * AUTHOR
   *  Aborn Jiang
   *
   ***/


require_once '/vagrant_data/data/rediska/library/Rediska.php';
// Initialize Rediska
$rediska = new Rediska();

// Get monitor with 2 minutes timeout
$monitor = $rediska->monitor(60 * 2);

// Get monitor on specified server
// $monitor = $rediska->on('server1')->monitor();

// Get commands
foreach($monitor as $timestamp => $command) {
    print "$timestamp => $command";
}

?>