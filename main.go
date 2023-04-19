package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
)

type Event struct {
	EventID     int        `json:"event_id"`
	Name        string     `json:"name"`
	Location    string     `json:"location"`
	Description string     `json:"description"`
	StartDate   mysql.NullTime `json:"start_date"`
	EndDate     mysql.NullTime `json:"end_date"`
	UserID      int        `json:"user_id"`
	Attendees   []Attendee `json:"attendees"`
}

type Attendee struct {
	UserID         int    `json:"user_id"`
	Name           string `json:"name"`
	Surname        string `json:"surname"`
	Email          string `json:"email"`
	ProfilePicture string `json:"profile_picture"`
	SchoolName     string `json:"school_name"`
	Bio            string `json:"bio"`
}

var db *sql.DB
var err error

func main() {
	// Set up database connection
	db, err = sql.Open("mysql", "admin:admin123@tcp(awseb-e-kjywjhzu8p-stack-awsebrdsdatabase-eqsp4bnalizd.chttsa0blrl0.us-east-1.rds.amazonaws.com:3306)/ebdb")

if err != nil {
    log.Fatal("Cannot connect to database:", err)
}

if err = db.Ping(); err != nil {
    log.Fatal("Failed to ping database:", err)
}

defer db.Close()


	// Initialize the router
	initializeRouter()
}

func initializeRouter() {
	r := mux.NewRouter()

	// Add the desired routes
	r.HandleFunc("/events", getEventsAndAttendees).Methods("GET")
	// Add more routes here if needed

	// Start the server
	log.Fatal(http.ListenAndServe(":9000", r))
}

func getUserIdByApiKey(apiKey string) (int, error) {
	var userId int
	err := db.QueryRow("SELECT user_id FROM Event_Organizer WHERE api_key = ?", apiKey).Scan(&userId)

	if err != nil {
		return 0, err
	}

	return userId, nil
}

func getEventsAndAttendees(w http.ResponseWriter, r *http.Request) {
    apiKey := r.Header.Get("API-Key")
    organizerId, err := getUserIdByApiKey(apiKey)

    if err != nil {
        w.WriteHeader(http.StatusUnauthorized)
        fmt.Fprint(w, `{"error": "Insvalid API key"}`)
        fmt.Print(apiKey)
        return
    }

    rows, err := db.Query("SELECT event_id, name, location, description, start_date, end_date, user_id FROM Event WHERE user_id = ?", organizerId)
    if err != nil {
        w.WriteHeader(http.StatusInternalServerError)
        fmt.Fprint(w, `{"error": "Error fetching events"}`)
        return
    }
    defer rows.Close()

    var events []Event
    for rows.Next() {
        var event Event
        err = rows.Scan(&event.EventID, &event.Name, &event.Location, &event.Description, &event.StartDate, &event.EndDate, &event.UserID)
        if err != nil {
            w.WriteHeader(http.StatusInternalServerError)
            fmt.Fprint(w, `{"error": "Error fetching event data"}`)
            log.Printf("Error scanning event data: %v\n", err) // Add this line
            return
        }

        event.Attendees, err = getAttendeesForEvent(event.EventID)
        if err != nil {
            w.WriteHeader(http.StatusInternalServerError)
            fmt.Fprint(w, `{"error": "Error fetching attendees"}`)
            return
        }

        events = append(events, event)
    }

    err = rows.Err()
    if err != nil {
        w.WriteHeader(http.StatusInternalServerError)
        fmt.Fprint(w, `{"error": "Error fetching events"}`)
        return
    }

    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(events)
}


func getAttendeesForEvent(eventId int) ([]Attendee,error) {
	rows, err := db.Query("SELECT u.user_id, u.name, u.surname, u.email, u.profile_picture, a.school_name, a.bio FROM Event_Members em JOIN User u ON em.user_id = u.user_id JOIN Attendee a ON u.user_id = a.user_id WHERE em.event_id = ?", eventId)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var attendees []Attendee
	for rows.Next() {
		var attendee Attendee
		err = rows.Scan(&attendee.UserID, &attendee.Name, &attendee.Surname, &attendee.Email, &attendee.ProfilePicture, &attendee.SchoolName, &attendee.Bio)
		if err != nil {
			return nil, err
		}
		attendees = append(attendees, attendee)
	}

	err = rows.Err()
	if err != nil {
		return nil, err
	}

	return attendees, nil

}