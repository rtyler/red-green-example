Feature: Serve the PuppetConf streaming web service
  In order to serve up the PuppetConf
  video stream to millions of fans

  As an Operations Engineer

  Web hosts should be configured to run the app


  @wip
  Scenario: Lock down SSH for all servers
    Given an empty host
    When I provision the host
    Then port 22 should be reachable
    And SSH should not permit password-less logins


  @wip
  Scenario: Add a new stream server to the pool
    Given an new stream server
    When I provision the host
    Then the host should be added to the Nagios HTTP group
    And a new backend should be added to HAProxy


  Scenario: Set up a basic stream server
    Given an empty host
    And the host is classified as a www node
    When I provision the host
    Then it should be running a web server
    And it should be responding to web requests
