# NationalLibraryDemo

In this project following features are displayed:
1. Shows list of persons
2. Shows list of Books
3. Show the Books lend by the person.


To set up and run the code project:

Pre requisites:

1. JDK 1.7+
2. Maven 
3. Git plugin

Steps:
1. Open command prompt and go to the folder where you want to check out the code.
2. Run the below command to clone the git project into your local directory:

	git clone https://github.com/aravindjavadev/NationalLibraryDemo.git

3. Go into your checked out project from command prompt:

	cd NationalLibraryDemo

4. Run the below command to start the jetty server and bring up the project:

	mvn jetty:run

5. Go to the browser and type the below URL:

	http://localhost:8080/

You would see the list of Persons and Books in the table format.
Click on the Books lent button to view the books details lent by that person.