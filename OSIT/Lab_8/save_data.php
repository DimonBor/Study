<html>
<head>
  <meta charset="utf-8">
  <title>Lab 8</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</head>
<body>
  <main class="w-100 h-100 align-items-center">
    <header class="p-3 bg-dark text-white fixed-top">
      <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">


          <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
            <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
          </form>

          <div class="text-end">
            <a href="sign_up.php" class="btn btn-warning me-2 disabled">Sign Up</a>
          </div>
        </div>
      </div>
    </header>
  <div class="container position-absolute top-50 start-50 translate-middle-x">
    <div class="d-flex text-center">
      <?php

        $start_time = microtime();
        $start_array = explode(" ",$start_time);
        $start_time = $start_array[1] + $start_array[0];
        $filename = "data.log";


        $secretKey = "6Lfp_iUdAAAAAL9HNb664OteGDFsSJZvCisyXu-f";

        $array = array(
        	'secret' => $secretKey,
        	'response' => $_POST["g-recaptcha-response"]
        );

        $ch = curl_init('https://www.google.com/recaptcha/api/siteverify');
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $array);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_HEADER, false);
        $html = curl_exec($ch);
        curl_close($ch);

        $response = json_decode($html, true);

        if ($response["success"]) {
          echo "<div><h1>Капча пройдена успішно</h1></div>";
        }
        else {
          echo "<div><h1>Помилка капчі!</h1></div>";
        }


        if ($_POST["Password"] !== $_POST["repeatPassword"]) {
          echo "<h1>Помилка реєстрації! Паролі не співпадають</h1>";
          exit();
        }

        echo "</div>";
        echo '<div class="d-flex text-center">';
        $handle = fopen($filename, "a+");

        $str = $_POST["Email"]." ".$_POST["Password"]." ".($_POST["isStudent"]=="True" ? "True" : "False")." ".$_POST["dateOfBirth"]."\n";

        if (fwrite($handle, $str) === FALSE) {
          echo "<h1>Помилка збереження</h1>";
        }
        else {
          echo "<h1>Дані збережено</h1>";
        }
        fclose($handle);
        echo "</div>";

        echo '<div class="d-flex text-center">';
        $end_time = microtime();
        $end_array = explode(" ",$end_time);
        $end_time = $end_array[1] + $end_array[0];
        $time = $end_time - $start_time;
        echo "\n <h3>Сторінка сгенерована за ".$time." секунд</h3>";
        echo "</div>";

        echo '<div class="d-flex text-center">';
        $start = $_POST["dateOfBirth"];
        $startTime = new Datetime($start);
        $endTime = new DateTime();
        $diff = $endTime->diff($startTime);
        echo 'З вашого дня народження пройшло<br/>';
        echo 'років: '.$diff->format('%y').'<br/>';
        echo 'місяців: '.$diff->format('%m').'<br/>';
        echo 'днів: '.$diff->format('%d').'<br/>';
        echo 'годин: '.$diff->format('%H').'<br/>';
        echo 'хвилин: '.$diff->format('%i').'<br/>';
        echo 'секунд: '.$diff->format('%s').'<br/>';
        echo "</div>";

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
