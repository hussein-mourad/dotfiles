return {
  "nvim-pack/nvim-spectre",
  opts = function()
    return {
      mapping = {
        send_to_qf = { map = "q" },
        replace_cmd = { map = "c" },
        show_option_menu = { map = "o" },
        run_current_replace = { map = "C" },
        run_replace = { map = "R" },
        change_view_mode = { map = "v" },
        resume_last_search = { map = "L" },
      },
    }
  end,
}
