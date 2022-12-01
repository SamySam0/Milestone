
USE `Kilburnazon`;

#------------------------------------------------------------
#-- trigger to log deleted employees into
#-- an auditing table
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `EmployeesAudit` (
  `employeeId` VARCHAR(10) NOT NULL,
  `deleteDate` DATETIME NOT NULL,
  `managerWhoDeleted` INT NOT NULL,
  PRIMARY KEY (`employeeId`),
  INDEX `fk_EmployeesAudits_Managers_idx` (`managerWhoDeleted` ASC),
  CONSTRAINT `fk_EmployeesAudit_Managers`
    FOREIGN KEY (`managerWhoDeleted`)
    REFERENCES `Managers` (`managerId`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);

CREATE TRIGGER beforeEmployeeDelete
    BEFORE DELETE ON Employees FOR EACH ROW
INSERT INTO EmployeesAudit
SET employeeId = OLD.employeeId,
    deleteDate = NOW(),
    managerWhoDeleted = OLD.managerId;
