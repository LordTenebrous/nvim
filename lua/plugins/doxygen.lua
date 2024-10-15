return {
  'LeonWandruschka/DoxygenToolkit.vim',
  config = function()
    vim.g.DoxygenToolkit_commentType = "C++"
    vim.g.DoxygenToolkit_blockHeader = ""
    vim.g.DoxygenToolkit_blockFooter = ""
    vim.g.DoxygenToolkit_blockHeader_AuthorBlock = "----------------------------------------"
    vim.g.DoxygenToolkit_blockFooter_AuthorBlock = "----------------------------------------"
    vim.g.DoxygenToolkit_GroupID = "Group: <id>"
    vim.g.DoxygenToolkit_authorName = "Author: <author>"
  end
}
