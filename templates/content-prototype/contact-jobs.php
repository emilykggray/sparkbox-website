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
  <h1>Join the Fight</h1>
  <p>Well{, first name}, we're glad to meet you. If you're interested in working with us, we'd really like to start getting to know you. Let's start now.</p>
  
  <label for="">What sort of role are you looking for?</label><br />
    <select>
      <option>Select One</option>
      <option>Intern</option>
      <option>Apprentice</option>
      <option>Web Designer</option>
      <option>Front-end Developer</option>
      <option>Back-end Developer</option>
      <option>Office Dog</option>
      <option>Other</option>
    </select>
  <br />
  
  <label for="">Who are you?</label><br />
  <textarea></textarea><br />

  <label for="">Why do you want this?</label><br />
  <textarea></textarea><br />
  
  <label for="">When will you be available?</label><br />
  <textarea></textarea><br />
  
  <label for="">Your relevant account names (on Twitter, Github, Dribbble, etc).</label><br />
  <textarea></textarea><br />

  <label for="">Your email address</label><br />
  <input type="text" name="email" value="" />
  <br />
  
  <button><a href="contact-jobs-done.php">Send to Sparkbox</a></button>
</section>

<!--Footer featured some of our past clients' logos, but we only show logos for clients for whom we have work in our work section.	-->

<?php include("footer.php") ?>

</body>
</html>

