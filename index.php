<?php
session_start();

?>
<!DOCTYPE html>
<html>

<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

    <style>
    body {
        background: linear-gradient(180deg, #fff7e6, #f5e6c8);
        min-height: 100vh;
    }

    .card {
        border-radius: 10px;
        background-color: #fffaf0;
    }

    .navbar {
        background-color: #fff3d6 !important;
        border-bottom: 1px solid #e6d8b8;
    }
</style>


</head>



<body>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>

    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.php">HOME</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
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

    <!-- Case Brief Card -->
    <div class="card shadow-sm mb-4">
        <div class="card-body">

            <h4 class="mb-3">📂 Case Brief </h4>

            <p>
                A crime has taken place and the detective needs your help.
                The detective gave you the crime scene report, but you somehow lost it.
                You vaguely remember that the crime was a <strong>murder</strong>
                that occurred sometime on <strong>Jan 15, 2018</strong>
                and that it took place in <strong>SQL City</strong>.
            </p>

            <p>
                Start by retrieving the corresponding crime scene report
                from the police department’s database.
            </p>

        </div>
    </div>

    <!-- Name Input Card -->
    <div class="card shadow-sm">
        <div class="card-body">

            <h5 class="mb-3">🕵️ Detective Details</h5>

            <form method="post">
                <input type="text"
                       name="name"
                       class="form-control mb-3"
                       placeholder="Enter your name"
                       required>

                <button type="submit" class="btn btn-primary">
                    Submit
                </button>
            </form>

        </div>
    </div>

</div>

    <?php

    // PostgreSQL connection
    $conn = pg_connect("host=localhost dbname=event user=phpuser password=root");

    if (!$conn) {
        die("Database connection failed");
    }

    // Get input
    $name = $_POST['username'] ?? '';
    $_SESSION['name'] = $name;
    if ($name != '') {
        // Insert into database
        $query = "INSERT INTO users (name) VALUES ('$name')";
        pg_query($conn, $query);

        echo "Hello " . $name . ", your name is saved!";
    }
    ?>

</body>

</html>