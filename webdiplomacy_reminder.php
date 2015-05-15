<?php

if (!isset($argv[1])) {
    echo 'USAGE: php webdiplomacy_reminder.php EMAIL SECONDS "USERNAME" GAME_ID MODE' . "\n\n";
    echo "EMAIL - a valid email address to send notifications to (consider using your phone's sms portal)\n";
    echo "SECONDS - if there are less than this number of seconds remaining before next turn, consider sending an alert\n";
    echo "USERNAME - your web diplomacy username this is case sensitive and should be in quotes if it contains spaces\n";
    echo "GAME_ID - the game_id, look in the URL (future versions should find this for you by looking at your open games)\n";
    echo "MODE - if you type 'TEST' here, it will explain how the script is working with your parameters\n";
    echo "MODE - if you type 'ALWAYS' here, it will send an alert email even if you have already entered moves\n";
    echo "MODE - if you type 'TEST ALWAYS' here, it will run the test in ALWAYS mode\n";
}

$email = $argv[1];
$alert_seconds = $argv[2];
$user_name = $argv[3];
$game_id = $argv[4];

$always_send_index = 5;
$test_mode = false;
if (isset($argv[5]) && $argv[5] == 'TEST') {
    $test_mode = true;
    $always_send_index = 6;
}

$always_send = false;
if (isset($argv[$always_send_index]) && $argv[$always_send_index] == 'ALWAYS') {
    $always_send = true;
}

$url = 'http://webdiplomacy.net/board.php?gameID=' . $game_id . '#gamePanel';
$page = file_get_contents($url);

$time_start = strpos($page, 'timeremaining');
$time_snippet = substr($page, $time_start, 100);
$time_matches = array();
preg_match('/unixtime="(\d+)"/', $time_snippet, $time_matches);

$next_turn_time = $time_matches[1];

$now = time();
$seconds_left = $next_turn_time - time();

$user_start = strpos($page, $user_name);
$user_snippet = substr($page, $user_start - 1000, 1000);
$user_matches = array();
preg_match('/StatusIcon.*alt="(.+?)"/', $user_snippet, $user_matches);
$user_status = $user_matches[1];

if(
    ($seconds_left > 0) && ($seconds_left < $alert_seconds) 
    && ($user_status == 'Not received' || $always_send)
    && $test_mode == false
) {
    echo "sending email\n";
    mail($email, 'ALMOST TIME', 'Enter your moves: ' . $url . "\n your status is: " . $user_status);
}

if ($test_mode) {
    echo "looking for url: $url\n";

    echo "we looked for your username: $user_name\n";
    if (empty($user_status)) {
        echo "but we didn't find it.\n";
    } else {
        echo "and i think we found it, your user status is: $user_status\n";
    }

    if ($always_send) {
        echo "you asked to be emailed regardless of your user status\n";
    } else {
        echo "by default you will only be emailed if your user status == 'Not received'\n";
    }

    echo "looking for unixtimestamp of next turn: $next_turn_time\n";
    echo "next turn is in this many seconds: $seconds_left\n";
    echo "you asked to be alerted if there are less than this many seconds remaining: $alert_seconds\n";
    if ($seconds_left > 0 && $seconds_left < $alert_seconds) {
        if ($user_status == 'Not received') {
            echo "thus we would currently send you an email because of your user_status & the time_remaining\n";
        } elseif ($always_send) {
            echo "thus we would currently send you an email because of your the time_remaining and your request to ALWAYS SEND\n";
        } else {
            echo "thus we would NOT currently send you an email because you already entered moves\n";
        }
    } else {
        echo "thus we would NOT currently send you an email because it's not time yet\n";
    }
}
