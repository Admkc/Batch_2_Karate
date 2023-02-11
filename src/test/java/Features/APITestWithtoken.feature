Feature: Api
Background:
#    * def baseUrl = 'https://www.krafttechexlab.com/sw/api/v1/allusers'

* def AuthFeature = call read('classpath:features/PostNewUser.feature')
* def UserToken = AuthFeature.token
* print "Token comes from Background" , UserToken

Scenario: add experience
Given url "https://www.krafttechexlab.com/sw/api/v1/experience/add"
And header Authorization = UserToken
And header Accept = 'application/json; charset=UTF-8'
* request
"""
      {
  "job": "SDET0321",
  "company": "Kraft311 Techex",
  "location": "TR",
  "fromdate": "2012-12-12",
  "todate": "2016-12-12",
  "current": "false",
  "description": "Great job"
}
      """

  When method POST
  Then status 200
  * print response

  Given url "https://www.krafttechexlab.com/sw/api/v1/experience/all"
  And header Authorization = UserToken
  And header Accept = 'application/json; charset=UTF-8'
  Then method GET
  Then status 200
  * print response

 # * def expectedInfo = read('classpath:data/UserINfo.json')

 # Then match response == expectedINfo

  * match response.experience[0].company == "Kraft311 Techex"









