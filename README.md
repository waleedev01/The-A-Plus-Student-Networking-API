# The A+ Student Networking API

The A+ Student Networking API is a RESTful API designed to provide a reliable and secure communication interface between the A+ Student Networking App and the backend database. It ensures smooth data exchange, facilitating functionalities such as user authentication, and event management.

## Features

* **User Authentication** : The API enables secure authentication.
* **Event Management** : The API provides endpoint for and viewing events.

## Deployment

The A+ Student Networking API can be deployed both locally and on AWS. Follow the instructions below for the desired deployment method.

### Local Deployment PHP REST API

1. Install a web server, such as XAMPP, Nginx, or another web server that supports PHP, on your local machine or server.
2. Import the SQL Dump file provided in the `SQL` folder into your MySQL database. Alternatively, you can use the existing AWS Relational Database Service connection.
3. Update the `database_connection` file in the `database_connection` folder with your database credentials or use the existing AWS RDS connection.
4. Place the `the-a-plus-student-networking-api` folder in your web server's root directory (e.g., htdocs for XAMPP or /var/www/html for Nginx).
5. To test the PHP REST API endpoint, use an application like Postman to send API requests with the following parameters:

   - HTTP Method: `GET`
   - URL: `http://localhost/the-a-plus-student-networking-api/code/getEvents.php` (This URL assumes you are using XAMPP; the URL may change depending on your web server configuration.)
   - Request Headers:
     - Key: API-Key
     - Value: You can find the API key on the `the-a-plus-student-networking-app/api/viewApiKey.php` page (you should be logged in with an organizer account) of the `a-plus-student-networking-app`. For your convenience, I have provided the API key from the test account: `5fce3473d49db416dba08d85d9599b7f9664777920c1509da8b5a01fae10`.
6. Send the request, and you will receive a list of events created by the organizer, along with the attendee details for each event. This will allow you to test the functionality and performance of the REST API endpoint.

### AWS Deployment PHP REST API

1. To test the PHP REST API endpoint deployed on AWS, use an application like Postman to send API requests with the following parameters:

   - HTTP Method: `GET`
   - URL: `http://aplusnetworkapi.us-east-1.elasticbeanstalk.com/code/getEvent.php`
   - Request Headers:
     - Key: API-Key
     - Value: You can find the API key on the `the-a-plus-student-networking-app/api/viewApiKey.php` page (you should be logge in with an organizer account) of the `a-plus-student-networking-app`. For your convenience, I have provided the API key from the test account: `5fce3473d49db416dba08d85d9599b7f9664777920c1509da8b5a01fae10`.
2. Send the request, and you will receive a list of events created by the organizer, along with the attendee details for each event. This will allow you to test the functionality and performance of the REST API endpoint deployed on AWS.

### Local Deployment GO REST API

1. Run the executable file named `main` in the `go` folder.
2. To test the PHP REST API endpoint deployed on AWS, use an application like Postman to send API requests with the following parameters:

   - HTTP Method: `GET`
   - URL: `http://localhost:9000/events`, (This URL assumes you are running the Go REST API on your local machine with the default port `9000`. You may need to change the URL if you have modified the default settings or deployed the API on a different server.)
   - Request Headers:
     - Key: API-Key
     - Value: You can find the API key on the `the-a-plus-student-networking-app/api/viewApiKey.php` page (you should be logge in with an organizer account) of the `a-plus-student-networking-app`. For your convenience, I have provided the API key from the test account: `5fce3473d49db416dba08d85d9599b7f9664777920c1509da8b5a01fae10`.
3. Send the request, and you will receive a list of events created by the organizer, along with the attendee details for each event. This will allow you to test the functionality and performance of the GO REST API endpoint deployed locally.

## Usage

1. Make RESTful API requests using an HTTP client such as Postman, cURL, or an integrated client within your web application.
2. Refer to the API documentation for information on the available endpoints, request methods, and expected request and response formats.


## Notes

1. The API is designed for use with the A+ Student Networking App and should be accessed using an API key provided by the app's organizers. Unauthorized use is strictly prohibited.
1. Due to technical and time constraints, the Go REST API endpoint has not been deployed on AWS. Please keep this in mind when using the API.

## Contributions and Support

Please feel free to submit issues or pull requests for improvements and bug fixes. If you need help or have questions about the project, please reach out to the maintainer.

Email: [waleed.hassan.2@city.ac.uk](mailto:waleed.hassan.2@city.ac.uk)
