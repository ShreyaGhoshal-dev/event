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

        .answer-card {
            background-color: #fff9e8;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 20px 40px rgba(68, 26, 2, 0.08);
            border: 1px solid rgba(68, 26, 2, 0.05);
        }

        .answer-title {
            color: #441a02;
            font-weight: 800;
            letter-spacing: -0.5px;
        }

        .answer-desc {
            color: #5e2403;
            font-size: 1.1rem;
        }

        .custom-input {
            border-radius: 12px;
            padding: 15px;
            border: 2px solid #e6d2a8;
            background-color: #fff;
            transition: all 0.3s;
        }

        .custom-input:focus {
            border-color: #441a02;
            box-shadow: 0 0 0 4px rgba(68, 26, 2, 0.1);
        }

        .submit-btn {
            background-color: #441a02;
            color: white;
            padding: 12px 35px;
            border-radius: 12px;
            border: none;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #5e2403;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(68, 26, 2, 0.2);
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
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
    include 'db.php';
    $conn = getDBConnection('users' , 'postgres');

    if (!$conn) {
        die("Database connection failed");
    }

    // Get participant's answer
    $answer = $_POST['answer'] ?? '';
    $name = $_SESSION['name'];
    if ($answer != '') {
        // Insert the answer into the table
        $query = "UPDATE  users
        SET ans= '$answer'
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