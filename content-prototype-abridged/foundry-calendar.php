<!doctype html>

<html>
<head>
  <title>Sparkbox Calendar</title>
  <meta name="description" content="">
  <link rel="stylesheet" href="content-style.css" media="screen">
</head>

<body>
  <header>
    <!--Main navigation would be included here.-->
    <?php include("navigation.php") ?>
  </header>
  <h1>Foundry Calendar</h1>
  <h2>We Really Like To Be Teach</h2>
  <section class="listing">
    <article class="featured post">
     <a href="foundry-calendar-detail.php"><img src="" alt="Featured Image" /></a>
     <h1><a href="foundry-calendar-detail.php">Coverge SE 2013</a></h1>
     <h2><time datetime="2013-04-25">4-25-13</time> | Columbis, SC</h2>
     <p>Now in its fourth year, Converge SE has established itself as a fantastic conference bringing together leaders in design, development, and marketing. Sparkbox is honored to join the list of speakers for 2013.</p>
     <h3>Who's Going: <a href="#">Rob Harr</a>, <a href="#">Rob Tarr</a>, <a href="#">Ben Callahan</a> and <a href="#">Ethan Muller</a></h3>
   	</article>

    <article class="post">
     <h1><a href="foundry-calendar.php">Dayton Clean Coders</a></h1>
     <h2><time datetime="2013-05-07">5-7-13</time> | Little Lines HQ</h2>
     <p>Dayton Clean Coders provides an environment to teach, learn, and experiment with software development patterns, practices, and tools for creating high quality software which can change at the pace of our customers.</p>
     <h3>Who's Going: <a href="#">Team</a></h3>
   	</article>

    <article class="post">
     <h1><a href="foundry-calendar.php">Build Guild</a></h1>
     <h2><time datetime="2013-15-07">5-15-13</time> | Dayton, OH</h2>
     <p>Build Guild is a national group of local meetups for web geeks centered around great conversations instead of dry presentations.</p>
     <h3>Who's Going: <a href="#">Team</a></h3>
   	</article>
  </section>

<!--Listing page will display 5-8 per page-->

<footer class="nextpage">
  <p><a href="foundry-calendar.php">Older Events</a><p>
  </footer>


  <!--Footer featured some of our past clients' logos.-->
  <?php include("footer.php") ?>
</body>
</html>