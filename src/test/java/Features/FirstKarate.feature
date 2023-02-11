Feature: welcome to Karate
  Scenario: how to print
    Given print "Hello Karate World"
    When print 'another file print'
    * print 'my name is' , 'Hasan'
    
    Scenario: Variables
      * def name = 'Robert'
      * print 'My name is', name
      * def age = 19
      * print name, 'is', age, 'years old'
      * print 5+5

      Scenario: Different parameters
        * def user = {"name" : "Hasan", "role" : "admin"}
        * print user
        * print user.name
        * print user.role

        Scenario: Json body
          * def user =

          """
          {"name" : "Hasan",
          "role" : "admin",
          "age" : 24
          }
          """
          * print user
          * print user.age


  Scenario: json body with Array objects
               Given def user =

               """
            [
              {"name" : "Hasan",
           "role" : "admin",
           "age" : 24

          },
            {"name" : "Mustafa",
           "role" : "member",
           "age" : 25

          }
            ]
            """
               * print user
               * print user[0].name
               * print user[1].role

