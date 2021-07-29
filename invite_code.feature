Feature: Invitation code

    Rule: Admin invite management
        Background:
            Given I'm logged as admin

        Scenario: Admin can create invite code
             When I create invite code
             Then I shoud see it in invites list

        Scenario: Can change existing invite code
            Given invite code
             When I modify invite with
                  | maximum count | expiration |
                  | 10            | 1 Jan 2022 |
             Then invite should change

        Scenario: Can delete invite
            Given active invite code
             When I delete invite
             Then invite should be removed
    
    Rule: Admin developer approval
        Background:
            Given I'm logged as admin
              And there is invite code
              And there is inactive developer with invite code

        Scenario: See pending approvals
             When I open approval page
             Then I shoud see pending approval

        Scenario: Approve developer
             When I open approval page
              And approve developer registration
             Then developer should be active

    Rule: Developer registration
        Background:
            Given Organisation "ACME"
              And Team "Pinky & Brain"

        Scenario: Register without approval default team
            Given auto-approval is enabled
              And there is active invite code
             When developer sign up with invite code
             Then developer should be created
              And developer can login
              And invite count should be "1"

        Scenario: Register without approval and custom team
            Given auto-approval is enabled
              And there is invite code with
                  | org  | team |
                  | ACME | Pinky & Brain |
             When developer sign up with invite code
             Then developer should be created with
                  | org  | team |
                  | ACME | Pinky & Brain |

        Scenario: Register with approval
            Given auto-approval is disabled
              And there is active invite code
             When developer sign up with invite code
             Then developer should be created inactive
              And developer can't login

        Scenario: Failed to register with expired code
            Given there is expired invite code
             When developer sign up with invite code
             Then developer should see "code expired" error
              And developer should not be created

        Scenario: Failed to register when reached count
            Given there is full invite code
             When developer sign up with invite code
             Then developer should see "code invalid" error
              And developer should not be created
