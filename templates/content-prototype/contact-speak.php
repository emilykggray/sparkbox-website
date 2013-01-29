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
  <h1>We Love the Conversation</h1>
  <p>Really{, first name}, you'd like to invite us to speak? We're honored. Really. Tell us a bit about the event, and we'll get back with you soon!</p>
  
  <label for="">What's the name of your organization?</label><br />
  <input type="text" name="organization" value="" /><br />
  
  <label for="">When is the event?</label><br />
  <input type="date" name="event date" value="" /><br />
  
  <label for="">Tell us a little about the event.</label><br />
  <small>Who will be attending this event? How many will be attending? Is there a topic you hoped to have us cover?</small><br />
  <textarea></textarea><br />
  
  <label for="">Your email address</label><br />
  <input type="text" name="email" value="" />
  <br />
  
  <button><a href="contact-speak-done.php">Send to Sparkbox</a></button>
</section>

<!--Footer featured some of our past clients' logos, but we only show logos for clients for whom we have work in our work section.	-->

<?php include("footer.php") ?>

</body>
</html>

