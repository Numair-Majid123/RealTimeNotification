# Real-Time SMS Notification System with Rails 7

This Ruby on Rails application demonstrates a Real-Time SMS Notification System using the latest features of Rails 7. The system sends real-time SMS notifications in response to specific triggers, such as a new user sign-up or meeting a certain threshold. The implementation integrates with an SMS API, and for this example, Twilio is used as the SMS provider.

## Project Information

- **Ruby version:** 3.3.0
- **Rails version:** 7.1.2

## Environment Variables

Before running the application, make sure to set the following environment variables in your `.env` file:

```dotenv
TWILIO_PHONE_NUMBER='YourTwilioPhoneNumber'
TWILIO_ACC_SID='YourTwilioAccountSID'
TWILIO_AUTH_TOKEN='YourTwilioAuthToken'
```

## System Dependencies
Make sure you have the following dependencies installed on your system:

- Ruby (version 3.3.0)
- Rails (version 7.1.2)
- Docker (optional, for containerized deployment)

## Configuration

- Install the required gems:
```
bundle install
```

- Create the database and run migrations:
```
rails db:create
rails db:migrate
```

- How to Run the Test Suite
```
bundle exec rspec
```

- How to Check the Rubocop offence
```
bundle exec rubocop
```

## Local Deployment
```
rails server
```
Visit http://localhost:3000 in your browser.

## Docker Deployment

- Build the Docker image:
```
docker build -t realtime-sms-notifications .
```

- Run the Docker container:
```
docker run -p 3000:3000 -e RAILS_ENV=development -v /Users/dev/realTimeNotification:/rails realtimenotification
```

## Trigger-Based Notifications
The application allows you to set up triggers within the application that initiate SMS notifications. You can configure triggers based on user actions or specific application states.

## SMS API Integration
The application integrates with the Twilio SMS API to send real-time notifications. Make sure to provide the required Twilio account SID, auth token, and phone number in the environment variables.
