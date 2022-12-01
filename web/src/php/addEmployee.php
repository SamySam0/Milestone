<?php

    require("dbconfig.php");
    require_once("baseFunctions.php");
    
    $employeeId = $_POST['newEmployeeId'];
    if (doesEmployeeExists($employeeId) == True) {
        echo("<script>alert('An Employee with the same ID already exists! Employee IDs must be unique.')</script>");
        echo("<script>window.location = '../index.php';</script>");
        return false;
    }
    $name = $_POST['newName'];
    $homeAddress = $_POST['newHomeAddress'];
    if ($homeAddress == "") $homeAddress = NULL;
    $salary = $_POST['newSalary'];
    if ($salary == null) $salary = NULL;
    $dateOfBirth = $_POST['newDateOfBirth'];
    $insuranceNumber = $_POST['newInsuranceNumber'];
    $managerId = $_POST['newManagerId'];
    $departmentId = $_POST['newDepartmentId'];
    $emergencyContactName = $_POST['newEmergencyContactName'];
    $emergencyContactRelationship = $_POST['newEmergencyContactRelationship'];
    $emergencyContactPhoneNumber = $_POST['newEmergencyContactPhoneNumber'];
    
    $sql = "INSERT INTO `Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) 
                VALUES (:employeeId, :name, :homeAddress, :salary, :dateOfBirth, :insuranceNumber, :managerId, :departmentId);
            INSERT INTO `EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`)
                VALUES (:emergencyContactName, :emergencyContactRelationship, :emergencyContactPhoneNumber, :employeeId);";

    if ($departmentId == 2) {
        // HR Member
        $sql .= "INSERT INTO `HRMembers` (`employeeId`) VALUES (:employeeId);";
    } else if ($departmentId == 3) {
        // Driver
        $sql .= "INSERT INTO `Drivers` (`employeeId`) VALUES (:employeeId);";
    } else if ($departmentId == 4) {
        // Packager
        $sql .= "INSERT INTO `Packagers` (`employeeId`) VALUES (:employeeId);";
    } else {
        // Manager
        $sql .= "INSERT INTO `Managers` (`employeeId`) VALUES (:employeeId);";
    }

    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);

    $records = $pdo->prepare($sql);
    $records->execute([':employeeId' => $employeeId, ':name'  => $name, ':homeAddress' => $homeAddress, ':salary' => $salary, 
                       ':dateOfBirth' => $dateOfBirth, ':insuranceNumber' => $insuranceNumber, ':managerId' => $managerId, ':departmentId' => $departmentId,
                       ':emergencyContactName' => $emergencyContactName, ':emergencyContactRelationship' => $emergencyContactRelationship,
                       ':emergencyContactPhoneNumber' => $emergencyContactPhoneNumber]);

    header("Location:../index.php");

?>