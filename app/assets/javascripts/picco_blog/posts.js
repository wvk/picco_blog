// Select each textarea with the class picco_blog_editor and add SimpleMDE editor
// CodeMirror, copyright (c) by Marijn Haverbeke and others
// Distributed under an MIT license: http://codemirror.net/LICENSE

(function() {
  function toggleImageSelector(editor) {
    editor.gui.imagePicker.classList.toggle('hidden');
    return false;
  }

  document.querySelectorAll('textarea.picco_blog_editor').forEach(function(textareaElement) {
    var simplemde = new SimpleMDE({
      element: textareaElement,
      toolbar: [
        "bold", "italic", "heading", "strikethrough", "|",
        "quote", "unordered-list", "ordered-list", "|",
        "link", {name: 'select-image', className: 'fa fa-picture-o', title: 'Select Image', action: toggleImageSelector}, "table", "horizontal-rule", "|",
        "preview", "|", "guide"
      ],
      insertTexts: {
        horizontalRule: ["", "\n\n-----\n\n"],
        image: ["![](http://", ")"],
        link: ["[", "](http://)"],
        table: ["", "\n\n| Column 1 | Column 2 | Column 3 |\n| -------- | -------- | -------- |\n| Text     | Text      | Text     |\n\n"],
      },
      status: false
    });
    simplemde.render();

    document.querySelectorAll('.picco_blog_image_picker[data-for=' + textareaElement.id + ']').forEach(function(imageListElement){
      simplemde.gui.imagePicker = imageListElement;
      imageListElement.classList.add('hidden');
      var editor = simplemde.codemirror
      var cmWrapper = editor.getWrapperElement();
      cmWrapper.parentNode.insertBefore(imageListElement, cmWrapper);

      imageListElement.addEventListener('click', function(ev) {
        var img = ev.target.closest('.image');
        if (img) {
          var size = img.closest('.image-picker').querySelector('.config input[name=size]:checked').value;
          var a = img.querySelector('a');
          if (size == 'full') {
            editor.replaceSelection('![' + a.dataset.description + '](' + a.href + ')');
          } else {
            editor.replaceSelection('![' + a.dataset.description + '](' + a.dataset.previewUrl + ')');
          }
          simplemde.gui.imagePicker.classList.add('hidden');
          ev.preventDefault();
        }
      })
    });
  });
})();
