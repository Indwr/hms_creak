<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class dashboard extends Patient_Controller
{

    public $school_name;
    public $school_setting;
    public $setting;
    public $payment_method;
    public $patient_data;

    public function __construct()
    {
        parent::__construct();
        $this->payment_method = $this->paymentsetting_model->getActiveMethod();
        $this->patient_data   = $this->session->userdata('patient');
        $this->config->load("payroll");
        $this->load->library('Enc_lib');
        $this->appointment_status = $this->config->item('appointment_status');
        $this->marital_status     = $this->config->item('marital_status');
        $this->payment_mode       = $this->config->item('payment_mode');
        $this->search_type        = $this->config->item('search_type');
        $this->blood_group        = $this->config->item('bloodgroup');
        $this->load->model('conferencehistory_model');
        $this->load->model('conference_model');
        $this->charge_type        = $this->customlib->getChargeMaster();
        $data["charge_type"]      = $this->charge_type;
        $this->conference_setting = $this->setting_model->getzoomsetting();
    }

    public function index()
    {
        $id                = $this->patient_data['patient_id'];
        $data["id"]        = $id;
        $doctors           = $this->staff_model->getStaffbyrole(3);
        $data["doctors"]   = $doctors;
        $result            = array();
        $diagnosis_details = array();
        $opd_details       = array();
        $timeline_list     = array();
        if (!empty($id)) {
            $result = $this->patient_model->getDetails($id);
            if (empty($result)) {
                $result = $this->patient_model->getDataAppoint($id);
            }
            $opd_details          = $this->patient_model->getOPDetails($id);
            $diagnosis_details    = $this->patient_model->getDiagnosisDetails($id);
            $timeline_list        = $this->timeline_model->getPatientTimeline($id, $timeline_status = 'yes');
            $prescription_details = $this->prescription_model->getPatientPrescription($id);
        }
        foreach ($opd_details as $key => $opdvalue) {
            $data['opdconferences'] = $this->conference_model->getconfrencebyopd($opdvalue['staff_id'], $id);
        }
        $data["result"]              = $result;
        $data["diagnosis_detail"]    = $diagnosis_details;
        $data["prescription_detail"] = $prescription_details;
        $data["opd_details"]         = $opd_details;
        $data["timeline_list"]       = $timeline_list;
        $this->load->view("layout/patient/header");
        $this->load->view("patient/profile", $data);
        $this->load->view("layout/patient/footer");
    }

    public function profile()
    {
        $this->session->set_userdata('top_menu', 'profile');
        $this->index();
    }

    public function download($doc)
    {
        $this->load->helper('download');
        $filepath = "./uploads/pathology_report/" . $doc;
        $data     = file_get_contents($filepath);
        force_download($doc, $data);
    }

    public function getDetails()
    {

        $id      = $this->input->post("patient_id");
        $opdid   = $this->input->post("opd_id");
        $visitid = $this->input->post("visitid");
        $result  = $this->patient_model->getDetails($id, $opdid);
        if ((!empty($visitid))) {
            $result = $this->patient_model->getpatientDetailsByVisitId($id, $visitid);
        }
        if ($result['symptoms']) {
            $result['symptoms'] = nl2br($result['symptoms']);
        }
        $appointment_date           = date($this->customlib->getSchoolDateFormat(true, true), strtotime($result['appointment_date']));
        $result["appointment_date"] = $appointment_date;
        echo json_encode($result);
    }

    public function appointment()
    {
        $this->session->set_userdata('top_menu', 'myprofile');
        $id                         = $this->patient_data['patient_id'];
        $data["id"]                 = $id;
        $result                     = $this->patient_model->getDataAppoint($id);
        $data["result"]             = $result;
        $doctors                    = $this->staff_model->getStaffbyrole(3);
        $data["doctors"]            = $doctors;
        $specialist                 = $this->staff_model->getSpecialist();
        $data["specialist"]         = $specialist;
        $data["appointment_status"] = $this->appointment_status;
        $data['resultlist']         = $this->patient_model->search($id);
        $this->load->view("layout/patient/header");
        $this->load->view("patient/appointment", $data);
        $this->load->view("layout/patient/footer");
    }

    public function getdoctor() {
        $spec_id = $this->input->post('id');
        $active = $this->input->post('active');
        $result = $this->staff_model->getdoctorbyspecilist($spec_id);
        echo json_encode($result);
    }

    public function bloodBankStatus()
    {
        $data['bloodGroup'] = $this->bloodbankstatus_model->getBloodGroup();
        $this->load->view("layout/patient/header");
        $this->load->view("patient/bloodBankStatus", $data);
        $this->load->view("layout/patient/footer");
    }

    public function bloodbank()
    {
        $this->session->set_userdata('top_menu', 'blood_bank');
        $patient_id         = $this->patient_data['patient_id'];
        $data["id"]         = $patient_id;
        $data['resultlist'] = $this->bloodbankstatus_model->getBloodbank($patient_id);
        $this->load->view("layout/patient/header");
        $this->load->view("patient/bloodbank", $data);
        $this->load->view("layout/patient/footer");
    }

    public function liveconsult()
    {
        $this->session->set_userdata('top_menu', 'live_consult');
        $patient_id          = $this->patient_data['patient_id'];
        $data["id"]          = $patient_id;
        $data['conferences'] = $this->conference_model->getconfrencebypatient($patient_id);
        $this->load->view("layout/patient/header");
        $this->load->view("patient/liveconsult", $data);
        $this->load->view("layout/patient/footer");
    }

    public function getlivestatus()
    {
        $this->form_validation->set_rules('id', $this->lang->line('id'), 'required|trim|xss_clean');
        if ($this->form_validation->run() == false) {
            $data = array(
                'id' => form_error('id'),
            );
            $array = array('status' => 'fail', 'error' => $data);
            echo json_encode($array);
        } else {
            $conference_id              = $this->input->post('id');
            $live                       = $this->conference_model->get($conference_id);
            $data['conference_setting'] = $this->conference_setting;
            if ($live->api_type == "global") {
                $zoomsetting = $this->setting_model->getzoomsetting();
                if (!empty($zoomsetting)) {
                    $zoom_api_key    = $zoomsetting->zoom_api_key;
                    $zoom_api_secret = $zoomsetting->zoom_api_secret;
                }
            } else {
                $staff           = $this->staff_model->get($live->created_id);
                $zoom_api_key    = $staff['zoom_api_key'];
                $zoom_api_secret = $staff['zoom_api_secret'];
            }
            $params = array(
                'zoom_api_key'    => $zoom_api_key,
                'zoom_api_secret' => $zoom_api_secret,
            );
            $this->load->library('zoom_api', $params);
            $meetingID               = json_decode($live->return_response)->id;
            $api_Response            = $this->zoom_api->getMeeting($meetingID);
            $data['api_Response']    = $api_Response;
            $staff_id                = $this->customlib->getStaffID();
            $data['logged_staff_id'] = $staff_id;
            $data['live']            = $live;
            $data['live_url']        = json_decode($live->return_response);
            $data['page']            = $this->load->view('patient/_livestatus', $data, true);
            $array                   = array('status' => '1', 'page' => $data['page']);
            echo json_encode($data);
            //=====
        }
    }

    public function join($id)
    {
        $zoom_api_key    = "";
        $zoom_api_secret = "";
        $leaveUrl        = "patient/dashboard/liveconsult";
        $live            = $this->conference_model->get($id);
        if ($live->api_type == "global") {
            $zoomsetting = $this->setting_model->getzoomsetting();
            if (!empty($zoomsetting)) {
                $zoom_api_key    = $zoomsetting->zoom_api_key;
                $zoom_api_secret = $zoomsetting->zoom_api_secret;
            }
        } else {
            $staff           = $this->staff_model->get($live->created_id);
            $zoom_api_key    = $staff['zoom_api_key'];
            $zoom_api_secret = $staff['zoom_api_secret'];
        }
        $meetingID                = json_decode($live->return_response)->id;
        $data['zoom_api_key']     = $zoom_api_key;
        $data['zoom_api_secret']  = $zoom_api_secret;
        $data['meetingID']        = $meetingID;
        $data['meeting_password'] = $live->password;
        $data['leaveUrl']         = $leaveUrl;
        $data['title']            = $live->title;
        $data['host']             = ($live->create_for_surname == "") ? $live->create_for_name : $live->create_for_name . " " . $live->create_for_surname;
        $data['name']             = $this->customlib->getPatientSessionUserName();
        $patient_id               = $this->customlib->getPatientSessionUserID();
        $data_insert              = array(
            'conference_id' => $id,
            'patient_id'    => $patient_id,
        );

        $this->conferencehistory_model->updatehistory($data_insert, 'patient');
        $this->load->view('patient/join', $data);
    }

    public function add_history()
    {

        $this->form_validation->set_rules('id', $this->lang->line('id'), 'required|trim|xss_clean');

        if ($this->form_validation->run() == false) {
            $data = array(
                'id' => form_error('id'),
            );
            $array = array('status' => 'fail', 'error' => $data);
            echo json_encode($array);
        } else {
            $patient_id  = $this->customlib->getPatientSessionUserID();
            $data_insert = array(
                'conference_id' => $this->input->post('id'),
                'patient_id'    => $patient_id,
            );

            $this->conferencehistory_model->updatehistory($data_insert, 'patient');
            $array = array('status' => 1, 'error' => '');
            echo json_encode($array);
        }
    }

    public function getBillDetailsBloodbank($id)
    {
        $data['id'] = $id;
        if (isset($_POST['print'])) {
            $data["print"] = 'yes';
        } else {
            $data["print"] = 'no';
        }
        $print_details         = $this->printing_model->get('', 'pharmacy');
        $data["print_details"] = $print_details;
        $result                = $this->bloodbankstatus_model->getBillDetailsBloodbank($id);
        $data['result']        = $result;
        $this->load->view('patient/printBillBloodbank', $data);
    }

    public function bookAppointment()
    {
        $this->form_validation->set_rules('date', $this->lang->line("date"), 'required');
        $this->form_validation->set_rules('message', $this->lang->line("message"), 'required');
        $this->form_validation->set_rules('doctor', $this->lang->line("doctor"), 'required');
        $this->form_validation->set_rules('live_consult', $this->lang->line("live_consult"), 'required');
        $this->form_validation->set_rules('appointment_status', $this->lang->line("appointment") . " " . $this->lang->line("status"), 'required');
        if ($this->form_validation->run() == false) {
            $msg = array(
                'date'               => form_error('date'),
                'patient_name'       => form_error('patient_name'),
                'mobileno'           => form_error('mobileno'),
                'doctor'             => form_error('doctor'),
                'message'            => form_error('message'),
                'appointment_status' => form_error('appointment_status'),
                'live_consult'       => form_error('live_consult'),
            );
            $array = array('status' => 'fail', 'error' => $msg, 'message' => '');
        } else {
            $patient_id   = $this->input->post('patient_id');
            $patient_name = $this->input->post('patient_name');
            $gender       = $this->input->post('gender');
            $email        = $this->input->post('email');
            $mobileno     = $this->input->post('mobileno');
            $date         = $this->input->post('date');
            $appointment  = array(
                'patient_id'         => $patient_id,
                'date'               => date("Y-m-d H:i:s", $this->customlib->datetostrtotime($date)),
                'patient_name'       => $patient_name,
                'gender'             => $gender,
                'email'              => $email,
                'mobileno'           => $mobileno,
                'doctor'             => $this->input->post('doctor'),
                'message'            => $this->input->post('message'),
                'live_consult'       => $this->input->post('live_consult'),
                'source'             => 'Online',
                'appointment_status' => $this->input->post('appointment_status'),
            );

            $this->appointment_model->add($appointment);
            $array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
        }
        echo json_encode($array);
    }

    public function bill()
    {
        $this->session->set_userdata('top_menu', 'pharmacy');
        $patient_id               = $this->patient_data['patient_id'];
        $data["id"]               = $patient_id;
        $data['resultlist']       = $this->pharmacy_model->getBillBasicPat($patient_id);
        $data['medicineCategory'] = $this->medicine_category_model->getMedicineCategoryPat();
        $data['medicineName']     = $this->pharmacy_model->getMedicineNamePat();
        $patients                 = $this->patient_model->getPatientListallPat();
        $data["patients"]         = $patients;
        $print_details            = $this->printing_model->get('', 'pharmacy');
        $data["print_details"]    = $print_details;
        $data["marital_status"]   = $this->marital_status;
        $data["blood_group"]      = $this->blood_group;
        $this->load->view('layout/patient/header');
        $this->load->view('patient/pharmacyBill.php', $data);
        $this->load->view('layout/patient/footer');
    }

    public function ambulance()
    {
        $this->session->set_userdata('top_menu', 'ambulance');
        $patient_id         = $this->patient_data['patient_id'];
        $data["id"]         = $patient_id;
        $resultlist         = $this->vehicle_model->getCallAmbulancepat($patient_id);
        $data['resultlist'] = $resultlist;
        $this->load->view('layout/patient/header');
        $this->load->view('patient/ambulance.php', $data);
        $this->load->view('layout/patient/footer');
    }

    public function getBillDetailsAmbulance($id)
    {
        $data['id'] = $id;
        if (isset($_POST['print'])) {
            $data["print"] = 'yes';
        } else {
            $data["print"] = 'no';
        }
        $print_details         = $this->printing_model->get('', 'ambulance');
        $data["print_details"] = $print_details;
        $result                = $this->vehicle_model->getBillDetailsAmbulance($id);
        $data['result']        = $result;
        $this->load->view('patient/printBillAmbulance', $data);
    }

    public function patientipddetails()
    {
        $patient_id         = $this->patient_data['patient_id'];
        $data['resultlist'] = $this->patient_model->patientipddetails($patient_id);
        $i                  = 0;
        foreach ($data['resultlist'] as $key => $value) {
            $charges                               = $this->patient_model->getCharges($value["id"], $value["ipdid"]);
            $data['resultlist'][$i]["charges"]     = $charges['charge'];
            $payment                               = $this->patient_model->getPayment($value["id"], $value["ipdid"]);
            $data['resultlist'][$i]["payment"]     = $payment['payment'];
            $othercharge                           = $this->patient_model->getOthercharge($value["id"], $value["ipdid"]);
            $data['resultlist'][$i]["othercharge"] = $othercharge['othercharge'];
            $i++;
        }
        $data['organisation'] = $this->organisation_model->get();
        $this->load->view("layout/patient/header");
        $this->load->view('patient/patientipddetails.php', $data);
        $this->load->view("layout/patient/footer");
    }

    public function getpatientidbyipd()
    {
        $ipdid          = $this->input->post('ipdid');
        $result         = $this->patient_model->getpatientidbyipd($ipdid);
        $data["result"] = $result;
    }

    public function ipdprofile($ipdid = '', $pres_id = '')
    {
        $this->session->set_userdata('top_menu', 'ipdprofile');
        $id = $this->patient_data['patient_id'];
        if ($ipdid == '') {
            $ipdresult = $this->patient_model->search_ipd_patients($searchterm = '', $active = 'yes', $discharged = 'no', $id);
            $ipdid     = $ipdresult["ipdid"];
        }

        $ipdnpres_data          = $this->session->flashdata('ipdnpres_data');
        $data['ipdnpres_data']  = $ipdnpres_data;
        $data['payment_method'] = $this->payment_method;
        $data["id"]             = $id;
        $data["ipdid"]          = $ipdid;
        $data["marital_status"] = $this->marital_status;
        $data["payment_mode"]   = $this->payment_mode;
        $data["bloodgroup"]     = $this->blood_group;
        $data['organisation']   = $this->organisation_model->get();
        $doctors                = $this->staff_model->getStaffbyrole(3);
        $data["doctors"]        = $doctors;
        $result                 = array();
        $diagnosis_details      = array();
        $opd_details            = array();
        $timeline_list          = array();
        $charges                = array();
        $data['ipdconferences'] = $this->conference_model->getconfrencebyipd($doctors, $id, $ipdid);
        if (!empty($id)) {
            $status = $this->patient_model->getStatus($id);
            $result = $this->patient_model->getIpdDetails($id, $ipdid, $status["is_active"]);
            if (!empty($result)) {
                $diagnosis_details           = $this->patient_model->getDiagnosisDetails($id);
                $timeline_list               = $this->timeline_model->getPatientTimeline($id, $timeline_status = 'yes');
                $prescription_details        = $this->prescription_model->getIpdPrescription($ipdid);
                $consultant_register         = $this->patient_model->getPatientConsultant($id, $ipdid);
                $charges                     = $this->charge_model->getCharges($id, $ipdid);
                $paymentDetails              = $this->payment_model->paymentDetails($id, $ipdid);
                $paid_amount                 = $this->payment_model->getPaidTotal($id, $ipdid);
                $data["paid_amount"]         = $paid_amount["paid_amount"];
                $balance_amount              = $this->payment_model->getBalanceTotal($id, $ipdid);
                $data["balance_amount"]      = $balance_amount["balance_amount"];
                $data["payment_details"]     = $paymentDetails;
                $data["consultant_register"] = $consultant_register;
                $data["result"]              = $result;
                $data["diagnosis_detail"]    = $diagnosis_details;
                $data["prescription_detail"] = $prescription_details;
                $data["opd_details"]         = $opd_details;
                $data["timeline_list"]       = $timeline_list;
                $data["charge_type"]         = $this->charge_type;
                $data["charges"]             = $charges;
            } else {
                redirect('patient/dashboard/patientipddetails');
                $data = array();
            }
        }
        $this->load->view("layout/patient/header");
        $this->load->view("patient/ipdProfile", $data);
        $this->load->view("layout/patient/footer");
    }

    public function getBillDetailsPharma($id)
    {
        $data['id'] = $id;
        if (isset($_POST['print'])) {
            $data["print"] = 'yes';
        } else {
            $data["print"] = 'no';
        }
        $print_details         = $this->printing_model->get('', 'pharmacy');
        $data["print_details"] = $print_details;
        $result                = $this->pharmacy_model->getBillDetailsPharma($id);
        $data['result']        = $result;
        $detail                = $this->pharmacy_model->getAllBillDetailsPharma($id);
        $data['detail']        = $detail;
        $this->load->view('patient/printBillPharma', $data);
    }

    public function getsummaryDetails()
    {
        $id                    = $this->input->post("id");
        $ipdid                 = $this->input->post("ipdid");
        $data['id']            = $id;
        $print_details         = $this->printing_model->get('', 'summary');
        $data["print_details"] = $print_details;
        $data['id']            = $id;
        if (isset($_POST['print'])) {
            $data["print"] = 'yes';
        } else {
            $data["print"] = 'no';
        }

        $result         = $this->patient_model->getIpdDetails($id, $ipdid);
        $data['result'] = $result;
        $this->load->view('patient/printSummary', $data);
    }

    public function getsummaryopdDetails()
    {
        $id                    = $this->input->post("id");
        $opdid                 = $this->input->post("opdid");
        $data['id']            = $id;
        $print_details         = $this->printing_model->get('', 'summary');
        $data["print_details"] = $print_details;
        $data['id']            = $id;
        if (isset($_POST['print'])) {
            $data["print"] = 'yes';
        } else {
            $data["print"] = 'no';
        }

        $result         = $this->patient_model->getDetails($id, $opdid);
        $data['result'] = $result;
        $this->load->view('patient/printopdSummary', $data);
    }

    public function getDetailsOt()
    {
        $id     = $this->input->post("patient_id");
        $result = $this->operationtheatre_model->getDetails($id);
        if (($result['patient_type'] == 'Inpatient') || ($result['patient_type'] == 'Outpatient')) {
            $opd_ipd_no           = $this->operationtheatre_model->getopdipdDetails($id, $result['patient_type']);
            $result['opd_ipd_no'] = $opd_ipd_no;
        }
        $result['admission_date'] = date($this->customlib->getSchoolDateFormat(true, true), strtotime($result['admission_date']));
        $result['date']           = date($this->customlib->getSchoolDateFormat(true, true), strtotime($result['date']));
        echo json_encode($result);
    }

    public function getBillDetailsOt($id)
    {
        $data['id'] = $id;
        if (isset($_POST['print'])) {
            $data["print"] = 'yes';
        } else {
            $data["print"] = 'no';
        }
        $print_details         = $this->printing_model->get('', 'ot');
        $data["print_details"] = $print_details;
        $result                = $this->operationtheatre_model->getBillDetailsOt($id);
        $data['result']        = $result;
        $detail                = $this->operationtheatre_model->getAllBillDetailsOt($id);
        $data['detail']        = $detail;
        $this->load->view('patient/printBillOt', $data);
    }

    public function otsearch()
    {
        $this->session->set_userdata('top_menu', 'operation_theatre');
        $patient_id              = $this->patient_data['patient_id'];
        $data["id"]              = $patient_id;
        $doctors                 = $this->staff_model->getStaffbyrole(3);
        $data["doctors"]         = $doctors;
        $patients                = $this->patient_model->getPatientListallPat();
        $data["patients"]        = $patients;
        $userdata                = $this->customlib->getUserData();
        $role_id                 = $userdata['role_id'];
        $data['charge_category'] = $this->operationtheatre_model->getChargeCategory();
        $data['resultlist']      = $this->operationtheatre_model->searchFullTextPat($patient_id);
        $data['organisation']    = $this->organisation_model->get();
        $this->load->view('layout/patient/header');
        $this->load->view('patient/otsearch.php', $data);
        $this->load->view('layout/patient/footer');
    }

    public function radioreport()
    {
        $this->session->set_userdata('top_menu', 'radiology');
        $patient_id      = $this->patient_data['patient_id'];
        $data["id"]      = $patient_id;
        $doctors         = $this->staff_model->getStaffbyrole(3);
        $data["doctors"] = $doctors;
        $result          = $this->radio_model->getTestReportBatchRadio($patient_id);
        $data["result"]  = $result;
        $this->load->view('layout/patient/header');
        $this->load->view('patient/radioBill.php', $data);
        $this->load->view('layout/patient/footer');
    }

    public function getBillDetailsPatho($id, $parameter_id)
    {
        $data['id'] = $id;
        if (isset($_POST['print'])) {
            $data["print"] = 'yes';
        } else {
            $data["print"] = 'no';
        }
        $print_details            = $this->printing_model->get('', 'pathology');
        $data["print_details"]    = $print_details;
        $result                   = $this->pathology_model->getBillDetails($id);
        $data['result']           = $result;
        $detail                   = $this->pathology_model->getAllBillDetails($id);
        $data['detail']           = $detail;
        $parametername            = $this->pathology_category_model->getpathoparameter();
        $data["parametername"]    = $parametername;
        $parameterdetails         = $this->pathology_category_model->getparameterDetailsforpatient($id);
        $data['parameterdetails'] = $parameterdetails;
        $this->load->view('patient/printBillPatho', $data);
    }

    public function getReportDetailsPatho($id, $parameter_id)
    {
        $data['id'] = $id;
        if (isset($_POST['print'])) {
            $data["print"] = 'yes';
        } else {
            $data["print"] = 'no';
        }
        $print_details            = $this->printing_model->get('', 'pathology');
        $data["print_details"]    = $print_details;
        $result                   = $this->pathology_model->getBillDetails($id);
        $data['result']           = $result;
        $detail                   = $this->pathology_model->getAllBillDetails($id);
        $data['detail']           = $detail;
        $parametername            = $this->pathology_category_model->getpathoparameter();
        $data["parametername"]    = $parametername;
        $parameterdetails         = $this->pathology_category_model->getparameterDetailsforpatient($id);
        $data['parameterdetails'] = $parameterdetails;
        $this->load->view('patient/printReportPatho', $data);
    }

    public function getBillDetailsRadio($id, $parameter_id)
    {
        $data['id'] = $id;
        if (isset($_POST['print'])) {
            $data["print"] = 'yes';
        } else {
            $data["print"] = 'no';
        }
        $print_details            = $this->printing_model->get('', 'radiology');
        $data["print_details"]    = $print_details;
        $result                   = $this->radio_model->getBillDetails($id);
        $data['result']           = $result;
        $detail                   = $this->radio_model->getAllBillDetails($id);
        $data['detail']           = $detail;
        $parametername            = $this->radio_model->getpathoparameter();
        $data["parametername"]    = $parametername;
        $parameterdetails         = $this->radio_model->getparameterDetailsforpatient($id);
        $data['parameterdetails'] = $parameterdetails;
        $this->load->view('patient/printBillRadio', $data);
    }

    public function getReportDetailsRadio($id, $parameter_id)
    {

        $data['id'] = $id;
        if (isset($_POST['print'])) {
            $data["print"] = 'yes';
        } else {
            $data["print"] = 'no';
        }
        $print_details            = $this->printing_model->get('', 'radiology');
        $data["print_details"]    = $print_details;
        $result                   = $this->radio_model->getBillDetails($id);
        $data['result']           = $result;
        $detail                   = $this->radio_model->getAllBillDetails($id);
        $data['detail']           = $detail;
        $parametername            = $this->radio_model->getpathoparameter();
        $data["parametername"]    = $parametername;
        $parameterdetails         = $this->radio_model->getparameterDetailsforpatient($id);
        $data['parameterdetails'] = $parameterdetails;
        $this->load->view('patient/printReportRadio', $data);
    }

    public function search()
    {
        $this->session->set_userdata('top_menu', 'pathology');
        $patient_id      = $this->patient_data['patient_id'];
        $data["id"]      = $patient_id;
        $doctors         = $this->staff_model->getStaffbyrole(3);
        $data["doctors"] = $doctors;
        $result          = $this->pathology_model->getTestReportBatchPatho($patient_id);
        $data["result"]  = $result;
        $this->load->view('layout/patient/header');
        $this->load->view('patient/pathologyBill.php', $data);
        $this->load->view('layout/patient/footer');
    }

    public function ipdBill()
    {
        $id                      = $this->input->post("patient_id");
        $ipdid                   = $this->input->post("ipdid");
        $data['total_amount']    = $this->input->post("total_amount");
        $data['discount']        = $this->input->post("discount");
        $data['other_charge']    = $this->input->post("other_charge");
        $data['gross_total']     = $this->input->post("gross_total");
        $data['tax']             = $this->input->post("tax");
        $data['net_amount']      = $this->input->post("net_amount");
        $data["print_details"]   = $this->printing_model->get('', 'ipd');
        $status                  = $this->patient_model->getStatus($id);
        $result                  = $this->patient_model->getIpdDetails($id, $ipdid, $status["is_active"]);
        $charges                 = $this->charge_model->getCharges($id, $ipdid);
        $paymentDetails          = $this->payment_model->paymentDetails($id, $ipdid);
        $paid_amount             = $this->payment_model->getPaidTotal($id, $ipdid);
        $balance_amount          = $this->payment_model->getBalanceTotal($id, $ipdid);
        $data["paid_amount"]     = $paid_amount["paid_amount"];
        $data["balance_amount"]  = $balance_amount["balance_amount"];
        $data["payment_details"] = $paymentDetails;
        $data["charges"]         = $charges;
        $data["result"]          = $result;
        $this->load->view("patient/ipdBill", $data);
    }

    public function getConsultantBatch()
    {
        $patient_id     = $this->patient_data['patient_id'];
        $data["id"]     = $patient_id;
        $result         = $this->operationtheatre_model->getConsultantBatchOt($patient_id);
        $data["result"] = $result;
        $this->load->view('patient/patientConsultantDetail', $data);
    }

    public function visitDetails($id, $visitid)
    {
        if (!empty($id)) {
            $result                   = $this->patient_model->getDetails($id);
            $data['result']           = $result;
            $data['visit_id']         = $visitid;
            $opd_details              = $this->patient_model->getOPDetails($id);
            $data['opd_details']      = $opd_details;
            $visit_details            = $this->patient_model->getVisitDetails($id, $visitid);
            $data['visit_details']    = $visit_details;
            $billstatus               = $this->patient_model->getBillstatus($id, $visitid);
            $data["billstatus"]       = $billstatus;
            $revisit_details          = $this->patient_model->getVisitDetailsByOPD($id, $visitid);
            $data['revisit_details']  = $revisit_details;
            $diagnosis_details        = $this->patient_model->getDiagnosisDetails($id);
            $data["diagnosis_detail"] = $diagnosis_details;
            $timeline_list            = $this->timeline_model->getPatientTimeline($id, $timeline_status = '');
            $data["timeline_list"]    = $timeline_list;
            $paymentDetails           = $this->payment_model->opdPaymentDetails($id, $visitid);
            $data["payment_details"]  = $paymentDetails;
            $data['medicineCategory'] = $this->medicine_category_model->getMedicineCategory();
            $data['medicineName']     = $this->pharmacy_model->getMedicineName();
            $charges                  = $this->charge_model->getOPDCharges($id, $visitid);
            $data["charges_detail"]   = $charges;
            $paid_amount              = $this->payment_model->getOPDPaidTotal($id, $visitid);
            $data["paid_amount"]      = $paid_amount["paid_amount"];
            $billpaid_amount          = $this->payment_model->getOPDbillpaid($id, $visitid);
            $data["billpaid_amount"]  = $billpaid_amount["billpaid_amount"];
            $doctors                  = $this->staff_model->getStaffbyrole(3);
            $data["doctors"]          = $doctors;
            $userdata                 = $this->customlib->getUserData();
            $role_id                  = $userdata['role_id'];
            $doctorid                 = "";
            $data["doctor_select"]    = $doctorid;
            $data["marital_status"]   = $this->marital_status;
            $data["payment_mode"]     = $this->payment_mode;
            $data["bloodgroup"]       = $this->blood_group;
            $data["charge_type"]      = $this->charge_type;
            $data["dosage"]           = array();
            $generate          = $this->patient_model->getopdBillInfo($result["id"], $visitid);
            $data["bill_info"] = $generate;
            $this->load->view("layout/patient/header");
            $this->load->view("patient/visitDetails.php", $data);
            $this->load->view("layout/patient/footer"); 
        }
    }

    public function getOPDBill()
    {
        $id                      = $this->patient_data['patient_id'];
        $data["id"]              = $id;
        $data['total_amount']    = $this->input->post("total_amount");
        $data['discount']        = $this->input->post("discount");
        $data['other_charge']    = $this->input->post("other_charge");
        $data['gross_total']     = $this->input->post("gross_total");
        $data['tax']             = $this->input->post("tax");
        $data['net_amount']      = $this->input->post("net_amount");
        $visit_id                = $this->input->post("visit_id");
        $data['visit_id']        = $visit_id;
        $status                  = $this->input->post("status");
        $result                  = $this->patient_model->getDetails($id);
        $charges                 = $this->charge_model->getOPDCharges($id, $visit_id);
        $paymentDetails          = $this->payment_model->opdPaymentDetailspat($id);
        $paid_amount             = $this->payment_model->getOPDPaidTotalPat($id);
        $balance_amount          = $this->payment_model->getOPDBalanceTotal($id);
        $billstatus              = $this->patient_model->getBillstatus($id, $visit_id);
        $data["billstatus"]      = $billstatus;
        $data["paid_amount"]     = $paid_amount["paid_amount"];
        $data["balance_amount"]  = $balance_amount["balance_amount"];
        $data["payment_details"] = $paymentDetails;
        $data["charges"]         = $charges;
        $data["result"]          = $result;
        $this->load->view("patient/opdBill", $data);
    }

    public function download_patient_timeline($timeline_id, $doc)
    {
        $this->load->helper('download');
        $filepath = "./uploads/patient_timeline/" . $doc;
        $data     = file_get_contents($filepath);
        $name     = $doc;
        force_download($name, $data);
    }

    public function report_download($doc)
    {
        $this->load->helper('download');
        $filepath = "./" . $this->uri->segment(4) . "/" . $this->uri->segment(5) . "/" . $this->uri->segment(6);
        $data     = file_get_contents($filepath);
        $name     = $this->uri->segment(6);
        force_download($name, $data);
    }

    public function radio_download($doc)
    {
        $this->load->helper('download');
        $filepath = "./uploads/radiology_report/" . $doc;
        $data     = file_get_contents($filepath);
        force_download($doc, $data);
    }

    public function getIpdDetails()
    {
        $id     = $this->input->post("recordid");
        $ipdid  = $this->input->post("ipdid");
        $active = $this->input->post("active");
        $result = $this->patient_model->getIpdDetails($id, $ipdid, $active);
        if ($result['symptoms']) {
            $result['symptoms'] = nl2br($result['symptoms']);
        }
        $result['date'] = date($this->customlib->getSchoolDateFormat(true, true), strtotime($result['date']));
        echo json_encode($result);
    }

    public function getIpdsummaryDetails()
    {

    }

    public function deleteappointment($id)
    {
        if (!empty($id)) {
            $this->appointment_model->delete($id);
            $json_array = array('status' => 'success', 'error' => '', 'message' => $this->lang->line('success_message'));
        } else {
            $json_array = array('status' => 'fail', 'error' => '', 'message' => '');
        }
        echo json_encode($json_array);
    }

    public function user_language($lang_id)
    {
        $language_name = $this->db->select('languages.language')->from('languages')->where('id', $lang_id)->get()->row_array();
        $student       = $this->session->userdata('patient');
        if (!empty($student)) {
            $this->session->unset_userdata('patient');
        }
        $language_array      = array('lang_id' => $lang_id, 'language' => $language_name['language']);
        $student['language'] = $language_array;
        $this->session->set_userdata('patient', $student);

        $session         = $this->session->userdata('patient');
        $id              = $session['patient_id'];
        $data['lang_id'] = $lang_id;
        $language_result = $this->language_model->set_patientlang($id, $data);
    }
}
