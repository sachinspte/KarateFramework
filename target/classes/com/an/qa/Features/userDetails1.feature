@ignore
Feature: user details

Background:

* def expectedOutput = read ('../resourses/result.json')

Scenario: Request user 1 with get Call

Given url 'https://reqres.in/api/users/2'
When method GET
Then status 200
Then print response
And match response == expectedOutput[0]

#@Parallel=false
Scenario: Request user 1 with get Call 1

Given url 'https://reqres.in/api/users/2'
When method GET
Then status 200
Then print response
And match response == expectedOutput[0]