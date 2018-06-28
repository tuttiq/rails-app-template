# Rails app template

Boilerplate for a rails application with some basic features (and some hard-coded strings in PT-BR lol #shameOnMe)

Features:
- Login page + Forgot my password (password reset by sending an email with a reset url)
- Dashboard + top menu with a Logout button
- Left side menu, customized depending on the type of user
- CRUD operations for 3 types of Users: Admin, TypeOneUser and TypeTwoUser
- CRUD operations for Records (generic model)
- Rake task to create the initial Admin

Tools:
- CSS by Twitter Bootstrap
- MySQL database
- User authentication by Sorcery
- User types defined by STI (User.type == SubClassName)
- Authorization defined by CanCan
- Debug with Pry
- Haml for writing markup
- CoffeeScript for scripts

Dependencies:
- Environment setup: http://gist.github.com/2376711
- MySQL Server (root user with no password)

Instalation:
- git clone or download and extract zip of this repo
- `$ cd rails-app-template`
- `$ bundle install`
- `$ rake db:create db:migrate`
- `$ rake create_admin`
- Fill in admin info
- `$ rails s`
- On your browser: http://localhost:3000
