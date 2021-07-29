<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Smseboyo {

    private $_CI;
    public $user = "";
    public $password = "";
    public $senderId = "";
    public $url = "http://sms.raven.net.in/submitsms.jsp?";
    public $messagetype = "N"; //Type Of Your Message
    public $DReports = "Y"; //Delivery Reports

    function __construct($array) {
        $this->_CI = & get_instance();
        $this->user = $array['username'];
        $this->password = $array['password'];
        $this->senderId = $array['sernderid'];
    }

    function sendSMS($to, $message) {
        $message = urlencode($message);
        $ch = curl_init();
        if (!$ch) {
            die("Couldn't initialize a cURL handle");
        }
        curl_setopt_array($ch, array(
            CURLOPT_URL => $this->url."user=$this->user&key=$this->password&mobile=$to&message=$message&senderid=$this->senderId&accusage=1",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
          ));
          $response = curl_exec($ch);
        if (curl_errno($ch))
            echo 'curl error : ' . curl_error($ch);
        if (empty($ret)) {
// some kind of an error happened
            die(curl_error($ch));
            curl_close($ch); // close cURL handler
        } else {
            $info = curl_getinfo($ch);
            curl_close($ch); // close cURL handler
            //echo "Message Sent Succesfully" ;
            return true;
        }
    }

}

?>