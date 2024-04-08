<?php

require 'model/login_model.php';



// m = tên của hàm nằm trong file controller trong thư mục controller
$m = trim($_GET['m'] ?? 'index'); // ham mac dinh trong controller ten la index
$m = strtolower($m); //viết thường tất cả tên hàm
switch($m){
    case'index';
        index();
    break;

    case 'handle';
        handleLogin();
    break;

    case 'logout';
        handlelogout();
    break;

    default;
        index();
    break;
}

function handlelogout(){
    if(isset($_POST['btnLogout'])){
        //huy cac session
        session_destroy();
        //quay ve trang dang nhap
        header("Location:index.php");

    }
}
function handleLogin(){
    if(isset($_POST['btnLogin'])){
        $username = trim($_POST['username'] ?? null);
        $username = strip_tags($username); //strip_tags: xoa cac the html trong chuoi
        $password = trim($_POST['password'] ?? null);
        $password = strip_tags($password);

        $userInfo = checkLoginUser($username, $password);
        if(!empty($userInfo)){
            //tai khoan co ton tai
            //luu thong tin nguoi dung vao session
            $_SESSION['username'] = $userInfo['username'];
            $_SESSION['fullname'] = $userInfo['full_name'];
            $_SESSION['email'] = $userInfo['email'];
            $_SESSION['idUser'] = $userInfo['user_id'];
            $_SESSION['roleId'] = $userInfo['role_id'];
            $_SESSION['idAccount'] = $userInfo['id'];

            //cho vao trang quan tri
            header("Location:index.php?c=dashboard");
        } else {
            //tai khoan ko ton tai
            //quay lai trang dang nhap va thong bao loi
            header("Location:index.php?state=error");
        }
    }
}
function index(){
    if(isLoginUser()){
        header("Location:index.php?c=dashboard");
    }
    require "view/login/index_view.php";
}