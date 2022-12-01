<?php

    function displayDatabase() {

        require_once("dbconfig.php");

        if (isset($_POST["employeeDeleteAudit"])) {
            $sql = "SELECT * FROM EmployeesAudit;";
            $fields = ["employeeId", "deleteDate", "managerWhoDeleted"];
            $colNames = ["Employee ID", "Date of deletion", "Manager who deleted"];
            $tableName = "Employee Audits";
            $executePairs = [];
        }
        else if (isset($_POST["searchEmployee1"])) {
            $sql = "SELECT e.name, e.departmentId, c.relationship, m.name as managerName FROM Employees e 
            INNER JOIN EmergencyContacts c 
            INNER JOIN (SELECT e.name, m.managerId FROM Managers m 
                        INNER JOIN Employees e 
                        WHERE m.employeeId = e.employeeId
                       ) AS m
            WHERE e.managerId = m.managerId AND e.departmentId = :departmentId AND c.relationship = :relationship AND c.employeeId = e.employeeId;";

            $fields = ["name", "departmentId", "relationship", "managerName"];
            $colNames = ["Employee name", "Department ID", "Emergency contact relationship", "Manager name"];
            $tableName = "Search Employee Type 1";
            $executePairs = [":departmentId" => $_POST["departmentId"], ":relationship" => $_POST["relationship"]];
        }
        else if (isset($_POST["selectThisMonthBirthdaysEmployees"])) {
            $sql = "CALL GetCurrentMonthBirtdayEmployees();";
            $fields = ["employeeId", "name", "homeAddress", "salary", "dateOfBirth", "insuranceNumber", "managerId", "departmentId"];
            $colNames = ["Employee ID", "Name", "Home address", "Salary", "Date of Birth", "NiN", "Manager ID", "Department IDs"];
            $tableName = "Employees Birthdays";
            $executePairs = [];
        } else {
            $sql = "SELECT * FROM Employees;";
            $fields = ["employeeId", "name", "homeAddress", "salary", "dateOfBirth", "insuranceNumber", "managerId", "departmentId"];
            $colNames = ["Employee ID", "Name", "Home address", "Salary", "Date of Birth", "NiN", "Manager ID", "Department IDs"];
            $tableName = "Employees";
            $executePairs = [];
        }

        $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        $pdo -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);

        $records = $pdo->prepare($sql);
        $records->execute($executePairs);

        // Display table in HTML
        displayTable($records, $fields, $colNames, $tableName);

    }


    function displayTable($records, $fields, $colNames, $tableName) {

        echo('
        <section>
        <h1 class="tbl-title">'.$tableName.'</h1>
        <div class="tbl-header">
            <table cellpadding="0" cellspacing="0" border="0">
                <thead>
                    <tr>');
        
        // ------ Show the table head fields
        foreach ($colNames as $colName) {
            echo("<th>".$colName."</th>");
        };

        // ------
        echo('      </tr>
                </thead>
            </table>
        </div>
        <div class="tbl-content">
            <table cellpadding="0" cellspacing="0" border="0">
                <tbody>');

        // ------ Show each data row
        while($row = $records->fetch())
        {
            echo("<tr>");
            for ($col = 0; $col < count($fields); $col++) {
                echo("<td>".$row[$fields[$col]]."</td>");
            }
            echo("</tr>");
        }

        // ------
        echo('      </tbody>
                </table>
            </div>
            </section>');
    }

?>