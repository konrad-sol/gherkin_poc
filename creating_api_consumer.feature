Feature: Creating API consumer
    Scenario: As Raava admin I can create an account for API consumer
        Given I'm on Raava admin page
        When I click on API consumer button
            And I click plus button
            And I fill new user data
            And I click submit button
        Then User should get an email with link to set password
            And Users stays in-active until new password was provided
        When User provide a passwrod
        Then User is able to login
            And User becomes active

    Scenario: As Raava admin I can create an account for API consumer with TTL
        Given I'm on Raava admin page
        When I click on API consumer button
            And I click plus button
            And I fill new user data
            And I set time to live for the set-password link
            And I click submit button
        Then User should get an email with link to set password
        When Users open the link after time expired
        Then User can't provide a passwrod
            And User stays inactive

    Scenario: As Raava admin I can't create an account for API consumer with already existing email
        Given I'm on Raava admin page
        When I click on API consumer button
            And I click plus button
            And I fill new user data with email that already exists in Raava
            And I click submit button
        Then I get error that email is not unique

