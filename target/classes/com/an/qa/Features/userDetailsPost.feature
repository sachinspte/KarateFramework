@Sanity
Feature: Post call test

Background: 
 
  * url 'https://reqres.in/api/users'
  * def req = read ('../resourses/request.json')
  
Scenario: create user details
#https://reqres.in/api/users?delay=3
#Given url 'https://reqres.in/api/users'
And request req
And headers { Content-Type : 'application/json', Accept : 'application/json'}
And param delay = 3 
When method post
Then status 201
Then print response