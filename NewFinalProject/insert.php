<?PHP
	include_once("connection.php");
	
if(isset($_POST['fname']) 
	&& isset($_POST['lname']) && isset($_POST['age'])
	&& isset($_POST['gender'])&& isset($_POST['address'])
	&& isset($_POST['emailAdd'])&& isset($_POST['pssWord'])){
		
		$fname = $_POST['fname'];
		$lname = $_POST['lname'];
		$midInit = $_POST['midInit'];
		$age = $_POST['age'];
		$gender = $_POST['gender'];
		$address = $_POST['address'];
		$emailAdd = $_POST['emailAdd'];
		$pssWord = $_POST['pssWord'];



	mysql_query("INSERT INTO user_dtl(lName,fName,midInit,age,gender,address,emailAdd,pssWord) VALUES ('$lname','$fname','$midInit','$age','$gender','$address','$emailAdd','$pssWord')");
	echo "Data Inserted";
}
?>
