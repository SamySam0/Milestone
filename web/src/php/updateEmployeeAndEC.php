<?php

    require("dbconfig.php");
    require_once("baseFunctions.php");
    
    $employeeId = $_POST['updateEmployeeId'];
    if (doesEmployeeExists($employeeId) == False) {
        echo("<script>alert('No Employee is assigned to this ID. Please try again.')</script>");
        echo("<script>window.location = '../index.php';</script>");
        return false;
    }
    $salary = $_POST['updateSalary'];
    $emergencyContactPhoneNumber = $_POST['updateEmergencyPhone'];

    $sql = "UPDATE Employees
            SET salary = :salary
            WHERE employeeId = :employeeId;
            
            UPDATE EmergencyContacts
            SET phoneNumber = :phoneNumber
            WHERE employeeId = :employeeId;";
    
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);

    $records = $pdo->prepare($sql);
    $records->execute([':employeeId' => $employeeId, ':salary' => $salary, ':phoneNumber' => $emergencyContactPhoneNumber]);

    header("Location:../index.php");

?>