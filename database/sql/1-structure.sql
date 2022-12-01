
-- -----------------------------------------------------
-- Schema Kilburnazon
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `Kilburnazon`;
CREATE DATABASE `Kilburnazon` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_cs;
USE `Kilburnazon`;


-- -- -----------------------------------------------------
-- -- Table `Departments`
-- -- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Departments` (
  `departmentId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) DEFAULT NULL,
  `numberOfEmployees` INT NOT NULL,
  `headOfficeLocation` VARCHAR(255) NOT NULL,
  `employeeInChargeId` VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (`departmentId`),
  INDEX `fk_Departments_Employees_idx` (`employeeInChargeId` ASC)
);


-- -----------------------------------------------------
-- Table `Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Employees` (
  `employeeId` VARCHAR(10) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `homeAddress` VARCHAR(255) DEFAULT NULL,
  `salary` INT DEFAULT NULL,
  `dateOfBirth` DATE NOT NULL,
  `insuranceNumber` VARCHAR(10) NOT NULL,
  `managerId` INT DEFAULT NULL,
  `departmentId` INT NOT NULL,
  PRIMARY KEY (`employeeId`),
  INDEX `fk_Employees_Departments_idx` (`departmentId` ASC),
  INDEX `fk_Employees_Managers_idx` (`managerId` ASC),
  CONSTRAINT `fk_Employees_Departments`
    FOREIGN KEY (`departmentId`)
    REFERENCES `Departments` (`departmentId`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- ADD Constraint to FK of Departments -> Employees
-- -----------------------------------------------------
ALTER TABLE `Departments`
ADD CONSTRAINT `fk_Departments_Employees`
  FOREIGN KEY (`employeeInChargeId`)
  REFERENCES `Employees` (`employeeId`)
  ON DELETE SET NULL
  ON UPDATE CASCADE;


-- -----------------------------------------------------
-- Table `EmergencyContacts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EmergencyContacts` (
  `name` VARCHAR(50) NOT NULL,
  `relationship` VARCHAR(50) NOT NULL,
  `phoneNumber` VARCHAR(15) NOT NULL,
  `employeeId` VARCHAR(10) NOT NULL,
  INDEX `fk_EmergencyContacts_Employees_idx` (`employeeId` ASC),
  CONSTRAINT `fk_EmergencyContacts_Employees`
    FOREIGN KEY (`employeeId`)
    REFERENCES `Employees` (`employeeId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `Buildings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Buildings` (
  `buildingId` INT NOT NULL AUTO_INCREMENT,
  `area` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`buildingId`)
);


-- -----------------------------------------------------
-- Table `Warehouses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Warehouses` (
  `warehouseId` INT NOT NULL AUTO_INCREMENT,
  `location` VARCHAR(255) NOT NULL,
  `size` INT NOT NULL,
  `purpose` VARCHAR(255) NOT NULL,
  `buildingId` INT NOT NULL,
  PRIMARY KEY (`warehouseId`),
  INDEX `fk_Warehouses_Buildings_idx` (`buildingId` ASC),
  CONSTRAINT `fk_Warehouses_Buildings`
    FOREIGN KEY (`buildingId`)
    REFERENCES `Buildings` (`buildingId`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `Offices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Offices` (
  `officeId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) DEFAULT NULL,
  `location` VARCHAR(255) NOT NULL,
  `buildingId` INT NOT NULL,
  PRIMARY KEY (`officeId`),
  INDEX `fk_Offices_Buildings_idx` (`buildingId` ASC),
  CONSTRAINT `fk_Offices_Buildings`
    FOREIGN KEY (`buildingId`)
    REFERENCES `Buildings` (`buildingId`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `Managers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Managers` (
  `managerId` INT NOT NULL AUTO_INCREMENT,
  `employeeId` VARCHAR(10) NOT NULL,
  `officeId` INT DEFAULT NULL,
  PRIMARY KEY (`managerId`),
  INDEX `fk_Managers_Employees_idx` (`employeeId` ASC),
  INDEX `fk_Managers_Offices_idx` (`officeId` ASC),
  CONSTRAINT `fk_Managers_Employees`
    FOREIGN KEY (`employeeId`)
    REFERENCES `Employees` (`employeeId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Managers_Offices`
    FOREIGN KEY (`officeId`)
    REFERENCES `Offices` (`officeId`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- ADD Constraint to FK of Employees -> Managers
-- -----------------------------------------------------
ALTER TABLE `Employees`
ADD CONSTRAINT `fk_Employees_Managers`
  FOREIGN KEY (`managerId`)
  REFERENCES `Managers` (`managerId`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;


-- -----------------------------------------------------
-- Table `HRMembers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HRMembers` (
  `hrmemberId` INT NOT NULL AUTO_INCREMENT,
  `employeeId` VARCHAR(10) NOT NULL,
  `officeId` INT DEFAULT NULL,
  PRIMARY KEY (`hrmemberId`),
  INDEX `fk_HRMembers_Employees_idx` (`employeeId` ASC),
  INDEX `fk_HRMembers_Offices_idx` (`officeId` ASC),
  CONSTRAINT `fk_HRMembers_Employees`
    FOREIGN KEY (`employeeId`)
    REFERENCES `Employees` (`employeeId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_HRMembers_Offices`
    FOREIGN KEY (`officeId`)
    REFERENCES `Offices` (`officeId`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `Complaints`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Complaints` (
  `complaintId` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `passengerName` VARCHAR(50) DEFAULT "Anonymous",
  `reason` VARCHAR(255) NOT NULL,
  `hrmemberid` INT DEFAULT NULL,
  PRIMARY KEY (`complaintId`),
  INDEX `fk_Complaints_HRMembers_idx` (`hrmemberid` ASC),
  CONSTRAINT `fk_Complaints_HRMembers`
    FOREIGN KEY (`hrmemberid`)
    REFERENCES `HRMembers` (`hrmemberid`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `Packagers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Packagers` (
  `packagerId` INT NOT NULL AUTO_INCREMENT,
  `area` VARCHAR(50) DEFAULT NULL,
  `employeeId` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`packagerId`),
  INDEX `fk_Packagers_Employees_idx` (`employeeId` ASC),
  CONSTRAINT `fk_Packagers_Employees`
    FOREIGN KEY (`employeeId`)
    REFERENCES `Employees` (`employeeId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `PackagerWarehouses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PackagerWarehouses` (
  `packagerId` INT NOT NULL,
  `warehouseId` INT NOT NULL,
  PRIMARY KEY (`packagerId`, `warehouseId`),
  INDEX `fk_PackagerWarehouses_Packagers_idx` (`packagerId` ASC),
  INDEX `fk_PackagerWarehouses_Warehouses_idx` (`warehouseId` ASC),
  CONSTRAINT `fk_PackagerWarehouses_Packagers`
    FOREIGN KEY (`packagerId`)
    REFERENCES `Packagers` (`packagerId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_PackagerWarehouses_Warehouses`
    FOREIGN KEY (`warehouseId`)
    REFERENCES `Warehouses` (`warehouseId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `Vehicles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vehicles` (
  `vehicleId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50),
  `area` VARCHAR(50),
  PRIMARY KEY (`vehicleId`)
);


-- -----------------------------------------------------
-- Table `Drivers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Drivers` (
  `driverId` INT NOT NULL AUTO_INCREMENT,
  `area` VARCHAR(50) DEFAULT NULL,
  `employeeId` VARCHAR(10) NOT NULL,
  `vehicleId` INT DEFAULT NULL,
  PRIMARY KEY (`driverId`),
  INDEX `fk_Drivers_Employees_idx` (`employeeId` ASC),
  INDEX `fk_Drivers_Vehicles_idx` (`vehicleId` ASC),
  CONSTRAINT `fk_Drivers_Employees`
    FOREIGN KEY (`employeeId`)
    REFERENCES `Employees` (`employeeId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Drivers_Vehicles`
    FOREIGN KEY (`vehicleId`)
    REFERENCES `Vehicles` (`vehicleId`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `DriverWarehouses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DriverWarehouses` (
  `driverId` INT NOT NULL,
  `warehouseId` INT NOT NULL,
  PRIMARY KEY (`driverId`, `warehouseId`),
  INDEX `fk_DriverWarehouses_Drivers_idx` (`driverId` ASC),
  INDEX `fk_DriverWarehouses_Warehouses_idx` (`warehouseId` ASC),
  CONSTRAINT `fk_DriverWarehouses_Drivers`
    FOREIGN KEY (`driverId`)
    REFERENCES `Drivers` (`driverId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_DriverWarehouses_Warehouses`
    FOREIGN KEY (`warehouseId`)
    REFERENCES `Warehouses` (`warehouseId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `Hours`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hours` (
  `weekStartDate` DATE NOT NULL,
  `driverId` INT NOT NULL,
  `hours` INT NOT NULL,
  PRIMARY KEY (`weekStartDate`,`driverId`),
  INDEX `fk_Hours_Drivers_idx` (`driverId` ASC),
  CONSTRAINT `fk_Hours_Drivers`
    FOREIGN KEY (`driverId`)
    REFERENCES `Drivers` (`driverId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `Routes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Routes` (
  `routeName` VARCHAR(50) NOT NULL,
  `startingLocation` POINT NOT NULL,
  `endingLocation` POINT NOT NULL,
  PRIMARY KEY (`routeName`)
);


-- -----------------------------------------------------
-- Table `Stops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stops` (
  `stopId` INT NOT NULL AUTO_INCREMENT,
  `location` POINT NOT NULL,
  PRIMARY KEY (`stopId`)
);


-- -----------------------------------------------------
-- Table `Schedules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Schedules` (
  `scheduleId` INT NOT NULL AUTO_INCREMENT,
  `departureTime` DATETIME NOT NULL,
  `driverId` INT DEFAULT NULL,
  `routeName` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`scheduleId`),
  INDEX `fk_Schedules_Drivers_idx` (`driverId` ASC),
  INDEX `fk_Schedules_Routes_idx` (`routeName` ASC),
  CONSTRAINT `fk_Schedules_Drivers`
    FOREIGN KEY (`driverId`)
    REFERENCES `Drivers` (`driverId`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Schedules_Routes`
    FOREIGN KEY (`routeName`)
    REFERENCES `Routes` (`routeName`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `ScheduleStops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ScheduleStops` (
  `scheduleId` INT NOT NULL,
  `stopId` INT NOT NULL,
  `arrivalTime` DATETIME DEFAULT NULL,
  PRIMARY KEY (`scheduleId`, `stopId`),
  INDEX `fk_ScheduleStops_Schedules_idx` (`scheduleId` ASC),
  INDEX `fk_ScheduleStops_Stops_idx` (`stopId` ASC),
  CONSTRAINT `fk_ScheduleStops_Schedules`
    FOREIGN KEY (`scheduleId`)
    REFERENCES `Schedules` (`scheduleId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ScheduleStops_Stops`
    FOREIGN KEY (`stopId`)
    REFERENCES `Stops` (`stopId`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Customers` (
  `customerId` INT NOT NULL AUTO_INCREMENT,
  `fullName` VARCHAR(50) NOT NULL,
  `emailAddress` VARCHAR(50) NOT NULL,
  `postalLocation` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`customerId`)
);


-- -----------------------------------------------------
-- Table `Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Orders` (
  `orderId` INT NOT NULL AUTO_INCREMENT,
  `purchaseDate` DATETIME NOT NULL,
  `customerId` INT NOT NULL,
  `scheduleId` INT DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  INDEX `fk_Orders_Customers_idx` (`customerId` ASC),
  INDEX `fk_Orders_Schedules_idx` (`scheduleId` ASC),
  CONSTRAINT `fk_Orders_Customers`
    FOREIGN KEY (`customerId`)
    REFERENCES `Customers` (`customerId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Orders_Schedules`
    FOREIGN KEY (`scheduleId`)
    REFERENCES `Schedules` (`scheduleId`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Products` (
  `productId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(255),
  `price` INT NOT NULL,
  `totalQuantity` INT NOT NULL,
  PRIMARY KEY (`productId`)
);


-- -----------------------------------------------------
-- Table `OrderLines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OrderLines` (
  `orderId` INT NOT NULL,
  `productId` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`orderId`, `productId`),
  INDEX `fk_OrderLines_Orders_idx` (`orderId` ASC),
  INDEX `fk_OrderLines_Products_idx` (`productId` ASC),
  CONSTRAINT `fk_OrderLines_Orders`
    FOREIGN KEY (`orderId`)
    REFERENCES `Orders` (`orderId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_OrderLines_Products`
    FOREIGN KEY (`productId`)
    REFERENCES `Products` (`productId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table `WarehouseProducts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `WarehouseProducts` (
  `productId` INT NOT NULL,
  `warehouseId` INT NOT NULL,
  `quantityInWarehouse` INT NOT NULL,
  PRIMARY KEY (`productId`, `warehouseId`),
  INDEX `fk_WarehouseProducts_Products_idx` (`productId` ASC),
  INDEX `fk_WarehouseProducts_Warehouses_idx` (`warehouseId` ASC),
  CONSTRAINT `fk_WarehouseProducts_Products`
    FOREIGN KEY (`productId`)
    REFERENCES `Products` (`productId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_WarehouseProducts_Warehouses`
    FOREIGN KEY (`warehouseId`)
    REFERENCES `Warehouses` (`warehouseId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

