#@ignore
Feature: user details

Background:

* def expectedOutput = read ('../resourses/result.json')
#* def feature = read('userDetails1.feature')
#* def result = call feature
* def result = call read('userDetails1.feature')

Scenario: Request user 2 with get Call

Given url 'https://reqres.in/api/users/3'
When method GET
Then status 200
Then print response
And match response == expectedOutput[1]
Then print 'results====>',result

* def first_name = result.response.data.first_name
Then print 'print first name',first_name