--- INTRODUCTION ---

This is an Amazon-like MySQL database from normalized ERD, and a web-client in PHP, JavaScript



--- Folders ---

The frontend is inside ./web/src
The backup of the database (structure, test data, procedure, triggers) is inside ./database
The screencast is inside ./docs



--- How to Build and Run ---

Tu run docker containers, simply run the following command from the root of the project:
>> docker compose up

You will find the web client at: localhost:8080
and will find the PhpMyAdmin at: localhost:8082

To stop running everything, simply run the command: (from root)
>> docker compose down


In case you want to rebuild it manually, simply run: (from root)
>> docker compose build

And if you want to completly clean your docker after that, you can run:
>> docker system prune -a
Be careful, this will clean all your containers/images/cache from your docker!

