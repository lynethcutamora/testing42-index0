<?php
	/**
	 * Following code will create a new user 
	 * All details are read from HTTP Post request
	 */

	//array of JSON response
	$response = array();

	//include db connect class
	require_once __DIR__ . '/db_connect.php';

	//connecting to db
	$db = new DB_CONNECT();

	//get max id from the database
	$id = mysql_query('SELECT MAX(userId) FROM user_md');
	//check for required fields
	if(isset($_POST['userType']) && isset($_POST['fname']) 
	&& isset($_POST['lname']) && isset($_POST['age'])
	&& isset($_POST['gender'])&& isset($_POST['address'])
	&& isset($_POST['emailAdd'])&& isset($_POST['pssWord'])){
		$userType = $_POST['userType'];
		$fname = $_POST['fname'];
		$lname = $_POST['lname'];
		$midInit = $_POST['midInit'];
		$age = $_POST['age'];
		$gender = $_POST['gender'];
		$address = $_POST['address'];
		$emailAdd = $_POST['emailAdd'];
		$pssWord = $_POST['pssWord'];

		//mysql inserting a new row into user master data & details
		$master = mysql_query("INSERT INTO user_md(userId,userType) VALUES ('$id','$userType')");
		$details = mysql_query("INSERT INTO user_dtl(userId,lName,fName,midInit,age,gender,address,emailAdd,pssWord)
								VALUES ('$id','$lname','$fname','$midInit','$age','$gender','$address','$emailAdd','$pssWord')";

		//check if row is inserted or not
		if($master && $details){
			//successfully inserted into database
			$response["success"]=1;
			$response["message"]="New account successfully created.";
		}else{
			//failed to insert row
			$response["success"]=0;
			$response["message"]="Oops! An error occured.";
		}
	}else{
		//required fields is missing
		$response["success"]=0;
		$response["message"]="Required field(s) is missing";
	}
	//echoing JSON response
	echo json_encode($response);
?>