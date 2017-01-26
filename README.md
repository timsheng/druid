# druid
[![Build Status](https://travis-ci.org/timsheng/druid.png)](https://travis-ci.org/timsheng)


A simple gem that assists in creating flexible page objects for testing browser based applications. The goal is to facilitate creating abstraction layers in your tests to decouple the tests from the item they are testing and to provide a simple interface to the elements on a page.  It works with watir

### Defining your page object

You define a new druid by including the Druid module:

````ruby
class LoginPage
  include Druid
end
````

When you include this module numerous methods are added to your class that allow you to easily define your page.  For the login page you might add the following:

````ruby
class LoginPage
  include Druid

  text_field(:username, :id => 'username')
  text_field(:password, :id => 'password')
  button(:login, :id => 'login')
end
````

Calling the _text_field_ and _button_ methods adds several methods to our druid that allow us to interact with the items on the page.  To login using this page we could simply write the following code:

````ruby
login_page.username = 'cheezy'
login_page.password = 'secret'
login_page.login
````

Another approach might be to create higher level methods on our druid that hide the implementation details even further.  Our druid might look like this:

````ruby
class LoginPage
  include Druid

  text_field(:username, :id => 'username')
  text_field(:password, :id => 'password')
  button(:login, :id => 'login')

  def login_with(username, password)
    self.username = username
    self.password = password
    login
  end
end
````
and your usage of the page would become:

````ruby
login_page.login_with 'cheezy', 'secret'
````

### Creating your druid
druid supports [watir](https://github.com/watir/watir)
The page object can be create like this:

````ruby
browser = Watir::Browser.new :firefox
my_druid = MyDruid.new(browser)
````



## Contribute

* Fork the project.
* Test drive your feature addition or bug fix. Adding specs is important and I will not accept a pull request that does not have tests
* Make sure you describe your new feature with a cucumber feature.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.
