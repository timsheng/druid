# druid
[![Build Status](https://travis-ci.org/timsheng/druid.png)](https://travis-ci.org/timsheng)

A simple gem that assists testers in creating flexible page objects for testing browser based applications

You define a new page object by including the PageObject module:

class MyPageObject
  include Druid
end
Including this module adds an initialize method that takes a Watir::Browser object. You create your object like this:

browser = Watir::Browser.new :firefox
my_page_object = MyPageObject.new(browser)

# Note on Patches/Pull Requests

Fork the project
Test drive your feature addition or bug fix. Adding specs is importing so I don't break it in a future version unintentionally.
Commit, do not mess with rakefile, version, or history.
(if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
Send me a pull request. Bonus points for topic branches.
