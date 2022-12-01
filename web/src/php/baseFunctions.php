<?php

    function getNumberOfManagers() {

        require("dbconfig.php");

        $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $pdo -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);

        $sql = "SELECT COUNT(*) FROM Managers;";

        $records = $pdo->prepare($sql);
        $records->execute();

        $row = $records->fetch();
        echo((int) $row["COUNT(*)"]);

    }

    function doesEmployeeExists($employeeId) {

        require("dbconfig.php");

        $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $pdo -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);

        $sql = "SELECT EXISTS (SELECT * from Employees WHERE employeeId = :employeeId) AS Result;";

        $records = $pdo->prepare($sql);
        $records->execute([':employeeId' => $employeeId]);

        $row = $records->fetch();
        return (int) $row["Result"];

    }

?>