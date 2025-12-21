<?php
$conn = pg_connect("host=localhost dbname=cases user=sqluser password=root");
?>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">


    <title>Schema</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
    .schema-card {
        background-color: #fff1ad;
        border-radius: 10px;
        padding: 15px;
        margin-bottom: 12px;
        font-size: 18px;
        font-weight: 500;
    }

    body {
            background: linear-gradient(180deg, #FFFFF0);
            min-height: 100vh;
            font-family: 'Segoe UI', sans-serif;
        }

    </style>
</head>

<body>

<nav class="navbar navbar-expand-lg custom-navbar">
    <div class="container-fluid">
        <span class="navbar-brand fw-bold">HOME</span>

        <div class="ms-auto">
            <a class="nav-link d-inline px-3" href="sql.php">SQL</a>
            <a class="nav-link d-inline px-3" href="answer.php">ANSWER</a>
            <a class="nav-link d-inline px-3" href="schema.php">SCHEMA</a>
        </div>
    </div>
</nav>

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
