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
  <h1>We Love To Help</h1>
  <p>Thanks{, first name}, we'd love to help your team out. We regularly offer our advice on projects and teach internal teams.</p>
  
  <label for="">What's the name of your organization?</label><br />
  <input type="text" name="organization" value="" /><br />
  
  <label for="">When would you like to see the consultation happen?</label><br />
    <select>
      <option>Select One</option>
      <option>Yesterday</option>
      <option>Within Next Month</option>
      <option>Within Next Three Months</option>
      <option>Within Next Six Months</option>
      <option>Within Next Year</option>
    </select>
  <br />
  
  <label for="">How long of a consultation do you think this may be?</label><br />
    <select>
      <option>Select One</option>
      <option>A One-Day Thing</option>
      <option>Several Days</option>
      <option>As long as it takes.</option>
    </select>
  <br />
  
  <label for="">Tell us a little about what you're looking for.</label><br />
  <small>Do you want us to come into your organization for an onsite consultation? Are you looking for a series of calls and conversations? What kind of work do you need help with?</small><br />
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

