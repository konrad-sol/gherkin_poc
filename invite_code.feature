Feature: Invitation code
    Scenario: As Raava admin I'm able to create invitation code
        Given I'm on Raava admin page
        When I click on invite codes button
            And I choose organization
            And I choose team
            And I choose number of available slots
            And I choose how long code should be valid
            And I click create
        Then I should get invite code
            And Invite code should be visible in invite code tabel

    Scenario: As Raava admin I'm able to change how long already created code should be valid
        Given I'm on Raava admin page
        When I click on invite codes button
            And I click on already created invite code
            And I change how long code should be valid
            And I save the changes
        Then Change should be saved

    Scenario: As Raava admin I'm able to change how many user can login on already created code
        Given I'm on Raava admin page
        When I click on invite codes button
            And I click on already created invite code
            And I change how many users can use this code
            And I save the changes
        Then Change should be saved

    Scenario: As Raava admin I'm able to delete already created code
        Given I'm on Raava admin page
        When I click on invite codes button
            And I click on already created invite code
            And I click on delete code
        Then Code should be deleted
            And Already created users shouldn't be deleted
    
    Scenario: As external developer I able to register to Raava using invite code (auto-approve is off)
        Given I'm on Raava main page
            And Auto-approval setting in raava.conf is false
        When I click on register button
            And I click in link "I have invitation code"
            And I fill the invite code
            And I fill the registration form
            And I click Submit button
            And Raava admin activate my account
        Then I should receive an email
            And I should be able to login
            And I should be assigned to proper org and proper team

    Scenario: As external developer I able to register to Raava using invite code (auto approve is on)
       Given I'm on Raava main page
            And Auto-approval setting in raava.conf is false
        When I click on register button
            And I click in link "I have invitation code"
            And I fill the invite code
            And I fill the registration form
            And I click Submit button
        Then I should receive an email
            And I should redirected to main page
            And I should be assigned to proper org and proper team