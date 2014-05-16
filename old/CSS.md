# Updater CSS Style Guide

Welcome to the Updater CSS Styleguide. It's pretty rad. Before reading this, it's recommended that you are familiar with or research __specificity__, the SCSS syntax, and common network bottlenecks/reasons for slow page loading time.

Some of these practices are not fully implemented yet so please update/upgrade files as you work on them.

If you're visiting from the internet, feel free to learn from our style. This is a guide we use for our own apps internally at Updater. We encourage you to set up one that works for your own team.

## CSS Syntax Style

* Use a two space indent with no tabs.
* Put spaces after `:` in property declarations.
* Put spaces before `{` in rule declarations.
* Use hex color codes `#000` unless using rgba.
* Use `//` for inline comments (instead of `/* */`).
* Document styles as much as possible with inline comments that explain what the code does if it's not perfectly clear.
* Comments should always go on the line above the thing they describe.

Here is good example syntax:

```scss
// This is a good example!
.styleguide-format {
  border: 1px solid #0f0;
  color: #000;
  background: rgba(0,0,0,0.5);
  .border-radius(5px, 30px);
  // Disables strange chrome-adding behavior in Safari.
  -webkit-rendering-shadow-chrome: false;
}
```

## SCSS Style

* Any `@variable` or `.mixin` that is used in more than one file should be defined in `assets/css/globals/`. Others should be put at the top of the file where they're used.
* As a rule of thumb, don't nest further than 3 levels deep. If you find yourself going further, think about reorganizing your rules (either the specificity needed, or the layout of the nesting). The are 2 dangers here besides code complexity. One is that you will create styles that are borderline impossible to override in other modules because they're too specific. The other is that you will bloat the style files and slow down the loading speed of the site.

## File Organization

All styles should **ALWAYS** be written in well-orgainzed files. CSS should **never** be written inline in your HTML for any reason.

In general, the CSS file organization should be separated into page/content specific files and any shared code written as modules and follow something like this:

```
assets
└── css
    ├── globals
    │   ├── fonts.scss
    │   ├── icons.scss
    │   ├── colors.scss
    │   ├── header.scss
    │   ├── footer.scss
    │   └── agent.scss
    │
    ├── partner
    │   ├── bhg.scss
    │   ├── allentate.scss
    │   └── remax.scss
    │
    ├── global.scss
    ├── homepage.scss
    ├── change_of_address.scss
    └── agent_signup.scss
```

You should explicitly **import** any global SCSS that is required for the document you're working on. Do not import files that are not in the globals folder. If they are shared styles, they should always go in globals. Here's a good example:

```scss
@import 'globals/fonts';
@import 'globals/colors';

.rule {
  .font-family();
  background: green;
  ...
}
```

Any partner-specific CSS should be stored in the assets/css/partner/ folder. This is a temporary measure as we move to storing partner style options in a more scalable manner.

## Pixels vs. Ems

Use `62.5%` for the root `font-size`, because it makes all other numbers easier to understand. For all other `font-size`s, use `em`s. This is because versions of IE below 10 do not offer zoom functionality and can only change relative font sizes for accessibility. For the same reason, don't use `rem`s because of their poor historical browser support. Additionally, `line-height` should never have a unit because it does not inherit a percentage value of its parent element, but instead is based on a multiplier of the font-size.

Reference: [Pixels vs Ems](http://snook.ca/archives/html_and_css/font-size-with-rem)

## Class naming conventions

Never reference `js-` prefixed class names from CSS files. `js-` are used exclusively from JS files. Try to give classes descriptive names like `.header-logo-container` instead of something like `.blue`.

## Specificity (classes vs. ids)

Because of their very high specificity it's recommended to never use IDs for CSS. Use a descriptive class name and nest as little as possible so that your modular CSS rules are easy to override in other sections of the site.

Only start with an element + class namespace when writing styles that need to override other classes and when the styles will only ever be applied to one type of element, prefer concise selectors by default, and use as little specificity as possible. Always include a newline between selectors. Here is a good example:

```html
<ul class="category-list">
  <li class="item">Category 1</li>
  <li class="item">Category 2</li>
  <li class="item">Category 3</li>
</ul>
```

```scss
// Needed to override .category-list in bootstrap.
ul.category-list {
  padding-left: 20px;

  .list-item { // direct descendant selector > for list items
    list-style-type: disc;

    a { // minimal specificity for all links
      color: #ff0000;
    }
  }
}
```

## CSS Specificity guidelines

* If you must use an id selector (`#selector`) make sure that you have no more than one in your rule declaration. A rule like `#header .search #quicksearch { ... }` is considered harmful.
* When modifying an existing element for a specific use, try to use specific class names. Instead of `.listings-layout.bigger` use rules like `.listings-layout.listings-bigger`. Think about `ack/grepping` your code in the future.
* The class names `disabled`, `mousedown`, `danger`, `hover`, `selected`, `active` and any others used by Bootstrap should always be namespaced by a class (`button.selected` is a good example).

## Grid Layouts

We use Bootstrap's grid system and this should be embraced in design and development as much as possible. The grid system keeps positioning styles out of our CSS and makes our HTML easier to read and write.
