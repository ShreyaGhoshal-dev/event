<?php
session_start();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="style.css">

    <meta charset="UTF-8">
    <title>Submit Answer</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background: linear-gradient(180deg, #fdf2d9, #f7f1c6);
            min-height: 100vh;
            font-family: 'Segoe UI', sans-serif;
        }

        .custom-navbar {
            background-color: #fdf2d9;
        }

        .answer-card {
            background-color: #fff9e8;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.08);
        }

        .answer-title {
            color: #7a3e00;
            font-weight: 600;
        }

        .answer-desc {
            color: #a05a00;
        }

        .custom-input {
            border-radius: 10px;
            padding: 12px;
            border: 1px solid #f0b44c;
        }

        .submit-btn {
            background-color: #b85c00;
            color: white;
            padding: 10px 25px;
            border-radius: 10px;
            border: none;
        }

        .submit-btn:hover {
            background-color: #9e4f00;
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
<!-- MAIN CONTENT -->
<div class="container d-flex justify-content-center align-items-center mt-5">
    <div class="col-md-8 answer-card">

        <h2 class="answer-title mb-3">Submit Your Findings</h2>

        <p class="answer-desc">
            Submit the suspect you discovered through your investigation to see if you cracked the case.
        </p>

        <form method="POST" action="">
            <div class="mb-3">
                <label class="form-label fw-semibold">Your Answer</label>
                <input type="text" name="answer" class="form-control custom-input"
                       placeholder="Enter your answer..." required>
            </div>

            <p class="text-muted">
                Enter the specific name you found through your investigation.
            </p>

            <button type="submit" class="submit-btn mt-3">
                Submit Solution
            </button>
        </form>

    </div>
</div>

    
    <?php

    // Connect to PostgreSQL
    $conn = pg_connect("host=localhost dbname=users user=postgres password=root");

    if (!$conn) {
        die("Database connection failed");
    }

    // Get participant's answer
    $answer = $_POST['answer'] ?? '';
    $name = $_SESSION['name'];
    if ($answer != '') {
        // Insert the answer into the table
        $query = "UPDATE  users
        SET answer= '$answer'
        WHERE name= '$name' ";
        $result = pg_query($conn, $query);

        if ($result) {
            echo "<p>Your answer has been saved!</p>";
        } else {
            echo "<p>Error saving answer: " . pg_last_error($conn) . "</p>";
        }
    }
    ?>
    
</body>
</html>