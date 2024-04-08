<?php
require "database/database.php";

function updateTemById($name, $slug, $year, $status, $id)
{
    $db = connectionDb();
    $updateTime = date("Y-m-d H:i:s");
    $sql = "UPDATE `tem` SET `name` = :name, `slug` = :slug, `year` = :year, `status` = :status, `updated_at` = :updated_at WHERE `id` = :id AND `deleted_at` IS NULL";
    $stmt = $db->prepare($sql);
    if ($stmt) {
        $stmt->bindParam(':name', $name, PDO::PARAM_STR);
        $stmt->bindParam(':slug', $slug, PDO::PARAM_STR);
        $stmt->bindParam(':year', $year, PDO::PARAM_STR);
        $stmt->bindParam(':status', $status, PDO::PARAM_INT);
        $stmt->bindParam(':updated_at', $updateTime, PDO::PARAM_STR);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        if ($stmt->execute()) {
            // Update successful
        } else {
            // Handle update failure
        }
    }
    disconnectDb($db);
}


function getDetailTemById($id = 0){
    $sql ="SELECT * FROM `tem` WHERE `id` = :id AND `deleted_at` IS NULL";
    $db = connectionDB();
    $data = [];
    $stmt = $db->prepare($sql);
    if($stmt){
        $stmt->bindParam('id', $id, PDO::PARAM_INT);
        if($stmt->execute()){
            $data = $stmt->fetch(PDO::FETCH_ASSOC);
        }
    }
    disconnectDB($db);
    return $data;
}
function deleteTemById($id = 0){
    $sql = "UPDATE `tem` SET `deleted_at` = :deleted_at WHERE `id` = :id ";
    $db = connectionDB();
    $checkDelete = false;
    $deleteTime = date("y-m-d H:i:s");
    $stmt = $db->prepare($sql);
    if($stmt){
        $stmt->bindParam('deleted_at', $deleteTime, PDO::PARAM_STR);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        if($stmt->execute()){
            $checkDelete = true;

        }
    }
    disconnectDB($db);
    return $checkDelete;
}

function getAllDataTem($keyword = null){
    $db = connectionDB();
    $key = "%{$keyword}%";
    $sql = "SELECT * from `tem` WHERE (`name` LIKE :nameTem OR `year` LIKE :yearTem) AND `deleted_at` IS NULL";
    $stmt = $db->prepare($sql);
    $data = [];
    if($stmt){
        $stmt->bindParam(':nameTem', $key,PDO::PARAM_STR);
        $stmt->bindParam(':yearTem', $key, PDO::PARAM_STR);
        if($stmt->execute()){
            if($stmt->rowCount() > 0){
                $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
            }
        }
    }
    disconnectDB($db);
    return $data;
}
function getAllTemByPage($keyword = null, $start = 0, $limit = 2)
{ 
    $key = "%{$keyword}%";
    $sql = "SELECT * FROM `tem` WHERE (`name` LIKE :nameTem OR `year` LIKE :yearTem) AND `deleted_at` IS NULL LIMIT :startData, :limitData";
    $db = connectionDB();
    $stmt = $db->prepare($sql);
    $data = [];

    if ($stmt) {
        $stmt->bindParam(':nameTem', $key, PDO::PARAM_STR);
        $stmt->bindParam(':yearTem', $key, PDO::PARAM_STR);
        $stmt->bindParam(':startData', $start, PDO::PARAM_INT);
        $stmt->bindParam(':limitData', $limit, PDO::PARAM_INT);

        if ($stmt->execute()) {
            if ($stmt->rowCount() > 0) {
                $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
            }
        }
    }

    disconnectDB($db);
    return $data;
}



function insertTem($name,$slug, $year,$status){
    //viet cau lenh sql insert vao bang department
    $sqlInsert = "INSERT INTO `tem` (`name`, `slug`, `year`, `status`, `created_at`) VALUES (:nameTem, :slug, :yearTem,  :statusTem, :createdAt)";
    $checkInsert = false;
    $db = connectionDB();
    $stmt = $db->prepare($sqlInsert);
    $currenDate = date('Y-m-d H:i:s');
    if($stmt){
        $stmt->bindParam(':nameTem', $name,PDO::PARAM_STR);
        $stmt->bindParam(':slug', $slug,PDO::PARAM_STR);
        $stmt->bindParam(':yearTem', $year,PDO::PARAM_STR);
        $stmt->bindParam(':statusTem', $status,PDO::PARAM_STR);
        $stmt->bindParam(':createdAt', $currenDate,PDO::PARAM_STR);
        if($stmt->execute()){
            $checkInsert = true;
        }
    }
    disconnectDB($db);
    //tra ve true, insert thanh cong va  nguoc lai
    return $checkInsert;
}