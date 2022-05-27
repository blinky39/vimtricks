## Vim tricks

[full vimrc](.vimrc)
### the ultimate copy to clipboard keymap
    ```
    " xclip needed
    vnoremap <silent> <Leader>y :w !xclip -in -selection clipboard<CR><ESC>
    ```
    <Leader>y to copy selection to clipboard
### keybindings
    ```
    noremap <Leader>a ggVG " select all
    ```
