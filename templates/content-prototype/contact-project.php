<!doctype html>

<html>
<head>  
  <title>Contact Sparkbox</title>
  <meta name="description" content="From deep in the American heartland, our team of craftsmen answers the call for a better web. Driven by a deep belief in the freedom of a web liberated from device constraints, Sparkbox labors with conviction toward a higher standard as we write, educate, and build.">
  <link rel="stylesheet" href="content-style.css" media="screen">
</head>

<body>
  <header>
  <!--Main navigation would be included here.-->
<?php include("navigation.php") ?>
  </header>

<section>
  <h1>We Love a Challenge</h1>
  <p>Alright{, first name}, give us your best answer on the below, and we'll get back to you with our honest opinion.</p>
  
  <label for="">What's the name of your organization?</label><br />
  <input type="text" name="organization" value="" /><br />
  
  <label for="">What's your target completion date for the project?</label><br />
    <select>
      <option>Select One</option>
      <option>Yesterday</option>
      <option>Within Next Month</option>
      <option>Within Next Three Months</option>
      <option>Within Next Six Months</option>
      <option>Within Next Year</option>
      <option>Staff Augmentation</option>
    </select>
  <br />
  
  <label for="">What is your budget?</label>
    <select>
      <option>Select One</option>
      <option>$100,000+</option>
      <option>$50,000+</option>
      <option>$25,000+</option>
      <option>Less Than $25,000</option>
      <option>Peanuts</option>
    </select>
  <br />

  <label for="">Tell us a little about the project.</label><br />
  <small>What are the major goals of the project? What will it take to call it a success? What role would you like us to play? What technologies or functionalities will be involved?</small><br />
  <textarea></textarea><br />
  
  <label for="">Your email address</label><br />
  <input type="text" name="email" value="" />
  <br />
  
  <button><a href="contact-project-done.php">Send to Sparkbox</a></button>
</section>

<!--Footer featured some of our past clients' logos, but we only show logos for clients for whom we have work in our work section.	-->

<?php include("footer.php") ?>

</body>
</html>

