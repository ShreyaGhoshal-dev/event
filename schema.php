<?php
$conn = pg_connect("host=localhost dbname=cases user=sqluser password=root");
?>

<!DOCTYPE html>
<html>
<head>
    <title>Schema</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
    .schema-card {
        background-color: #fff3cd;
        border-radius: 10px;
        padding: 15px;
        margin-bottom: 12px;
        font-size: 18px;
        font-weight: 500;
    }
    </style>
</head>

<body>

<ul class="nav nav-tabs mt-3 px-3">
  <li class="nav-item">
    <a class="nav-link" href="index.php">Home</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="sql.php">SQL</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" href="schema.php">Schema</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="answer.php">Answer</a>
  </li>
</ul>

<div class="container mt-4">
<?php
$result = pg_query($conn,"
    SELECT table_name
    FROM information_schema.tables
    WHERE table_schema='public'
");

while ($row = pg_fetch_assoc($result)) {
    echo "<div class='schema-card'>🗂 {$row['table_name']}</div>";
}
?>
</div>

</body>
</html>
