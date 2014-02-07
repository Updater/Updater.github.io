# Updater HTML Style Guide

If you're visiting from the internet, feel free to learn from our style. This is a guide we use for our own apps internally at GitHub. We encourage you to set up one that works for your own team.

## Doctype

A proper Doctype which triggers standards mode in your browser should always be used. Quirks mode should always be avoided as it can cause unwanted style and behavior changes on our site.

Despite our extreme fondness for Internet Explorer and it's many versions, we will only be supporting HTML5 and therefore use the new HTML5 doctype:

`<!DOCTYPE html>`

## HTML Guidelines

* Paragraphs of text should always be placed in a `<p>` tag. Avoid using multiple `<br/>` tags and just create a second `<p>` tag if you need large line breaks.
* Items in list form should always be in `<ul>` or `<ol>`. Never a set of `<div>` or `<p>` tags.
* Every form input that has text attached should utilize a `<label>` tag. Especially radio or checkbox elements.
* Even though quotes around attributes is optional, always put quotes around attributes for readability.
`<p class="line note" data-attribute="106">This is my paragraph of special text.</p>`
* Make use of `<thead>`, `<tfoot>`, `<tbody>`, and `<th>` tags (and Scope attribute) when appropriate. (note: `<tfoot>` goes above `<tbody>` for speed reasons. You want the browser to load the footer before a table full of data.)

```html
<table summary="This is a chart of invoices for 2011.">
  <thead>
    <tr>
      <th scope="col">Table header 1</th>
      <th scope="col">Table header 2</th>
    </tr>
  </thead>
  <tfoot>
    <tr>
      <td>Table footer 1</td>
      <td>Table footer 2</td>
    </tr>
  </tfoot>
  <tbody>
    <tr>
      <td>Table data 1</td>
      <td>Table data 2</td>
    </tr>
  </tbody>
</table>
```

## Page Titles

Page titles should generally consist of a human-friendly description of the page, a bar and the name of the company. A good example is:

```html
<title>How to Change Your Address for Mail | Updater</title>
```

## Styles

Any styles relating to a page should always be stored in an external style document. Inline styles are **forbidden**. Link to the external document in the `<head>` of the page so the styles load before the content and there isn't a FOUC.

## SEO and Accessibility

Try to always be mindful of SEO and accessibility best practices. Use clear and verbose descriptions when writing text or at least clear and simple descriptions for labels and short text.

Use descriptive alt text for images if they're important content and keep them as a background image if they're not important content. Try to always have images available in the most appropriate format. JPG for photos and SVG+PNG for icons, logos and things that have large blocks of solid color.

Keep in mind that javascript may fail or be disabled for some users and code the site to be functional even without javascript. Forms should submit on their own, links should take you to another page and content should be on the page by default if it's important.

## Templates

Server-side, all of our HTML is written using Handlebars and client-side, any templating should be overlayed on that HTML using Angular. Server-side, use standard handlebars includes like:

```handlebars
{{> error-template}}
```

All included javascript templates should have names ending with `-template.hbs`. While it it acceptable to inline templates in this way, never inline real scripts in handlebars templates. 

Any html templates that need to be injected on the page should be kept in separate files, in `<script type='text/ng-template' id='error-template'>` tags. The file should be saved in `views/templates/` and inline-required in the affected handlebars page/partial. This will allow designers and junior developers to easily see how HTML is structured and apply appropriate styles.

## Scripts

Always include scripts as far toward the bottom of the document as possible. If the script isn't critical for the functionality of the page or other scripts, load it asynchronously. Always use links and never inline scripts.