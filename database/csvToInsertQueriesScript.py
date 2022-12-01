# Made by Samuel Belkadi
import csv

def extract_sql(fromFileName, toFileName, databaseName, tableName):
    toFile = open(toFileName, 'a')
    with open(fromFileName, 'r') as file:
        toFile.write("#------------------------------------------------------------\n")
        toFile.write(f"#-- {tableName}\n")
        toFile.write("#------------------------------------------------------------\n")
        csvreader = csv.reader(file)
        header = "`" + "`, `".join(next(csvreader)) + "`"
        for row in csvreader:
            values = ", ".join([f'\"{value}\"' if not value.isnumeric() and value != "NULL" else f'{value}' for value in row])
            toFile.write(f"INSERT INTO `{databaseName}`.`{tableName}` ({header}) VALUES ({values});\n")
        toFile.write("\n")
    file.close()

extract_sql(fromFileName="data/departments.csv", toFileName="sql/2-sampledata.sql", databaseName="Kilburnazon", tableName="Departments")
extract_sql(fromFileName="data/employees_managers.csv", toFileName="sql/2-sampledata.sql", databaseName="Kilburnazon", tableName="Employees")
extract_sql(fromFileName="data/managers.csv", toFileName="sql/2-sampledata.sql", databaseName="Kilburnazon", tableName="Managers")
extract_sql(fromFileName="data/employees.csv", toFileName="sql/2-sampledata.sql", databaseName="Kilburnazon", tableName="Employees")
extract_sql(fromFileName="data/emergencyContacts.csv", toFileName="sql/2-sampledata.sql", databaseName="Kilburnazon", tableName="EmergencyContacts")