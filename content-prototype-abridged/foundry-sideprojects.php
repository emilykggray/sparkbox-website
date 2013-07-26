<!doctype html>

<html>
<head>
  <title>Sparkbox Side Projects</title>
  <meta name="description" content="">
  <link rel="stylesheet" href="content-style.css" media="screen">
</head>

<body>
  <header>
    <!--Main navigation would be included here.-->
    <?php include("navigation.php") ?>
  </header>
  <h1>Foundry Side Projects</h1>
  <h2>We Really Like To Build</h2>
  <section class="listing">
    <article class="featured post">
     <a href="foundry-sideprojects-detail.php"><img src="" alt="Featured Image" /></a>
     <h1><a href="foundry-sideprojects-detail.php">Media Query Bookmarklet</a></h1>
     <h2>Contributors: <a href="#">Rob Tarr</a> and <a href="#">Potential Other Author</a></h2>
     <p>We created this bookmarklet to aid in designing responsive websites. Now you can always know what media query just triggered. Never again will you lose track of where you are. </p>
   </article>

   <article class="post">
     <h1><a href="#">Cool Side Projects</a></h1>
     <h2>Contributors: <a href="#">This guy</a></h2>
     <p>Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum.</p>
  </article>

  <article class="post">
     <h1><a href="#">Awesome Side Projects</a></h1>
     <h2>Contributors: <a href="#">This guy</a></h2>
     <p>Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum.</p>
  </article>
</section>
<!--Listing page will display 5-8 per page-->

<footer class="nextpage">
  <p><a href="foundry-sideprojects.php">Next Page</a><p>
  </footer>


  <!--Footer featured some of our past clients' logos.-->
  <?php include("footer.php") ?>
</body>
</html>