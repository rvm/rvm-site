---
title: TeamCity Integration with RVM
---

= breadcrumbs "Integration", "TeamCity"

%a{:name => "teamcity"}
%h1 Continuous Integration with TeamCity

%p
  TeamCity is a continuous integration server designed to automatically run tests against a project every time you make a change.
  You can configure TeamCity to automatically commit changes to version control when your tests pass or deploy your changes to a remote environment.
  By integrating rvm with TeamCity you can run tests against multiple ruby versions and test multiple projects with each project working
  with an independent set of gems.

%h2 General Overview

%p
  In order to run TeamCity with RVM you will need to

%ul
  %li Setup a TeamCity server which manages your builds and serves a web interface so you can monitor and control the build process.
  %li Run one or more separate build agent processes which actually perform the builds and run your tests. These build agents can be
  located on the same machine as the TeamCity server or connect from remote machines.
  %li Specify the Ruby and Gemset you want the build agent to use as part of your project's configuration on the TeamCity server.

%h2 Installing TeamCity

%p
  %a{:href => "http://confluence.jetbrains.com/display/TCD5/Installing+and+Configuring+the+TeamCity+Server", :name => "Installing and Configuring TeamCity Server"}

%h2 Installing a Build Agent

%p
  %a{:href => "http://confluence.jetbrains.com/display/TCD5/Setting+up+and+Running+Additional+Build+Agents", :name => "Setting upp and Running Additional Build Agents"}

%h2 Configuring a TeamCity Project

%a{:href => "http://confluence.jetbrains.com/display/TCD5/Managing+Projects", :name => "Managing TeamCity Projects"}

%h3 Setting Up Build Agents

%p
  Install the project's Ruby and Gemset on the build agent's machine. This can either be performed manually on each build agent machine or as a
  command line build runner as long as it is completed on each build agent's environment before the agent attempts to build a project using RVM.

%h3 Configuring a Build Agent to use RVM

%h4 Using a Rake Build Runner

%p
  TeamCity 5.1.3 includes support for RVM settings in the Rake Build Runner. In the Build Runner's "Launching Parameters" set the following options:

%ul
  %li The "Ruby interpreter path" can be any RVM Ruby installed on the build runner. (eg '1.9.2')
  %li The "RVM gemset name" can be any RVM Gemset in the specified Ruby.

%h4 Using a Command Line Build Runner

%p
  As of TeamCity 5.1.3 Command Line build runners do not have built in support for RVM however they can use RVM given appropriate environment
  variables. The example below demonstrates running "bundle install" using a Command Line Build Runner.

%h5 In the Build Runner Configuration Step

%ul
  %li Set the "Build Runner" to "Command Line"
  %li Set the "Command Executable" to "~/.rvm/gems/%rvm.ruby%@%rvm.gemset%/bin/bundle"
  %li Set the "Command parameters" to "install"

%h5 In the Properties and Environment Variables Configuration Step

%p
  Add the following two "Configuration Parameters". Setting these values as configuration parameters allows them to be reused in the Build Runner
  Configuration and the Environment Variables below.

%table
  %thead
    %tr
      %th
        Name
      %th
        Value
  %tbody
    %tr
      %td
        rvm.ruby
      %td
        Your project's Ruby
    %tr
      %td
        rvm.gemset
      %td
        Your project's Gemset

%p
  Add the following Environment Variables to the "Build Parameters"

%table
  %thead
    %tr
      %th
        Name
      %th
        Value
  %tbody
    %tr
      %td
        BUNDLE_PATH
      %td
        \~/.rvm/gems/%rvm.ruby%@%rvm.gemset%
    %tr
      %td
        GEM_HOME
      %td
        \~/.rvm/gems/%rvm.ruby%@%rvm.gemset%
    %tr
      %td
        GEM_PATH
      %td
        \~/.rvm/gems/%rvm.ruby%@%rvm.gemset%:/home/teamcity/.rvm/gems/%rvm.ruby%@global
    %tr
      %td
        PATH
      %td
        \~/.rvm/bin:~/.rvm/rubies/%rvm.ruby%/bin:~/.rvm/gems/%rvm.ruby%@%rvm.gemset%/bin:~/.rvm/gems/%rvm.ruby%@global/bin:%env.PATH%

%p
  Using either of the configurations above the build agents will be able to reference an RVM Ruby and Gemset when performing their builds.

%h2 Other resources

%ul
  %li
    Carbon Five's overview of their TeamCity configuration using RVM:
    %a{:href => "http://blog.carbonfive.com/2010/08/ruby-on-rails/using-rvm-on-teamcity-build-agents"}
  %li
    JetBrains' official TeamCity documentation:
    %a{:href => "http://blog.carbonfive.com/2010/08/ruby-on-rails/using-rvm-on-teamcity-build-agents"}
