<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Notification_model extends CI_Model
{

    public $current_session;

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * This funtion takes id as a parameter and will fetch the record.
     * If id is not provided, then it will fetch all the records form the table.
     * @param int $id
     * @return mixed
     */
    public function get($id = null)
    {
        $userdata = $this->customlib->getUserData();
        $role_id  = $userdata["role_id"];
        $sql      = "SELECT * from send_notification  JOIN (SELECT send_notification_id, GROUP_CONCAT(role_id) as roles  FROM notification_roles  group by send_notification_id) as notification_roles on notification_roles.send_notification_id = send_notification.id ";
        if ($id != null) {
            $sql .= "where send_notification.id =" . $id;
        }

        $query = $this->db->query($sql);
        if ($id != null) {
            return $query->row_array();
        } else {
            return $query->result_array();
        }
    }

    public function getRole($arr)
    {
        $query = $this->db->where_in("id", $arr)->get("roles");
        return $query->result_array();
    }

    public function getUnreadStaffNotification($staffid = null, $role_id = null)
    {

        $sql   = "select send_notification.* from send_notification INNER JOIN notification_roles on notification_roles.send_notification_id = send_notification.id left JOIN read_notification on read_notification.staff_id=" . $this->db->escape($staffid) . " and read_notification.notification_id = send_notification.id WHERE send_notification.visible_staff='yes' and read_notification.id IS NULL and notification_roles.role_id=" . $this->db->escape($role_id) . " order by send_notification.id desc";
        $query = $this->db->query($sql);
        return $query->result();
    }

    /**
     * This function will delete the record based on the id
     * @param $id
     */
    public function remove($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('send_notification');
    }

    /**
     * This function will take the post data passed from the controller
     * If id is present, then it will do an update
     * else an insert. One function doing both add and edit.
     * @param $data
     */
    public function add($data)
    {
        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('send_notification', $data);
        } else {
            $this->db->insert('send_notification', $data);
            return $this->db->insert_id();
        }
    }

    public function insertBatch($data, $staff_roles, $delete_array = array())
    {
        $this->db->trans_start();
        $this->db->trans_strict(false);
        if (isset($data['id'])) {
            $insert_id = $data['id'];
            $this->db->where('id', $data['id']);
            $this->db->update('send_notification', $data);
        } else {
            $this->db->insert('send_notification', $data);
            $insert_id = $this->db->insert_id();
        }
        if (!empty($staff_roles)) {
            foreach ($staff_roles as $stf_role_key => $stf_role_value) {
                $staff_roles[$stf_role_key]['send_notification_id'] = $insert_id;
            }
            $this->db->insert_batch('notification_roles', $staff_roles);
        }
        if (!empty($delete_array)) {
            $this->db->where('send_notification_id', $insert_id);
            $this->db->where_in('role_id', $delete_array);
            $this->db->delete('notification_roles');
        }

        $this->db->trans_complete();
        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();
            return false;
        } else {
            $this->db->trans_commit();
            return true;
        }
    }


    public function updateStatusforStaff($notification_id, $staff_id)
    {
        $this->db->where('notification_id', $notification_id);
        $this->db->where('parent_id', $staff_id);
        $q = $this->db->get('read_notification');
        if ($q->num_rows() > 0) {
            return true;
        } else {
            $data = array(
                'notification_id' => $notification_id,
                'staff_id'        => $staff_id,
            );
            $this->db->insert('read_notification', $data);
        }
    }

    public function addSystemNotification($data)
    {
        if (isset($data["id"])) {
            $this->db->where("id", $data["id"])->update("system_notification", $data);
        } else {
            $this->db->insert("system_notification", $data);

        }
    }

    public function getSystemNotification($limit = '', $start = '')
    {
        $userdata   = $this->customlib->getUserData();
        $userid     = $userdata["id"];
        $role_id    = $userdata["role_id"];
        $role_query = $this->db->select("roles.name")
            ->where("id", $role_id)
            ->get("roles");
        $result = $role_query->row_array();
        $role   = $result["name"];
        if ($role_id != 7) {
            $this->db->where(array('system_notification.notification_for' => $role, 'system_notification.receiver_id' => $userid));
        } else {
            $this->db->where(array('system_notification.notification_for' => 'Super Admin', 'system_notification.receiver_id' => ''));
        }
        if ((!empty($limit)) && ((!empty($start) || ($start >= 0)))) {
            $this->db->limit($limit, $start);
        }

        $query = $this->db->select("system_notification.*,read_systemnotification.is_active as readdone")
            ->join('read_systemnotification', "system_notification.id = read_systemnotification.notification_id", "left")
            ->order_by('system_notification.id', 'desc')
            ->group_by('system_notification.id')
            ->get("system_notification");
        return $query->result_array();
    }

    public function getPatientSystemNotification($limit = '', $start = '')
    {
        $patient_data = $this->session->userdata('patient');
        $userid       = $patient_data["patient_id"];
        if ((!empty($limit)) && ((!empty($start) || ($start >= 0)))) {
            $this->db->limit($limit, $start);
        }

        $query = $this->db->select("system_notification.*,read_systemnotification.is_active as read")
            ->join('read_systemnotification', "system_notification.id = read_systemnotification.notification_id", "left")
            ->where(array('system_notification.notification_for' => "Patient", 'system_notification.receiver_id' => $userid))->order_by('id', 'desc')
            ->get("system_notification");

        return $query->result_array();
    }

    public function getUnreadNotification()
    {
        $userdata = $this->customlib->getUserData();
        $userid   = $userdata["id"];
        $role_id  = $userdata["role_id"];
        $data     = array();

        $role_query = $this->db->select("roles.name")
            ->where("id", $role_id)
            ->get("roles");
        $result = $role_query->row_array();
        $role   = $result["name"];

        if ($role_id != 7) {
            $this->db->where(array('notification_for' => $role, 'receiver_id' => $userid));
        } else {
            $this->db->where(array('notification_for' => 'Super Admin', 'receiver_id' => ''));
        }

        $query = $this->db->select("system_notification.*")
            ->where("is_active", "yes")
            ->get("system_notification");
        $result = $query->result_array();
        foreach ($result as $key => $value) {
            $read_query = $this->db->select("read_systemnotification.*")
                ->where("notification_id", $value["id"])
                ->where("receiver_id", $userid)
                ->get("read_systemnotification");

            if ($read_query->num_rows() > 0) {
                unset($result[$key]);
            }
        }
        $data = $result;
        return $data;
    }

    public function getPatientUnreadNotification()
    {
        $patient_data = $this->session->userdata('patient');
        $userid       = $patient_data["patient_id"];
        $data         = array();
        $query        = $this->db->select("system_notification.*")
            ->where(array('notification_for' => "Patient", 'receiver_id' => $userid))
            ->where("is_active", "yes")
            ->get("system_notification");
        $result = $query->result_array();
        foreach ($result as $key => $value) {
            $read_query = $this->db->select("read_systemnotification.*")
                ->where("notification_id", $value["id"])
                ->where("receiver_id", $userid)
                ->get("read_systemnotification");
            if ($read_query->num_rows() > 0) {
                unset($result[$key]);
            }
        }
        $data = $result;
        return $data;
    }

    public function updateReadNotification($data)
    {
        $this->db->insert("read_systemnotification", $data);
    }

    public function getData($table,$where)
    {
        $query = $this->db->select('*')->where($where)->get($table);
        return $query->row_array();
    }

    public function getcreatedByName($id)
    {
        $query = $this->db->select('staff.name,staff.surname')->where("id", $id)->get("staff");
        return $query->row_array();
    }

}
