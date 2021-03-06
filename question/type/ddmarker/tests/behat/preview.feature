@qtype @qtype_ddmarker @_switch_window
Feature: Preview a drag-drop marker question
  As a teacher
  In order to check my drag-drop marker questions will work for students
  I need to preview them

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email               |
      | teacher1 | T1        | Teacher1 | teacher1@moodle.com |
    And the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1        | 0        |
    And the following "course enrolments" exist:
      | user     | course | role           |
      | teacher1 | C1     | editingteacher |
    And the following "question categories" exist:
      | contextlevel | reference | name           |
      | Course       | C1        | Test questions |
    And the following "questions" exist:
      | questioncategory | qtype    | name         | template |
      | Test questions   | ddmarker | Drag markers | mkmap    |
    Given I log in as "teacher1"
    And I am on "Course 1" course homepage
    And I navigate to "Question bank" in current page administration

  @javascript @_bug_phantomjs
  Scenario: Preview a question using the mouse.
    When I choose "Preview" action for "Drag markers" in the question bank
    # Odd, but the <br>s go to nothing, not a space.
    And I drag "OU" to "345,230" in the drag and drop markers question
    And I drag "Railway station" to "262,197" in the drag and drop markers question
    And I drag "Railway station" to "334,319" in the drag and drop markers question
    And I drag "Railway station" to "211,101" in the drag and drop markers question
    And I press "Submit and finish"
    Then the state of "Please place the markers on the map of Milton Keynes" question is shown as "Correct"
    And I should see "Mark 1.00 out of 1.00"
    And I press "Close preview"

  @javascript
  Scenario: Preview a question using the keyboard.
    When I choose "Preview" action for "Drag markers" in the question bank
    And I type "up" "88" times on marker "Railway station" in the drag and drop markers question
    And I type "right" "26" times on marker "Railway station" in the drag and drop markers question
    And I press "Submit and finish"
    Then the state of "Please place the markers on the map of Milton Keynes" question is shown as "Partially correct"
    And I should see "Mark 0.25 out of 1.00"
    And I press "Close preview"

  @javascript
  Scenario: Preview a question in responsive mode.
    When I choose "Preview" action for "Drag markers" in the question bank
    And I drag "OU" to "345,230" in the drag and drop markers question
    And I drag "Railway station" to "262,197" in the drag and drop markers question
    And I drag "Railway station" to "334,319" in the drag and drop markers question
    And I drag "Railway station" to "210,105" in the drag and drop markers question
    And I press "Submit and finish"
    Then the state of "Please place the markers on the map of Milton Keynes" question is shown as "Correct"
    And I should see "Mark 1.00 out of 1.00"
