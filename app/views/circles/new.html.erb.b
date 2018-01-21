
<head>
	<title>Creating Group Circle</title>
	<link rel="stylesheet" href="circles.scss">
</head>

<div class="header">
	<h1 id="heading">Creating a Group Circle</h1>
</div>

<!--
<div class="my_class">
  sample text
  <div class="sub_class">
  	large text
  </div>
</div>
-->


<div>
	<form method= "post" action="something.php" name="myForm" onsubmit="return validateForm()">
	<div>
		<label>Group Name</label>
		<input type="text" name="groupName" id="groupName" />
	</div>
	<br />

	<div>
		<label>Subject</label>
		<select name="subject" id="subject" onchange="changeSubject(this)">
			<option value="Intro to C++">Intro to C++</option>
			<option value="Intro to Java">Intro to Java</option>
			<option value="Intro to Python">Intro to Python</option>
			<option value="Intro to WebDev">Intro to WebDev</option>
			<option value="Intro to PS">Intro to PS</option>
			<option value="Intro to UNIX/LINUX">Intro to UNIX/LINUX</option>

			<option value="Swift">Swift</option>
			<option value="React">React</option>
			<option value="Node.js">Node.js</option>

			<option value="Linear Algebra">Linear Algebra</option>
			<option value="Discrete Math">Discrete Math</option>
			<option value="Statistics">Statistics</option>
			<option value="Calculus">Calculus</option>

			<option value="Spanish">Spanish</option>
			<option value="Japanese">Japanese</option>
			<option value="French">French</option>

			<option value="Microbiology">Microbiology</option>
			<option value="Chemistry">Chemistry</option>
			<option value="Psychology">Psychology</option>
			<option value="Western History">Western History</option>


		</select>
	</div>
	<br />
	
	<div>
		<label>Group Type</label>
		<select name="Private/Public" id="Private/Public" onchange="changeHeading(this)">
			<option value="Public">Public</option>
			<option value="Private">Private</option>
		</select>
	</div>
	<br />
	<input type="submit" name="Submit">
	</form>
</div>
