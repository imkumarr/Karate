Feature: Post API Demo

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('response1.json')

  #simple request
  Scenario: Post demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "Kumar", "job" : "QA"}
    When method POST
    Then status 201
    And print response

  #Post with Background
  Scenario: Post demo 2
    Given path '/users'
    And request {"name": "Kumar", "job" : "QA"}
    When method POST
    Then status 201
    And print response

  #Post with Assertions
  Scenario: Post demo 3
    Given path '/users'
    And request {"name": "Kumar", "job" : "QA"}
    When method POST
    Then status 201
    And match response == {"createdAt": "#ignore","name": "Kumar","id": "#string","job": "QA"}
    And print response

  #Post with read reponse from file
  Scenario: Post demo 4
    Given path '/users'
    And request {"name": "Kumar", "job" : "QA"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response

  #Post with read request body from file
  Scenario: Post demo 5
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def filePath = projectPath+'/src/test/java/data/request1.json'
    And def requestBody1 = filePath
    And request requestBody1
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response

  #Post with read reponse from file
  Scenario: Post demo 6
    Given path '/users'
    And def reqBody = read("request1.json")
    And set reqBody.job = 'QA'
    And request reqBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response
