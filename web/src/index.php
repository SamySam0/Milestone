<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kilburnazon Database</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="icon" type="image/x-icon" href="img/fav.ico">
</head>
<body>

<?php 
    require("php/displayDatabase.php"); 
    require("php/baseFunctions.php"); 
?>

<div class="row">
    <div class="col-left">

        <?php displayDatabase() ?>

        <form method="POST">
            <button class="btn small" style="margin-left: 90px">Load Employees table</button>
        </form> 
    </div>

    <div class="col-right scrollable">
        <div class="container">
            <div class="form-container">
                <p style="padding: 0.5em 1em">Add new employee with following details: </p>
                <form class="queryForm" action="php/addEmployee.php" method="POST" id="addEmployee">
                    <label for="newEmployeeId">ID: </label>
                    <input type="text" id="newEmployeeId" name="newEmployeeId" pattern="^[0-9]{2}-[0-9]{7}$" required/>
                    <br />

                    <label for="newName">Name: </label>
                    <input type="text" id="newName" name="newName" pattern="^[a-z\s,A-Z]{2,50}$" required/>
                    <br />

                    <label for="newHomeAddress">Home Address: </label>
                    <input type="text" id="newHomeAddress" name="newHomeAddress" pattern="^[a-z\s,A-Z,0-9]{2,50}$" value=""/>
                    <br />

                    <label for="newSalary">Salary: </label>
                    <input type="number" id="newSalary" name="newSalary" min="0" value="null"/>
                    <br />

                    <label for="newDateOfBirth">DoB: </label>
                    <input type="date" id="newDateOfBirth" name="newDateOfBirth" style="color: grey" min='1920-01-01' max="<?= date('Y-m-d', strtotime('-15 year')); ?>" required/>
                    <br />

                    <label for="newInsuranceNumber">NIN: </label>
                    <input type="text" id="newInsuranceNumber" name="newInsuranceNumber" pattern="^[0-9,a-z,A-Z]{9}$" required/>
                    <br />

                    <label for="newManagerId">Manager ID: </label>
                    <input type="number" id="newManagerId" name="newManagerId" min="1" max="<?= getNumberOfManagers(); ?>" required/>
                    <br />

                    <label for="newDepartmentId">Department: </label>
                    <select type="number" name="newDepartmentId" id="newDepartmentId" required>
                        <option value="1">Manager</option>
                        <option value="2">HR</option>
                        <option value="3">Driver</option>
                        <option value="4">Packager</option>
                    </select>

                    <p style="font-size: 1em; color: #44524d;"><u>Emergency Contact Details:</u></p>

                    <label for="newEmergencyContactName">name: </label>
                    <input type="text" id="newEmergencyContactName" name="newEmergencyContactName" pattern="^[a-z\s,A-Z]{2,50}$" required/>
                    <br />

                    <label for="newEmergencyContactRelationship">relationship: </label>
                    <input type="text" id="newEmergencyContactRelationship" name="newEmergencyContactRelationship" pattern="^[a-z,A-Z]{2,50}$" required/>
                    <br />

                    <label for="newEmergencyContactPhoneNumber">phone number: </label>
                    <input type="text" id="newEmergencyContactPhoneNumber" name="newEmergencyContactPhoneNumber" pattern="^[0-9]{3,15}$" required/>

                    <br /><br />
                    <input class="submit-btn" type="submit" name="addEmployee" value="Add Employee" />
                </form>
            </div>

            <br />
            <div class="form-container">
                <p style="padding: 0.5em 1em">Delete employee with ID: </p>
                <form class="queryForm" action="php/deleteEmployee.php" method="POST" id="deleteEmployee">
                    <label for="deleteEmployeeId">Employee ID: </label>
                    <input type="text" id="deleteEmployeeId" name="deleteEmployeeId" pattern="^[0-9]{2}-[0-9]{7}$" required/><br /><br />
                    <input class="submit-btn" type="submit" name="deleteEmployee" value="Delete Employee" />
                </form>
            </div>

            <br />
            <div class="form-container">
                <p style="padding: 0.5em 1em">Update employee's salary and EC's phone: </p>
                <form class="queryForm" action="php/updateEmployeeAndEC.php" method="POST" id="deleteEmployee">
                    <label for="updateEmployeeId">Employee ID: </label>
                    <input type="text" id="updateEmployeeId" name="updateEmployeeId" pattern="^[0-9]{2}-[0-9]{7}$" required/><br />
                    <label for="updateSalary">New salary: </label>
                    <input type="number" id="updateSalary" name="updateSalary" min="0" required/><br />
                    <label for="updateEmergencyPhone">New EC Phone: </label>
                    <input type="text" id="updateEmergencyPhone" name="updateEmergencyPhone" pattern="^[0-9]{3,15}$" required/><br /><br />
                    <input class="submit-btn" type="submit" name="updateEmployee1" value="Update Employee" />
                </form>
            </div>

            <br />
            <div class="form-container">
                <p style="padding: 0.5em 1em">Search employees with following details: </p>
                <form class="queryForm" method="POST" id="searchEmployee1">
                    <label for="relationship">Employee's Emergency Contact Relationship:</label><br />
                    <input type="text" id="relationship" name="relationship" pattern="^[a-z,A-Z]{2,50}$" required/><br /><br />
                    <label for="departmentId">Employee's Department: </label><br />
                    <select type="number" name="departmentId" id="departmentId" required>
                        <option value="1">Manager</option>
                        <option value="2">HR</option>
                        <option value="3">Driver</option>
                        <option value="4">Packager</option>
                    </select><br /><br />
                    <input class="submit-btn" name="searchEmployee1" type="submit" value="Search" />
                </form>
            </div>

            <br />
            <p>Show employees whose birthday is this month : </p>
            <form method="POST">
                <button class="btn small" name="selectThisMonthBirthdaysEmployees">This month's birthdays</button>
            </form>

            <p>Show employees which have been deleted: </p>
            <form method="POST">
                <button class="btn small" name="employeeDeleteAudit">Employee audit logs</button>
            </form>
        </div>
    </div>
</div>


</body>
</html>