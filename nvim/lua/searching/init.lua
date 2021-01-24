require('telescope').setup{
  defaults = {
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    generic_sorter =  require'telescope.sorters'.fzy_sorter,
  }
}
