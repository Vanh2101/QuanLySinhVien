<?php
// localhost/management_student/index.php?c=login&m=index
// c = ten cua controller nam trong thu muc controller
$c = trim($_GET['c'] ?? 'login'); //controller mac dinh la login
$c = ucfirst($c); //viet hoa chu cai dau

switch($c) {
    case 'Login';
        require "controller/LoginController.php";
    break;

    case 'Dashboard':
        require "controller/DashboardController.php";
    break;

    case 'Department':
        require "Controller/DepartmentController.php";
    break;

    case 'Courses';
        require "controller/CoursesController.php";
        break;
    case 'Tem';
        require "controller/Temcontroller.php";
        break;
        
    default;
        require "controller/LoginController.php";
    break;
}