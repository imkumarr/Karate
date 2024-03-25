Feature: Get API Test

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  #simple Get Request
  Scenario: Get demo 1
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  #Get with background
  Scenario: Get demo 2
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response

  #Get with Path, Params
  Scenario: Get demo 3
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response

  #Get with Assertions
  Scenario: Get demo 4
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    And match $.data[1].id == 8
    And match $.data[3].last_name == 'Fields'
