<?php
session_start();
?>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="style.css">

    <title>SQL Challenge</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: #fff3dc;   /* your page background */
    }

    .navbar {
        background-color: #fff3dc !important;
        border-bottom: 1px solid #e6d2a8;
    }

    .navbar a {
        color: #000000ff !important;
        font-weight: 500;
    }

    .navbar a:hover {
        text-decoration: underline;
    }
</style>





</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.php">HOME</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">

                    <a class="nav-link" href="sql.php">SQL</a>
                    <a class="nav-link" href="answer.php">ANSWER</a>
                    <a class="nav-link" href="schema.php">SCHEMA</a>
                </div>
            </div>
        </div>
    </nav>

<div class="container mt-4">

    <h2>SQL Murder Mystery</h2>
    <p>Write your SQL query below:</p>

    <form method="post">
        <textarea name="user_sql"
                  class="form-control"
                  rows="3"
                  placeholder="SELECT * FROM table_name WHERE condition;"
                  required></textarea>
        <br>
        <input type="submit" class="btn btn-primary" value="Run SQL">
    </form>

<?php
/* ================= DATABASE CONNECTION ================= */

// IMPORTANT:
// Ideally this should be a READ-ONLY user and CASE database
$conn = pg_connect("host=localhost dbname=level_1 user=sqluser password=root");

if (!$conn) {
    die("<p class='text-danger'>Database connection failed</p>");
}

/* ================= RUN USER QUERY ================= */

$user_sql = $_POST['user_sql'] ?? '';

if ($user_sql != '') {

    $result = pg_query($conn, $user_sql);

    if (!$result) {
        echo "<div class='alert alert-danger mt-3'>
                Error: " . pg_last_error($conn) . "
              </div>";
    } else {

        $num_rows = pg_num_rows($result);

        if ($num_rows == 0) {
            echo "<div class='alert alert-warning mt-3'>
                    Query executed successfully, but no records found.
                  </div>";
        } else {

            echo "<h4 class='mt-4'>Query Result</h4>";
            echo "<table class='table table-bordered table-striped mt-2'>";

            /* ---------- TABLE HEADER ---------- */
            echo "<thead><tr>";
            $num_fields = pg_num_fields($result);
            for ($i = 0; $i < $num_fields; $i++) {
                echo "<th>" . pg_field_name($result, $i) . "</th>";
            }
            echo "</tr></thead>";

            /* ---------- TABLE BODY ---------- */
            echo "<tbody>";
            while ($row = pg_fetch_assoc($result)) {
                echo "<tr>";
                foreach ($row as $value) {
                    echo "<td>" . htmlspecialchars($value) . "</td>";
                }
                echo "</tr>";
            }
            echo "</tbody>";

            echo "</table>";
        }
    }
}
?>

</div>

</body>
</html>
