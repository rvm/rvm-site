// Progressive enhancements. The site works without this file.
(function () {
  "use strict";

  // The docs index stays open beside the page on wide screens.
  var toc = document.querySelector(".toc__wrap");
  if (toc && window.matchMedia("(min-width: 60.01rem)").matches) toc.open = true;

  // A copy key on every command block.
  document.querySelectorAll("pre.code").forEach(function (pre) {
    if (!navigator.clipboard) return;
    var button = document.createElement("button");
    button.type = "button";
    button.className = "copy";
    button.textContent = "Copy";
    button.setAttribute("aria-label", "Copy this command");
    button.addEventListener("click", function () {
      var text = pre.innerText.replace(/^\$ /gm, "").trim();
      navigator.clipboard.writeText(text).then(function () {
        button.textContent = "Copied";
        setTimeout(function () { button.textContent = "Copy"; }, 1600);
      }, function () {
        button.textContent = "Select and copy";
      });
    });
    var wrap = document.createElement("div");
    wrap.className = "code-wrap";
    pre.parentNode.insertBefore(wrap, pre);
    wrap.appendChild(pre);
    wrap.appendChild(button);
  });

  // Without the DocSearch dropdown, the search box falls back to a web search
  // limited to rvm.io.
  var form = document.querySelector("form.search");
  if (form) {
    form.addEventListener("submit", function () {
      var input = form.querySelector("input[name=q]");
      if (input && input.value.indexOf("site:rvm.io") === -1) {
        input.value = "site:rvm.io " + input.value;
      }
    });
  }
})();
