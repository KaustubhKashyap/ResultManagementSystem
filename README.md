\# Result Management System (RMS)



A web-based Result Management System developed using Java, JSP, Servlets, JDBC, Oracle Database, and Apache Tomcat.



\## About the Project



The Result Management System helps administrators manage student records, subjects, marks, and academic results. Students can log in to view their results.



\## Features



\* Admin Login

\* Student Login

\* Add, View, Update, Search, and Delete Student Records

\* Subject Management

\* Enter and Update Student Marks

\* View Student Results

\* Pass/Fail Report

\* Topper Report

\* Result Summary

\* Student Password Change

\* Oracle Database Connectivity using JDBC



\## Technologies Used



\* \*\*Programming Language:\*\* Java

\* \*\*Web Technologies:\*\* JSP, Servlets, HTML, CSS

\* \*\*Database:\*\* Oracle Database 11g XE

\* \*\*Database Connectivity:\*\* JDBC

\* \*\*Server:\*\* Apache Tomcat 9

\* \*\*IDE:\*\* Eclipse

\* \*\*Version Control:\*\* Git and GitHub



\## Project Structure



```text

ResultManagementSystem/

├── src/

│   └── main/

│       ├── java/

│       │   └── com/rms/

│       │       ├── dao/

│       │       ├── model/

│       │       ├── servlet/

│       │       └── util/

│       └── webapp/

│           ├── WEB-INF/

│           ├── style.css

│           └── JSP pages

├── .classpath

├── .project

├── .gitignore

└── README.md

```



\## Prerequisites



\* Java JDK compatible with your Tomcat 9 setup

\* Eclipse IDE

\* Apache Tomcat 9

\* Oracle Database 11g XE

\* Oracle JDBC driver



\## Database Configuration



The application reads database connection settings from environment variables:



\* `RMS\_DB\_URL`

\* `RMS\_DB\_USER`

\* `RMS\_DB\_PASSWORD`



Configure these variables on your computer before running the application. Do not store database passwords directly in source code or commit them to GitHub.



\## How to Run



1\. Clone or download this repository.

2\. Import the project into Eclipse.

3\. Configure Apache Tomcat 9 in Eclipse.

4\. Configure the Oracle database and required tables.

5\. Set the three database environment variables.

6\. Run the project on Tomcat.

7\. Open the application in your browser at:



&#x20;  `http://localhost:8080/ResultManagementSystem/`



\## Security Note



This project is intended for learning and academic purposes. Password storage and authentication should be improved before using it in a production environment.



\## Author



Kaustubh Kashyap



\## Repository



\[Result Management System on GitHub](https://github.com/KaustubhKashyap/ResultManagementSystem)



