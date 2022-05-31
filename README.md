## Vim tricks

[full vimrc](.vimrc)
### the ultimate copy to clipboard keymap (xclip needed)
<pre>vnoremap <silent> <Leader>y :w !xclip -in -selection clipboard<CR><ESC>
</pre>
use \<Leader\>y to copy selection to clipboard
+ note that if your vim has `+clipboard` feature, you can set `set clipboard+=unnamedplus` in your vimrc, and default y p command will directly use system clipboard instead of vim registers. \
    (neovim often has this feature build in)
### keybindings
+ select all:
<pre>noremap <Leader>a ggVG</pre>
