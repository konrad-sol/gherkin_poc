Feature: Create Developer
    
    Rule: Admin developer management
        Background:
            Given I'm logged as admin

        Scenario: Create new developer
             When I create developer
             Then I shoud see it in developer list
              And developer should be in-active

        Scenario: Allow set TTL for registration link
             When I create developer with TTL password link
             Then I should see TTL in developer form

        Scenario: Should not allow developer with same email
             When I create developer
              And create developer again with same email
             Then I get error that "email is not unique"

    Rule: Developer login
        Scenario: In-active developer should not be able to login
            Given I'm in-active developer
             When I try to log-in
             Then I see login error

        Scenario: Developer should receive password reset link on sign up
            Given I'm in-active developer
             Then I should see password reset link in email

        Scenario: Developer should be activated when password set
            Given I'm in-active developer
             When I set password via password reset link
             Then I should login

        Scenario: If password link expired, developer should not be able to login
            Given I'm in-active developer with
                  | Password TTL |
                  | 1 Jan 1987   |
             When I set password via password reset link
             Then I get error "link expired"

        Scenario: Register if not expired
            Given I'm in-active developer with
                  | Password TTL |
                  | 1 Jan 2022   |
             When I set password via password reset link
             Then I should login
