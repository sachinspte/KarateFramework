@ignore
Feature: user details

Background:

* def expectedOutput = read ('../resourses/result.json')

* def sleep =
  """
  function(seconds){
  for(i=0;i<=seconds;i++)
  {
  java.lang.Thread.sleep(1*1000)
  }
  }
  """
Scenario: Request user 1 with get Call

Given url 'https://reqres.in/api/users/2'
When method GET
Then status 200
Then print response
And match response == expectedOutput[0]
* call sleep 10
#@Parallel=false
Scenario: Request user 1 with get Call 1

Given url 'https://reqres.in/api/users/2'
When method GET
Then status 200
Then print response
And match response == expectedOutput[0]