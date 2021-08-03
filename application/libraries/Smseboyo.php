<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Smseboyo {

    private $_CI;
    public $user = "";
    public $password = "";
    public $senderId = "";
    public $url = "http://sms.raven.net.in/sendSMS?";
    public $messagetype = "N"; //Type Of Your Message
    public $DReports = "Y"; //Delivery Reports

    function __construct($array) {
       
        $this->_CI = & get_instance();
        require realpath(APPPATH . '../vendor/autoload.php');
        $this->user = $array['username'];
        $this->password = $array['password'];
        $this->senderId = $array['senderid'];
    }

    function sendSMS($to, $message) {
        $message = urlencode($message);
       
        $client = new \GuzzleHttp\Client();
        $finalurl = $this->url."username=$this->user&message=$message&sendername=$this->senderId&smstype=TRANS&numbers=$to&apikey=$this->password";
        $response = $client->request('GET', $finalurl);
        $responseCode = $response->getStatusCode(); // 200
// echo $response->getHeaderLine('content-type'); // 'application/json; charset=utf8'
// echo $response->getBody(); // '{"id": 1420053, "name": "guzzle", ...}'
        if($responseCode == 200){
            return true;
        }else{
            return false;
        }
    }

}

?>