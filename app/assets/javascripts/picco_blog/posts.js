// Select each textarea with the class picco_blog_editor and add SimpleMDE editor
// CodeMirror, copyright (c) by Marijn Haverbeke and others
// Distributed under an MIT license: http://codemirror.net/LICENSE

$(document).ready(function() {
  function toggleImageSelector(editor) {
    console.log(editor);
    editor.gui.imagePicker.classList.toggle('hidden');
    return false;
  }

  $('textarea.picco_blog_editor').each(function() {
    var simplemde = new SimpleMDE({
        element: this,
        toolbar: [
          "bold", "italic", "heading", "strikethrough", "|",
          "quote", "unordered-list", "ordered-list", "|",
          "link", {name: 'select-image', className: 'fa fa-picture-o', title: 'Bild Auswählen', action: toggleImageSelector}, "table", "horizontal-rule", "|",
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

    $('.picco_blog_image_picker[data-for=' + this.id + ']').each(function(){
      simplemde.gui.imagePicker = this;
      this.classList.add('hidden');
      var editor = simplemde.codemirror
      var cmWrapper = editor.getWrapperElement();
      cmWrapper.parentNode.insertBefore(this, cmWrapper);

      $(this).on('click', function(ev) {
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

  if($("#post_tag_list").length) {
    $("#post_tag_list").tagit({
        availableTags: available_tags
    });
  }
});
