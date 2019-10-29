// Select each textarea with the class picco_comment_editor and add SimpleMDE editor

(function() {
  document.querySelectorAll('textarea.picco_comment_editor').forEach(function(textareaElement) {
      var simplemde = new SimpleMDE({
          element: textareaElement,
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
})();
