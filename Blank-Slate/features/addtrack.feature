Feature: Access add track page
  In order to sell my music
  As a muscian 
  I want to be able to upload my music

Scenario: uploads audio
  Given Elvis is a registered user
  And is logged in
  When Elvis goes to add more page
  And Elvis clicks add track
  Then he should see the add more tracks page
