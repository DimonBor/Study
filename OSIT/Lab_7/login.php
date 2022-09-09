<html>
<head>
  <meta charset="utf-8">
  <title>Lab 5</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
  <meta http-equiv="refresh" content="1;URL=login.html" />
</head>
<body>
  <main class="w-100 h-100 align-items-center">
    <header class="p-3 bg-dark text-white fixed-top">
      <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
          <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
            <li><a href="index.html" class="nav-link px-2 text-white">Home</a></li>
            <li><a href="images.html" class="nav-link px-2 text-white">Images</a></li>
            <li><a href="jumbotron.html" class="nav-link px-2 text-white">Jumbotron</a></li>
            <li><a href="carousel.html" class="nav-link px-2 text-white">Carousel</a></li>
          </ul>

          <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
            <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
          </form>

          <div class="text-end">
            <a href="login.html" class="btn btn-outline-light me-2">Login</a>
            <a href="sign_up.php" class="btn btn-warning me-2 disabled">Sign Up</a>
          </div>
        </div>
      </div>
    </header>
  <div class="container position-absolute top-50 start-50 translate-middle-x">
    <div class="d-flex text-center">
      <?php
        $filename = "data.log";

        $handle = fopen($filename, "r");

        while (!feof($handle)) {
          $buffer = fgets($handle);
          $arr = explode(" ", $buffer);
          if ($_POST["Email"] === $arr[0] && $_POST["Password"] === $arr[1]){
            echo "<h1>Авторизація Успішна!</h1>";
            fclose($handle);
            exit();
          }
        }

        echo "<h1>Помилка авторизації</h1>";
        fclose($handle);
        exit();
      ?>
    </div>
  </div>
  </main>
  <div class="container-fluid fixed-bottom">
    <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
      <div class="col-md-4 d-flex align-items-center">
        <span class="text-muted">© 2021 Company, Inc</span>
      </div>
    </footer>
  </div>
</body>
</html>
