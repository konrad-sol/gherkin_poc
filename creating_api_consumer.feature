Feature: Create Developer

	Scenario: Admin allowed to create new in-active developers
		Given I'm logged as admin
		 When I create developer
		 Then I shoud see it in developer list
		  And developer should be in-active

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
	     Then I should be able to login

	Scenario: Allow set TTL for registration link
		Given I'm logged as admin
	     When I create developer with TTL password link
	     Then I should see TTL in developer form

	Scenario: If password link expired developer should not be able to login
		Given I'm in-active developer with TTL password link
	     When I set password via password reset link in email
	     Then I get error that link expired

	Scenario: Should not allow developer with same email
		Given I'm logged as admin
	     When I create developer
	      And create developer again with same email
	     Then I get error that email is not unique
