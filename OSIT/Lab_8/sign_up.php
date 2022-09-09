<!DOCTYPE html>
<html lang="en" class="h-100">
  <head>
    <title>Lab 8</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://getbootstrap.com/docs/5.0/examples/sign-in/signin.css">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
  </head>
  <body>
    <main class="w-100">
      <header class="p-3 bg-dark text-white fixed-top">
        <div class="container">
          <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
              <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
            </form>

            <div class="text-end">
              <a href="sign_up.html" class="btn btn-warning me-2 disabled">Sign Up</a>
            </div>
          </div>
        </div>
      </header>

      <div class="text-center flex">
        <div class="form-signin">
          <h1 class="mb-3">Register page</h1>
          <form action="save_data.php" method="post">
            <div class="form-floating mb-3">
              <input type="email" name="Email" class="form-control" id="floatingInput" placeholder="name@example.com">
              <label for="floatingInput">Email address</label>
            </div>
            <div class="form-floating">
              <input type="password" name="Password" class="form-control" id="floatingPassword" placeholder="Password">
              <label for="floatingPassword">Password</label>
            </div>
            <div class="form-floating">
              <input type="password" name="repeatPassword" class="form-control" id="floatingPassword" placeholder="Password" required>
              <label for="floatingPassword">Repeat password</label>
            </div>
            <div class="form-floating">
              <input type="date" name="dateOfBirth" class="form-control" required>
              <label for="floatingInput">Дата народження</label>
            </div>
            <div class="g-recaptcha mt-3" data-sitekey="6Lfp_iUdAAAAAHIMYBug1xqYkE_L0U_6Pep2L4vP"></div>
            <br/>
            <div class="checkbox mb-1">
              <label>
                <input type="checkbox" name="isStudent" value="True"> I'm Student
              </label>
            </div>
            <div class="btn-group mt-3" role="group" aria-label="Buttons">
              <button type="submit" value="Submit" class="btn btn-warning">Sign Up</button>
              <a href="login.html" class="btn btn-primary">or Login</a>
            </div>
          </form>
        </div>
      </div>

      <div class="container-fluid fixed-bottom">
        <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
          <div class="col-md-4 d-flex align-items-center">
            <span class="text-muted">
              <?php
                $today = getdate();
                $months = array(
                  "January" => "Січня",
                  "February" => "Лютого",
                  "March" => "Березня",
                  "April" => "Квітня",
                  "May" => "Травня",
                  "June" => "Червня",
                  "July" => "Липня",
                  "August" => "Серпня",
                  "September" => "Вересня",
                  "Octomber" => "Жовтня",
                  "November" => "Листопада",
                  "December" => "Грудня",
                );
                echo $today["mday"]." ".$months[$today["month"]]." ".$today["year"];
              ?>
            </span>
          </div>
        </footer>
      </div>
    </main>
  </body>
</html>
