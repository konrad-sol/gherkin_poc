Feature: API consumer self-registration
    Scenario: As external developer I want to be abe to self register on Raava without invite code (auto approve is off)
        Given I'm on Raava main page
            And Auto-approval setting in raava.conf is false
        When I click on register button
            And I fill the registration form
            And I click Submit button
            And Raava admin activate my account
        Then I should receive an email
            And I should be able to login
            And I should be assigned to Default org and default team

    Scenario: As external developer I want to be abe to self register on Raava without invite code (auto approve is on)
        Given I'm on Raava main page
            And Auto-approval setting in raava.conf is true
        When I click on register button
            And I fill the registration form
            And I click Submit button
         Then I should be directed to Raava main page
            And I should be assigned to Default org and default team