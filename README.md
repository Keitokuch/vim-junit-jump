# vim-junit-jump
A vim plugin for jumping between a Java class and JUnit test class

### Installation 
Using [vim-plug](https://github.com/junegunn/vim-plug)

add to .vimrc
```vim
Plug 'keitokuch/vim-junit-jump'
```

### Usage
To jump from a Java class file to the test file, or from a test file to the class file
```vim
:JavaJUnitJump
```

### Custom Mapping
Use `gt` in normal mode to jump to test:
```
nnoremap gt :JavaJUnitJump<CR>
```
