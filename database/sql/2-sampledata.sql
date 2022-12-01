#------------------------------------------------------------
#-- Departments
#------------------------------------------------------------
INSERT INTO `Kilburnazon`.`Departments` (`name`, `numberOfEmployees`, `headOfficeLocation`, `employeeInChargeId`) VALUES ("Manager", 3, "London", NULL);
INSERT INTO `Kilburnazon`.`Departments` (`name`, `numberOfEmployees`, `headOfficeLocation`, `employeeInChargeId`) VALUES ("HR", 2, "London", NULL);
INSERT INTO `Kilburnazon`.`Departments` (`name`, `numberOfEmployees`, `headOfficeLocation`, `employeeInChargeId`) VALUES ("Driver", 5, "Leeds", NULL);
INSERT INTO `Kilburnazon`.`Departments` (`name`, `numberOfEmployees`, `headOfficeLocation`, `employeeInChargeId`) VALUES ("Packager", 10, "Manchester", NULL);

#------------------------------------------------------------
#-- Employees
#------------------------------------------------------------
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("31-1735453", "Killian Amillot", "Beaulieu-sur-la-mer, Nice", 32599, "1948/06/27", "dt545040m", NULL, 1);
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("67-2162941", "Samantha Arreille", "7 Nobel Way, Manchester", 95684, "1983/02/15", "qf137469l", NULL, 1);
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("85-6903134", "Liv Lyron", "8 Lichfield Mount, Bradford", 10000, "1962/10/14", "nz662678p", NULL, 1);

#------------------------------------------------------------
#-- Managers
#------------------------------------------------------------
INSERT INTO `Kilburnazon`.`Managers` (`employeeId`, `officeId`) VALUES ("31-1735453", NULL);
INSERT INTO `Kilburnazon`.`Managers` (`employeeId`, `officeId`) VALUES ("67-2162941", NULL);
INSERT INTO `Kilburnazon`.`Managers` (`employeeId`, `officeId`) VALUES ("85-6903134", NULL);

#------------------------------------------------------------
#-- Employees
#------------------------------------------------------------
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("45-1746352", "Samuel Belkadi", "87 Harkbridge Drive, Manchester", 198937, "1961/09/06", "rb499211c", 1, 2);
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("52-8172635", "Alexandre Abbe", "76 ave Leopold, Nice", 63490, "1950/01/01", "ht175666x", 3, 4);
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("77-8173682", "Manon Steward", "19 Stopel way, London", 130372, "1963/08/24", "vb943949c", 1, 3);
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("36-2747513", "Mathieu Pecho", "61 Bercaillit, Manchester", 53445, "1952/07/26", "zt656754o", 2, 3);
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("67-6610675", "Mihai Bors", "88 Golf of North, Manchester", 31253, "1962/08/09", "to907441w", 3, 4);
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("23-7508479", "Teo Gaudrillaut", "House of the hill, Leeds", 90226, "1994/12/12", "du615694i", 2, 4);
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("75-7155290", "Jean Michelet", "2 Vernon Court, Cheltenham", 124628, "1993/01/16", "rz111360g", 1, 4);
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("46-4176423", "Jennifer Magasin", "28 Harkbridge Drive, Manchester", 116295, "1963/07/07", "dr180938w", 2, 3);
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("24-8179526", "Catherine Relan", "White Owl Barn, Reading Street, London", 124650, "1946/07/20", "gx924268x", 1, 4);
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("23-5837604", "Geoffrey Galcon", "3 Dodsworth Villas, Greenside", 68003, "1947/01/03", "wh660279o", 1, 3);
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("43-2161789", "Samantha Martin", "210 West Malvern Road, London", 183378, "1982/02/23", "zw251674d", 1, 4);
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("47-7088149", "Rambolito Amini", "9 Warrengate Road, North Mymms", 119139, "1976/08/26", "qy726870d", 3, 2);
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("89-9940504", "Pauline Rigo", "3 College Road, Oswestry", 58584, "1972/01/01", "xz796669h", 2, 4);
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("29-4323273", "Lea Klepa", "1 William Tow Close, Sutton On Sea", 96895, "1993/04/05", "bl221585z", 1, 4);
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("86-8290964", "Kenny Toadb", "10 Dun Street, Swinton", 67431, "1958/08/02", "cz046288u", 2, 3);
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("84-1344334", "Ilan Chelli", "210 West Malvern Road, Malvern", 143883, "1999/12/07", "pk696816m", 1, 4);
INSERT INTO `Kilburnazon`.`Employees` (`employeeId`, `name`, `homeAddress`, `salary`, `dateOfBirth`, `insuranceNumber`, `managerId`, `departmentId`) VALUES ("43-9608140", "Emilly Teou", "Laneside, Staveley", 124154, "1966/12/15", "jr596419t", 1, 4);

#------------------------------------------------------------
#-- EmergencyContacts
#------------------------------------------------------------
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Jereme Slayford", "Girlfriend", 7721065357, "45-1746352");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Nessy Panting", "Civil Partner", 7326502172, "52-8172635");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Kipp Lavens", "Boyfriend", 7489365686, "31-1735453");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Theo Sheard", "Mother", 7356401825, "77-8173682");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Joly Doram", "Girlfriend", 7106575891, "67-2162941");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Baird Fingleton", "Boyfriend", 7789751694, "36-2747513");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Patty Horsburgh", "Husband", 7924918978, "67-6610675");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Frazier Snelman", "Boyfriend", 7235513354, "23-7508479");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Regan Yarn", "Mother", 7967811408, "75-7155290");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Zita Stanborough", "Mother", 7532693273, "46-4176423");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Norrie Aggis", "Husband", 7390692263, "24-8179526");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Eada Silmon", "Wife", 7007182872, "85-6903134");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Alberto Elgie", "Father", 7007723133, "23-5837604");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Bastian Walliker", "Civil Partner", 7695349556, "43-2161789");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Winfred Moncey", "Wife", 7510608683, "47-7088149");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Michaelina Brahms", "Civil Partner", 7996211011, "89-9940504");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Tabbitha Shemmans", "Wife", 7625474049, "29-4323273");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Jone Tatersale", "Mother", 7761255990, "86-8290964");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Quinn Goodfellow", "Husband", 7755486861, "84-1344334");
INSERT INTO `Kilburnazon`.`EmergencyContacts` (`name`, `relationship`, `phoneNumber`, `employeeId`) VALUES ("Flory Billham", "Husband", 7184248686, "43-9608140");

