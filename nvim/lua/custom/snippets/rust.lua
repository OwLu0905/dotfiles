-- !implement
require("luasnip.session.snippet_collection").clear_snippets "rust"

local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node

ls.snippets = {
  rust = {
    s("cmt", {
      t {
        "#[cfg(test)]",
        "mod test {",
        "    use super::*;",
        "",
        "    #[test]",
        "    fn foo() {}",
        "}",
      },
    }),
  },
}
