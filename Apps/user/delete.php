<?php
require_once '../../config/db_cbt_v1.php';

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id'])) {
    $id = $_POST['id'];

    // Start a transaction
    $conn->begin_transaction();

    try {
        // Check for foreign key constraints
        $check_sql = "SELECT TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
                      FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
                      WHERE REFERENCED_TABLE_SCHEMA = DATABASE()
                      AND REFERENCED_TABLE_NAME = 't_users'
                      AND REFERENCED_COLUMN_NAME = 'id'";

        $result = $conn->query($check_sql);
        $constraints = [];
        while ($row = $result->fetch_assoc()) {
            $constraints[] = $row;
        }

        // If there are constraints, we need to handle them
        foreach ($constraints as $constraint) {
            $delete_related_sql = "DELETE FROM {$constraint['TABLE_NAME']} WHERE {$constraint['COLUMN_NAME']} = ?";
            $stmt = $conn->prepare($delete_related_sql);
            $stmt->bind_param("i", $id);
            $stmt->execute();
            $stmt->close();
        }

        // Now delete the user
        $delete_user_sql = "DELETE FROM t_users WHERE id = ?";
        $stmt = $conn->prepare($delete_user_sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $stmt->close();

        // If we've made it this far without an exception, commit the transaction
        $conn->commit();

        echo json_encode(["success" => true]);
    } catch (Exception $e) {
        // An error occurred; rollback the transaction
        $conn->rollback();
        echo json_encode(["success" => false, "error" => $e->getMessage(), "constraints" => $constraints]);
    }
} else {
    echo json_encode(["success" => false, "error" => "Invalid request"]);
}

$conn->close();
