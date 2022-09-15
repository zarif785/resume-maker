# resume_maker

A mobile application for creating a resume where Laravel was used for the backend and Flutter was used for the frontend

## About this project

This mobile application creates a resume based on various input fields from the user. Such as personal info, academic,professional etc. and stores them in the database. After all the input fields are completed the application will redirect them to a page where the user can choose various templates for their resume. One can create a new resume or update the old one, after they have signed in

## Functionalities

API:

POST: http://cv-api.bacbontutors.com/login - For user login 

POST: http://cv-api.bacbontutors.com/register - For user registration

POST: http://cv-api.bacbontutors.com/user-update - For updating user information

POST: http://cv-api.bacbontutors.com/academic-create-or-update - For updating user's academic information

DELETE: http://cv-api.bacbontutors.com/user-academic-information-delete/${id} - For deleting a particular academic information

GET: http://cv-api.bacbontutors.comuser-academic-information-list - Fetching user's all academic info

##UI

![Screenshot_1663235016](https://user-images.githubusercontent.com/63856140/190381855-b77ad59e-8233-4301-adda-e702e6ebd30e.png)
![Screenshot_1663236866](https://user-images.githubusercontent.com/63856140/190381910-cd03f1c8-994a-4e6c-8b2c-67d9c35853df.png)




## Tech Stack

1. Flutter
2. Laravel
3. Postman
4. Intellij CE (Editor)
5. Visual Studio Code
