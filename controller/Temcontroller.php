<?php

require 'model/TemModel.php';

// m = tên của hàm nằm trong file controller trong thư mục controller
$m = trim($_GET['m'] ?? 'index'); // ham mac dinh trong controller ten la index
$m = strtolower($m); //viết thường tất cả tên hàm

switch($m){
    case 'index';
        index();
    break;

    case 'add';
        Add();
        break;

    case 'handle-add';
        handleAdd();
        break;

        case 'delete';
        handleDelete();
        break;

        case 'edit';
        edit();
        break;

        case 'handle-edit';
        handleEdit();
        break;

    default:
        index();
    break;
}

function handleEdit()
{
    if (isset($_POST['btnSave'])) {

        $id = trim($_GET['id'] ?? null);
        $id = is_numeric($id) ? $id : 0;

        $name = trim($_POST['name'] ?? null);
        $name = strip_tags($name);

        $year = trim($_POST['year'] ?? null);
        $year = strip_tags($year);

        $status = trim($_POST['status'] ?? null);
        $status = $status === '0' || $status === '1' ? $status : 0;

        $_SESSION['error_update_tem'] = [];

        if (empty($name)) {
            $_SESSION['error_update_tem']['name'] = 'Enter name of tem, please';
        } else {
            $_SESSION['error_update_tem']['name'] = null;
        }

        if (empty($year)) {
            $_SESSION['error_update_tem']['year'] = '';
        } else {
            $_SESSION['error_update_tem']['year'] = null;
        }

        $flagCheckingError = false;

        foreach ($_SESSION['error_update_tem'] as $error) {
            if (!empty($error)) {
                $flagCheckingError = true;
                break;
            }
        }

        if (!$flagCheckingError) {
            // No error, proceed with the update
            unset($_SESSION['error_update_tem']);

            $slug = slug_string($name);

            $update = updateTemById($name, $slug, $year, $status, $id);

            if ($update) {
                // Update successful
                header("Location:index.php?c=tem&state=success");
                exit();
            } else {
                // Update failed
                header("Location:index.php?c=tem&m=edit&id={$id}&state=error");
                exit();
            }
        } else {
            // Error found, redirect back to the edit page
            header("Location:index.php?c=tem&m=edit&id={$id}&state=failure");
            exit();
        }
    }
}

function edit()
{
    // phai dang nhpa ms su dung duoc chuc nang nay
    if (!isLoginUser()) {
        header("Location:index.php");
        exit();
    }
    $id = trim($_GET['id'] ?? null);
    $id = is_numeric($id) ? $id : 0;
    $info = getDetailTemById($id); //goi ham trong model
    if(!empty($info)){
        //co dl trong db
        //hien thi giao dien-thong tin chi tiet dl

        require 'view/tem/edit_view.php';
    } else{
        //khong co dl trong db
        //thong bao 1 giao dien loi

        require 'view/error_view.php';
    }
}

function handleDelete(){
    if(!isLoginUser()){
        header("Location:index.php");
        exit();
    }
    $id = trim($_GET['id'] ?? null);
    $id = is_numeric($id) ? $id : 0;
    $delete = deleteTemById($id); //goi ten ham trong model
    if($delete){
        //xoa thanh cong
        header("Location:index.php?c=tem&state_del=success");
    } else{
        //xoa that bai
        header("Location:index.php?c=tem&state_del=failure");
    }

}

function handleAdd(){
    if(isset($_POST['btnSave'])){
        $name = trim($_POST['name'] ?? null);
        $name = strip_tags($name);

        $year = trim($_POST['year'] ?? null);
        $year = strip_tags($year);

        $status = trim($_POST['status'] ?? null);
        $status = $status === '0' || $status === '1' ? $status : 0;


        //ktra thong tin
        $_SESSION['error_update_tem'] = [];
        if(empty($name)){
            $_SESSION['error_update_tem']['name'] = 'Enter name of department, please';
        } else{
            $_SESSION['error_update_tem']['name'] = null;
        }

        if(empty($leader)){
            $_SESSION['error_update_tem']['year'] = '';
        } else{
            $_SESSION['error_update_tem']['year'] = null;
        }

        //xu ly upload logo
        // $logo = null;
        // if(!empty($_FILES['logo']['tmp_name'])){
        //     $logo = uploadFile($_FILES['logo'], 'public/uploads/image/', ['image/png','image/jpg','image/jpeg','image/gif'],5*1024*1024);
        //     if(empty($logo)){
        //         $_SESSION['error_add_department']['logo'] = 'File only accept extension is .png, .jpg, .jpeg, .gif and file <= 5Mb';
        //     } else {
        //         $_SESSION['error_add_department']['logo'] = null;
        //     }
        // }

        $flagCheckingError = false;
        foreach($_SESSION['error_add_department'] as $error){
            if(!empty($error)){
                $flagCheckingError = true;
                break;
            }
        }

        //check lai thong tin
        if(!$flagCheckingError){
            //tien hanh insert vao DB
            $slug = slug_string($name);
            $insert = insertTem($name, $slug,$year,$status);
            if($status){
                header("Location:index.php?c=tem&state=success");
            } else{
                header("Location:index.php?c=tem&m=add&state=error");
            }

        } else {
            //thong bao loi cho nguoi dung biet
            header("Location:index.php?c=tem&m=add&state=fail");
        }
    }
}
function Add(){
    require 'view/tem/add_view.php';
}
function index(){
if(!isLoginUser()){
    header("Location:index.php");
    exit();
}
$keyword = trim($_GET['search'] ?? null);
$keyword = strip_tags($keyword);
$page = trim($_GET['page'] ?? null);
$page = (is_numeric($page) && $page > 0) ? $page : 1;
$linkPage = createLink([
    'c' => 'tem',
    'm' => 'index',
    'page' => '{page}',
    'search' => $keyword
]);

$totalItems = getAllDataTem($keyword);
$totalItems = count($totalItems);
//departments

$panigate = pagigate($linkPage,$totalItems,$page,$keyword, 2);
$start = $panigate['start'] ?? 0;
$Tem = getAllTemByPage($keyword, $start,2);
$htmlPage = $panigate['pagination'] ?? null;

    require 'view/tem/index_view.php';
}