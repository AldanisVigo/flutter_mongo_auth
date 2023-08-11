# Flutter + Node + MongoDB - Authentication System 

Authentication System using a nodejs backend server, MongoDB for storage. Flutter for the frontend.

This can be used to create a full stack web, mobile or desktop application.

## Login View
The login view features a HookWidget with fields for the user's email and password, as well as a button to attempt logging in.
There's also a button that leads to the registration view.

When the user clicks the login button, a request is sent to the backend nodejs server which processes the request
and checks for user credentials by hashing the incoming password and checking against the hashsed password stored
in MongoDB. If a match occurs then the user is allowed to log in and the Dashboard view is presented.

## Registration View
The registration view features a HookWidget with fields for the user's full name, email, password and password confirmation.
There's also a button to initiate the registration.

When the user clicks the register button, a request is sent to the backend nodejs server which processes the request
and checks that there's not already an account for that user. If not, the request is processed and a new user is stored
in the MongoDB database. Otherwise an error message is sent back to the client.

When the user is successfully registered, the dashboard view is presented.

## Dashboard View
The dashboard view is a generic view that represents the authenticated side of the application. That is, the content that is visible once the user is fully authenticated. The user will see this view when they have successfully logged into the application.


