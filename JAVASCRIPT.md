# Updater Client-side Javascript Style Guide

## Resources

This guide was loosely inspired by the code style guide at GitHub.

## File Structure

Only load one custom javascript file per page. If you need to include submodules or other code, inline require it. That way you can see the separate files in development but in production there will only be one network request.

All javascript files should be kept in `assets/js/`. If the script is meant to be used by multiple other scripts or if it might be required by other scripts in the future, keep it in `assets/js/modules`. In order to keep the repository easy to navigate, feel free to create additional subfolders to group similar scripts. For example, put all files that are related to the Agent side of the site in `assets/js/agent/`.

## General Syntax

* Refer to the Updater CoffeeScript Style Guide for any rules that are not specified here.
* Include a single space after the `if` and `function` keywords.
* Indentation is done using 2 spaces.
* Use camelCase for variable names instead of underscores.
* When a variable is a jQuery object, its name should start with `$` so it's clear that it's an object and not a DOM node.
* Wrap modules in an IIFE and feed it the global namespace and generally avoid polluting the global namespace.
* In javascript **always** use a semicolon when appropriate.
* Document your code as much as possible inline to clarify sections of code and at the top of the file for block comments.
* When targeting an element on the page, attach a `.js-foo` classname to the element and target that name. This way it's clear in the HTML that the element has attached functionality.
* When making AJAX requests based on user action, add a behavior that indicates to the user that something is loading.
* When creating new functionality that depends on a return value from some other code, embrace the pattern of event emitters and event listeners. Listening for events instead of return values is a more modular way of writing code and avoiding dependency hell.

## Vendor Libraries

If at all possible, use an existing library that's already in the repository. We want to keep the files we send as small as possible so the site loads quickly. Before adding another dependency to Bower, look at `bower.json` and see if there is already a library or plugin that might do what you need. For example, Bootstrap has a lot of sub-plugins and one of those will likely help.

If you have a vendor library that you'd like to include on the site, do so using Bower so the external dependency doesn't wind up in our version control. Then include the script in your controller/versioned file using an inline require. If the file needs to be included on multiple pages, just require it in the footer of the site.

## Dependency Management

In the interest of ensuring the stability of the website, inline-require any dependencies for your scripts. This way there is always one place where dependencies are listed and we will be incapable of introducing new bugs. Inline requires for your scripts should be done at the very top of the file. After the dependency listing, your script should generally have an initialization section that also initializes and submodules that need such treatment.

## Unit Tests

Write tests for **everything!** Tests help us not introduce new bugs into the codebase so we can spend more time working on fun stuff. When you work on a section of code, make sure that there is a unit test for it. If there isn't one, write one. If you change the functionality of any part of the site, make sure to update the test for that function or the test will fail. Pull requests without unit test will fail.

## Migrating away from separate mobile site

To reduce the overall complexity of our website, reduce the number of bugs we can introduce and reduce the amount of duplicate code in the repo, we will be migrating away from having a separate mobile site. The best way to do this is by having the mobile site share scripts with the main site. The mobile site generally has the same elements on the page so can generally use the exact same code as the main site.

As you work on bugs/features that have to be duplicated on the mobile site, change required scripts to be the main version and thoroughly test that the functionality is stable. Take this opportunity to see if you can make the main script more efficient and reduce the overall file size because this will benefit both mobile and desktop users.

## Migrating to CoffeeScript

We will be moving the client-side code to CoffeeScript as we go along. This will allow us to write more efficient, readable code with fewer bugs. All CoffeeScript files should be saved in `assets/coffee/` and follow the same file structure as the `assets/js/` folder. That is to say that there will eventually be a one to one equivalency between the JavaScript files and the CoffeeScript files, just in different folders.

When writing your CoffeeScript be sure to follow the Updater CoffeeScript Style Guide as the expected code style is the same for both the client- and server-side scripts.

Once you have created a new CoffeeScript file and written tests for it, also make sure that the file/functionality is being linted by coffeelint and your tests are passing.

## Migrating to A Client-side MVC Framework

To increase the clarity and modularity of our codebase, we will start to use a client-side MVC framework.
