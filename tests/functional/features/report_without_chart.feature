Feature: Report only submission
    Partners or redhat associates can publish their chart by submitting
    error-free report that was generated by chart-verifier.

    Examples:
    | vendor_type  | vendor    | report_path               |
    | partners     | hashicorp | tests/data/report.yaml    |
    | redhat       | redhat    | tests/data/report.yaml    |

    Scenario Outline: A partner or redhat associate submits an error-free report
        Given the vendor <vendor> has a valid identity as <vendor_type>
        And an error-free report is used in <report_path>
        When the user sends a pull request with the report
        Then the user sees the pull request is merged
        And the index.yaml file is updated with an entry for the submitted chart
