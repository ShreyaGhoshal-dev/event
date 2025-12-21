<?php
$conn = pg_connect("host=localhost dbname=level_1 user=sqluser password=root");
?>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">


    <title>Schema</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
    body {
        background: linear-gradient(180deg, #fff7e6, #f5e6c8);
        min-height: 100vh;
        font-family: 'Segoe UI', sans-serif;
    }

    /* Modern Navbar */
    .navbar {
        background-color: rgba(253, 242, 217, 0.95) !important;
        backdrop-filter: blur(10px);
        border-bottom: 1px solid rgba(68, 26, 2, 0.1);
    }

    .navbar-brand {
        color: #441a02 !important;
        font-weight: 800;
        letter-spacing: 1px;
    }

    .nav-link {
        color: #441a02 !important;
        font-weight: 600;
        margin: 0 10px;
        transition: all 0.3s ease;
    }

    .nav-link:hover {
        color: #8a3c04 !important;
        transform: translateY(-1px);
    }

    h2 {
        color: #441a02;
        font-weight: 800;
        letter-spacing: -0.5px;
    }

    .schema-card {
        background-color: #fff9e8;
        border-radius: 12px;
        padding: 20px;
        margin-bottom: 15px;
        font-size: 18px;
        font-weight: 600;
        color: #441a02;
        
        /* Modern touches */
        border-left: 6px solid #441a02;
        border-right: 1px solid rgba(68, 26, 2, 0.05);
        border-top: 1px solid rgba(68, 26, 2, 0.05);
        border-bottom: 1px solid rgba(68, 26, 2, 0.05);
        
        box-shadow: 0 10px 20px rgba(68, 26, 2, 0.05);
        transition: all 0.3s ease;
    }

    .schema-card:hover {
        transform: translateX(5px) translateY(-2px);
        box-shadow: 0 15px 30px rgba(68, 26, 2, 0.1);
        background-color: #fff;
    }

    </style>
</head>

<body>

<nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="lvl1.php">HOME</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">

                    <a class="nav-link" href="lvl1_sql.php">SQL</a>
                    <a class="nav-link" href="answer.php">ANSWER</a>
                    <a class="nav-link" href="lvl1_schema.php">SCHEMA</a>
                </div>
            </div>
        </div>
    </nav>
<div class="container mt-5">
    <h2 class="mb-4">Database Tables</h2>
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
