<?php

//This PHP script retrieves and returns event and attendee data for an organizer using their API key. 

// Include connection to database
include '../database_connection/database_connection.php';


// Function to get user ID by using the API key
function getUserIdByApiKey($api_key, $conn) {
    // Check if there is an organizer with the same API key
    $query = "SELECT user_id FROM Event_Organizer WHERE api_key = '$api_key'";
    $result = mysqli_query($conn, $query);

    // Return user_id if found
    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        return $row['user_id'];
    } else {
        return null;
    }
}

// Function to get organizer events and attendees
function getEventsAndAttendees($organizer_id, $conn) {
    //get all events for the specified organizer
    $query_events = "SELECT * FROM Event WHERE user_id = '$organizer_id'";
    $resultEvents = mysqli_query($conn, $query_events);

    // Fetch event data and store it in an array
    $events = [];
    while($row = mysqli_fetch_assoc($resultEvents)) {
        $events[] = $row;
    }

    // For each event, get the attendees
    foreach ($events as &$event) {
        $query_attendees = "SELECT u.user_id, u.name, u.surname, u.email, u.profile_picture, a.school_name, a.bio FROM Event_Members em JOIN User u ON em.user_id = u.user_id JOIN Attendee a ON u.user_id = a.user_id WHERE em.event_id = '{$event['event_id']}'";
        $resultAttendees = mysqli_query($conn, $query_attendees);

        // Fetch attendee data and store it in an array
        $attendees = [];
        while($row = mysqli_fetch_assoc($resultAttendees)) {
            $attendees[] = $row;
        }
        $event['attendees'] = $attendees;
    }

    return $events;
}

// Get API key from request header
$api_key = $_SERVER['HTTP_API_KEY'] ?? null;
// Get organizer_id by API key
$organizer_id = getUserIdByApiKey($api_key, $conn);

// If organizer_id is not found, return an error response
if (!$organizer_id) {
    header('Content-Type: application/json');
    http_response_code(401);
    echo json_encode(['error' => 'Invalid API key']);
    exit;
}

// Get event and attendee data for the organizer
$eventsData = getEventsAndAttendees($organizer_id, $conn);
// Convert data to JSON
$eventsJson = json_encode($eventsData, JSON_PRETTY_PRINT);

// Return the JSON data
header('Content-Type: application/json');
echo $eventsJson;
