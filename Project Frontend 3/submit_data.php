<?php
// Database connection parameters
$servername = "localhost";
$username = "root";
$password = "Ayush@12345";
$database = "railways"; // Change this to your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Extract data from the form submission
$name = $_POST['name'];
$pnr_no = $_POST['pnr_no'];
$seat_no = $_POST['seat_no'];

// Prepare SQL statement to insert data into the database
$sql = "INSERT INTO railway_data (name, pnr_no, seat_no) VALUES ('$name', '$pnr_no', '$seat_no')";

// Execute SQL statement
if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Close connection
$conn->close();
?>

