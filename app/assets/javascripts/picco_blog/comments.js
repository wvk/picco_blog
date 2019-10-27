// Select each textarea with the class picco_comment_editor and add SimpleMDE editor

$(document).ready(function() {
  $('textarea.picco_comment_editor').each(function() {
      var simplemde = new SimpleMDE({
          element: this,
          toolbar: [
            "bold", "italic", "strikethrough", "|",
            "quote", "unordered-list", "ordered-list", "|",
            "link", "table", "horizontal-rule", "|",
            "preview", "side-by-side", "fullscreen", "|", "guide"
          ],
          insertTexts: {
            horizontalRule: ["", "\n\n-----\n\n"],
            link: ["[", "](http://)"],
            table: ["", "\n\n| Spalte 1 | Spalte 2 | Spalte 3 |\n| -------- | -------- | -------- |\n| Text     | Text      | Text     |\n\n"],
          },
          status: false
      });
      simplemde.render();
  });
});
