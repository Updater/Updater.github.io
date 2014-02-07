# CoffeeScript Style Guide

This guide presents a collection of best-practices and coding conventions for the [CoffeeScript][coffeescript] programming language.

This guide is intended to be community-driven, and contributions are highly encouraged.

Please note that this is a work-in-progress: there is much more that can be specified, and some of the guidelines that have been specified may not be deemed to be idiomatic by the community (in which case, these offending guidelines will be modified or removed, as appropriate).

## Inspiration

The details in this guide have been very heavily inspired by several existing style guides and other resources. In particular:

- Polar Mobile's [original guide][original]
- [PEP-8][pep8]: Style Guide for Python Code
- Bozhidar Batsov's [Ruby Style Guide][ruby-style-guide]
- [Google's JavaScript Style Guide][google-js-styleguide]
- [Common CoffeeScript Idioms][common-coffeescript-idioms]
- Thomas Reynolds' [CoffeeScript-specific Style Guide][coffeescript-specific-style-guide]
- Jeremy Ashkenas' [code review][spine-js-code-review] of [Spine][spine-js]
- The [CoffeeScript FAQ][coffeescript-faq]

## Table of Contents

* [The CoffeeScript Style Guide](#guide)
  * [Code Layout](#code_layout)
    * [Tabs or Spaces?](#tabs_or_spaces)
    * [Maximum Line Length](#maximum_line_length)
    * [Blank Lines](#blank_lines)
    * [Trailing Whitespace](#trailing_whitespace)
    * [Encoding](#encoding)
  * [Module Imports](#module_imports)
  * [Whitespace in Expressions and Statements](#whitespace)
  * [Arrays, Objects and Commas](#commas)
  * [Comments](#comments)
    * [Block Comments](#block_comments)
    * [Inline Comments](#inline_comments)
  * [Naming Conventions](#naming_conventions)
  * [Functions](#functions)
  * [Strings](#strings)
  * [Conditionals](#conditionals)
  * [Looping and Comprehensions](#looping_and_comprehensions)
  * [Extending Native Objects](#extending_native_objects)
  * [Exceptions](#exceptions)
  * [Annotations](#annotations)
  * [Miscellaneous](#miscellaneous)

<a name="code_layout"/>
## Code layout

<a name="documentation"/>
### Documentation

All code should be well documented! Use inline comments to explain code that might not be immediately clear and block comments to define classes, top-level functions and major sections of code. Use the [Codo][codo] style of documentation on all coffeescript projects.

<a name="tabs_or_spaces"/>
### Tabs or Spaces?

Use **spaces only**, with **2 spaces** per indentation level. Never mix tabs and spaces.

<a name="maximum_line_length"/>
### Maximum Line Length

Limit all lines to a maximum of 79 characters.

<a name="blank_lines"/>
### Blank Lines

Separate top-level functions, class definitions and other major sections of code with two blank lines.

Separate method definitions inside of a class with a single blank line.

Use a single blank line within the bodies of methods or functions in cases where this improves readability (e.g., for the purpose of delineating logical sections).

<a name="trailing_whitespace"/>
### Trailing Whitespace

Do not include trailing whitespace on any lines.

<a name="encoding"/>
### Encoding

UTF-8 is the preferred source file encoding.

<a name="module_imports"/>
## Module Imports

`require` statements should be placed on separate lines.

Unless require statements are being used to dynamically import files they should be placed at the top of the file, under any comments.

```coffeescript
fs = require 'fs'
Backbone = require 'backbone'
require 'lib/setup'
```
These statements should be grouped in the following order:

1. Standard library imports _(if a standard library exists)_
2. Third party library imports
3. Local imports _(imports specific to this application or library)_

<a name="whitespace"/>
## Whitespace in Expressions and Statements

Avoid extraneous whitespace. However, when adding whitespace would make the code more legible include it.

- Immediately inside parentheses, brackets or braces

  ```coffeescript
  $(object,array,thing) # No
  $( object, array, thing ) # Yes
  ```

- Immediately before a comma

  ```coffeescript
  console.log x, y # Yes
  console.log x , y # No
  ```

Additional recommendations:

- Always surround these binary operators with a **single space** on either side

  - assignment: `=`

    - In order to differentiate between a normal assignment and default values, this does not apply when indicating default parameters in a function declaration.

      ```coffeescript
      test: (param = null) -> # No
      test: (param=null) -> # Yes
      ```

  - augmented assignment: `+=`, `-=`, etc.
  - comparisons: `==`, `<`, `>`, `<=`, `>=`, `unless`, etc.
  - arithmetic operators: `+`, `-`, `*`, `/`, etc.

  - _(Do not use more than one space around these operators)_

    ```coffeescript
    # Yes
    x = 1
    y = 1
    fooBar = 3

    # No
    x      = 1
    y      = 1
    fooBar = 3
    ```

<a name="commas"/>
## Arrays, Objects and Commas

When declaring an array or object, list properties on a single line if there are few properties or on multiple lines if there are many properties.

When on a single line, always use commas and place spaces before the first property and after the last property.

When on multiple lines, do not use commas and indent the properties 2 spaces from the indentation level of the beginning of the declaration.

```coffeescript
someObject = { foo: foo, bar: bar, baz: baz }
someArray = [
  '1'
  '2'
  '3'
  4
  5
  thing
  wat
]
```

<a name="comments"/>
## Comments

If modifying code that is described by an existing comment, update the comment such that it accurately reflects the new code.

The first word of the comment should be capitalized, unless the first word is an identifier that begins with a lower-case letter.

Comments should clearly explain the code and end with a period.

<a name="block_comments"/>
### Block Comments

Block comments apply to the block of code that follows them.

Each line of a block comment starts with a `#` and a single space, and should be indented at the same level of the code that it describes.

Paragraphs inside of block comments are separated by a line containing a single `#`. All block comments should be terminated by a line containing a single `#`.

```coffeescript
# This is a block comment. Note that if this were a real block
# comment, we would actually be describing the proceeding code.
#
# This is the second paragraph of the same block comment. Note
# that this paragraph was separated from the previous paragraph
# by a line containing a single comment character.
#

init()
start()
stop()
```

<a name="inline_comments"/>
### Inline Comments

Inline comments are placed on the line immediately above the statement that they are describing. If the inline comment is sufficiently short, it can be placed on the same line as the statement (separated by a single space from the end of the statement).

All inline comments should start with a `#` and a single space.

The use of inline comments should be limited, because their existence is typically a sign of a code smell.

Do not use inline comments when they state the obvious:

```coffeescript
# No
x = x + 1 # Increment x
```

However, inline comments can be useful in certain scenarios:

```coffeescript
# Yes
x = x + 1 # Compensate for border
```

<a name="naming_conventions"/>
## Naming Conventions

Use `camelCase` (with a leading lowercase character) to name all variables, methods, and object properties.

Use `CamelCase` (with a leading uppercase character) to name all classes. _(This style is also commonly referred to as `PascalCase`, `CamelCaps`, or `CapWords`, among [other alternatives][camel-case-variations].)_

_(The **official** CoffeeScript convention is camelcase, because this simplifies interoperability with JavaScript. For more on this decision, see [here][coffeescript-issue-425].)_

For constants, use all uppercase with underscores:

```coffeescript
CONSTANT_LIKE_THIS
```

Variables that are intended to be "private" should begin with a leading underscore:

```coffeescript
_privateVar = 'asdf'
```

<a name="functions"/>
## Functions

_(These guidelines also apply to the methods of a class.)_

When declaring a function that takes arguments, always use a single space after the closing parenthesis of the arguments list:

```coffeescript
foo = (arg1, arg2) -> # Yes
foo = (arg1, arg2)-> # No
```

Do not use parentheses when declaring functions that take no arguments:

```coffeescript
bar = -> # Yes
bar = () -> # No
```

Never declare an implicit object in a function call. Always define the object elsewhere or wrap it in curly braces.

```coffeescript
# No
doSomething foo: foo, bar: bar

# Yes
params =
  foo: foo
  bar: bar
doSomething params
```

In cases where method calls are being chained and the code does not fit on a single line, each call should be placed on a separate line and indented by one level (i.e., two spaces), with a leading `.`.

```coffeescript
[1..3]
  .map((x) -> x * x)
  .concat([10..12])
  .filter((x) -> x < 11)
  .reduce((x, y) -> x + y)
```

In cases when the results of functions are being chained together, always use parentheses for clarity.

```coffeescript
result = console.log typeof classThatReturns object # No
result = console.log( typeof( classThatReturns(object) ) ) # Yes
```

When calling functions, choose to omit or include parentheses in such a way that optimizes for readability. Keeping in mind that "readability" can be subjective, the following examples demonstrate cases where parentheses have been omitted or included in a manner that the community deems to be optimal:

```coffeescript
baz 12

brush.ellipse x: 10, y: 20 # Braces can also be omitted or included for readability

foo(4).bar(8)

obj.value(10, 20) / obj.value(20, 10)

print inspect value

new Tag(new Value(a, b), new Arg(c))
```

Using parentheses to group functions (instead of being used to group function parameters) is an anti-pattern and should not be used. Examples of using this style (hereafter referred to as the "function grouping style"):

```coffeescript
($ '#selektor').addClass 'klass' # No

(foo 4).bar 8 # No
```

This is in contrast to:

```coffeescript
$('#selektor').addClass 'klass' # Yes

foo(4).bar 8 # Yes
```

In cases when a function is only used by a class itself, declare that function as a private method within the class's closure and reference it in the class. Do not expose methods and properties that are not meant to be available to other parts of the code.

<a name="strings"/>
## Strings

Use string interpolation instead of string concatenation:

```coffeescript
"this is an #{adjective} string" # Yes
"this is an " + adjective + " string" # No
```

Prefer single quoted strings (`''`) instead of double quoted (`""`) strings, unless features like string interpolation are being used for the given string.

<a name="conditionals"/>
## Conditionals

Favor `if (not x)` over `unless` for negative conditions.

Instead of using `unless...else`, use `if...else`:

```coffeescript
# Yes
if true
  ...
else
  ...

# No
unless false
  ...
else
  ...
```

Multi-line if/else clauses should use indentation:

```coffeescript
# Yes
if true
  ...
else
  ...

# No
if true then ...
else ...
```

<a name="looping_and_comprehensions"/>
## Looping and Comprehensions

Take advantage of lodash functions whenever possible. If there isn't an appropriate function in the library or if a comprehension would be more legible, use a comprehension. Only use native loops when necessary:

```coffeescript
# Yes
result = (item.name for item in array)

# No
results = []
for item in array
  results.push item.name
```

To filter:

```coffeescript
# Best
result = _.where array, name: test
# Okay
result = (item for item in array when item.name is "test")
```

To iterate over the keys and values of objects:

```coffeescript
object = one: 1, two: 2
alert("#{key} = #{value}") for key, value of object
```

<a name="#extending_native_objects"/>
## Extending Native Objects

Do not modify native objects. Ever.

For example, do not modify `Array.prototype` to introduce `Array#forEach`.

<a name="exceptions"/>
## Exceptions

Do not suppress exceptions.

<a name="annotations"/>
## Annotations

Use annotations *only* when necessary to describe a specific action that cannot be completed in the current sprint and when there is not a better place to document the missing feature. As a general rule, committed code should never contain TODOs where dev branches may contain them more as a note-to-self.

Write the annotation on the line immediately above the code that the annotation is describing.

The annotation keyword should be followed by a colon and a space, and a descriptive note.

```coffeescript
# FIXME: The client's current state should *not* affect payload processing.
resetClientState()
processPayload()
```

Annotation types:

The only annotation type that should be used is `TODO` such that any notes can be easily grepped.

<a name="miscellaneous"/>
## Miscellaneous

`and` is preferred over `&&`.

`or` is preferred over `||`.

`is` is preferred over `==`.

`not` is preferred over `!`.

`or=` should be used when possible:

```coffeescript
temp or= {} # Yes
temp = temp || {} # No
```

Prefer shorthand notation (`::`) for accessing an object's prototype:

```coffeescript
Array::slice # Yes
Array.prototype.slice # No
```

Prefer `@property` over `this.property`.

```coffeescript
return @property # Yes
return this.property # No
```

However, avoid the use of **standalone** `@`:

```coffeescript
return this # Yes
return @ # No
```

Avoid `return` where not required, unless the explicit return increases clarity. If a function or method is not intended to return anything, end the declaration with a `return` statement.

Use splats (`...`) when working with functions that accept variable numbers of arguments:

```coffeescript
console.log args... # Yes

(a, b, c, rest...) -> # Yes
```

[coffeescript]: http://jashkenas.github.com/coffee-script/
[coffeescript-issue-425]: https://github.com/jashkenas/coffee-script/issues/425
[spine-js]: http://spinejs.com/
[spine-js-code-review]: https://gist.github.com/1005723
[pep8]: http://www.python.org/dev/peps/pep-0008/
[ruby-style-guide]: https://github.com/bbatsov/ruby-style-guide
[google-js-styleguide]: http://google-styleguide.googlecode.com/svn/trunk/javascriptguide.xml
[common-coffeescript-idioms]: http://arcturo.github.com/library/coffeescript/04_idioms.html
[coffeescript-specific-style-guide]: http://awardwinningfjords.com/2011/05/13/coffeescript-specific-style-guide.html
[coffeescript-faq]: https://github.com/jashkenas/coffee-script/wiki/FAQ
[camel-case-variations]: http://en.wikipedia.org/wiki/CamelCase#Variations_and_synonyms
[original]: https://github.com/polarmobile/coffeescript-style-guide
[codo]: https://github.com/coffeedoc/codo
