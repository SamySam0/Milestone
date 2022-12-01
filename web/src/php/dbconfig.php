<?php

	$host     = "db"; // should be the same as the alias for the container in docker-compose
	$dbname   = "Kilburnazon";
	$username = "root";
	$password = "password"; // DB_PASSWORD should be the same as MYSQL_PASSWORD

	try 
	{
	 $conn = new PDO("mysql:host=$host;port=3306;dbname=$dbname", $username, $password);
	}
	catch (PDOException $pe)
	{
	 exit("Could not connect to database $dbname: " . $pe->getMessage());
	}

?>