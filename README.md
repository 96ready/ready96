Included in this guide:
  * [About This Code Base](#about)
  * [Deploy on Heroku](#deploy-on-heroku)
  * [Development Environment Setup](#development-environment-setup)

# About


**This codebase was derived from City72**. An example of a deployed site is [safegnv.org](http://safegnv.org). For more information about the toolkit, visit [toolkit.sf72.org](http://toolkit.sf72.org).

## License and Copying:

**The code is open source** and licensed under the MIT license.

**The photos are copyright** and belong to their respective photographers. The photos are used with permission on the Ready96 site only. They may only be used in other instances with explicit permission from the photographer.


## Differences (Drift from City72):

• This codebase is set up so that all the text strings come from the "en.yml" locale file.

• This site is less reliant on a content management system (CMS). Instead, customize the site by editing image files and the locale file. This difference affords the possibility of translation. It also means that you can completely customize what the site says.

• The Cloudinary add-on is not used. However, the add-on is still referenced in the code, in case you wish to enable the functionality. In other words, you do not need to pay for the premium Heroku Add-on if you leave things as currently configured.

• Since all of the text here is editable, this codebase could more readily be adapted for a county, organization, or other community. (City72 assumes you are creating a site for a city and uses the word city in non-editable text throughout)

• This codebase requires a little more technical know-how but offers much more flexibility in terms customization and localization.

---

# Deploy on Heroku

Deploying to Heroku is the quickest way to launch an instance of this site.

1. [Fork this repository](https://github.com/gnv-org/gnv#fork-destination-box).

2. From your new GitHub repository, press the button below to deploy to Heroku:

     [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

3. Name your app and give it a minute or two to deploy, you will then see a link to view it. If you don't have a Heroku account, you will be prompted to create one and verify your identity with a credit card.

## Add-ons

The following free add-ons are automatically installed as part of the set-up process. Even though the add-ons are free, you have to verify your account by adding a credit card.

* **PostgreSQL** is the database for your application.
* **SendGrid** sends emails from your application (e.g. the forgot password email).
* **NewRelic** monitors your application performance

## Configure the recover password host redirection:

During setup, you will be prompted to enter an `EMAIL_REDIRECT_HOST`, used within the emails sent from your application. The value should be `YOURAPPNAME.herokuapp.com`

## Heroku Dynos

For testing purposes, you can choose an application with no extra dynos (this will be free). Please note that **sites with no extra dynos "go to sleep"** and can be slow to wake up. So, when you are ready to let the public use your site, make sure that your Heroku application has at least `2 dynos`.

When you are ready to launch, go to your Heroku account upgrade the app to 'Hobby' or better. There is a monthly fee associated with having an extra dyno. This will also make sure the app is served via https so that the Google Crisis Map will work properly.

## FINAL STEP: Update your username and password via the Content Editor

Your site was installed with a default username and password (these are set in the db/seeds.rb file). Go to your app and log in.

`http://YOURAPPNAME.herokuapp.com/cms`

The default username and password are:

`admin@example.com`

`password`

Once you log in, use the Admin menu in the navigation to change the email to your email address. Then you will need to change the password to a strong password that only you know.


---


# Development Environment Setup

In most cases, you will not need to setup a development environment for this application. The only reason to go through the following steps would be if you wanted to customize your site beyond what you can set with the Content Editor.

## Prerequisites

To setup the application you will need:

* PostgreSQL database
* Ruby 1.9.3-p448
* Bundler gem
* Bower


### PostgreSQL installation

#### Linux

    $ sudo apt-get -y install postgresql

#### Mac OS X

    $ brew install postgresql

### Ruby Installation

#### Rbenv

To install ruby, it is necessary to have *rbenv* installed. This can be installed following the steps described in [rbenv's Github Repository](https://github.com/sstephenson/rbenv), in the [Installation Section](https://github.com/sstephenson/rbenv#installation).

#### Ruby 1.9.3-p448

When rbenv is already installed, go to the project's root folder, and run the following command

```sh
 $ rbenv install
```

### Bundler gem
In order to manage the project dependencies, it is necessary to have installed *bundler*.

```sh
 $ gem install bundler
```

### Bower
To manage the client-side js dependencies, it is necessary to have installed *bower*. *Bower* depends on *node.js*, so if it is not installed yet, install it with *nvm*, following these instructions: [NVM - Installation guide](https://github.com/creationix/nvm#installation).

Having *node.js* installed, run the following command to install *bower*:

```sh
npm install -g bower
```

## Development environment

Before running the app, the following steps should be performed.
* Obtain a copy of the application
* Create the database user for the application
* Install the application dependencies
* Create the database
* Download the client-side dependencies

### Obtain a copy of the application

Clone the code to your computer.
The command you type into your shell application (Terminal on the Mac) will be:

```sh
$ git clone https://github.com/96ready/ready96.git
```

This will create a directory named `ready96`.

### Create the database user for the application

```sh
createuser -P -s ready96
```
Assign the word *ready96* as password too.

Linux users should run the above command as postgres user (`sudo su postgres`).

### Install the application dependencies

```sh
bundle install
```

### Create the database

```sh
bundle exec rake db:setup
```

### Download the client-side dependencies

```sh
bower install
```

## Run the application locally
With all the prerequisites and the development environment ready. Just run the app, with the following command:

```sh
bundle exec rails s
```

## Open your application on Port 3000

Go to your browser and open

```sh
localhost:3000
```

