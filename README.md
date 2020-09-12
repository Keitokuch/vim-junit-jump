# vim-junit-jump
A vim plugin for jumping between a Java class and JUnit test class

### Installation via vim-plug
add to vimrc
```vim
call plug#begin()
Plug 'keitokuch/vim-junit-jump'
call plug#end()
```

### Usage
To jump from a Java class file to the test file, or from test file to the class file
```vim
:JavaJUnitJump
```

### Custom Mapping
```
nnoremap gt :JavaJUnitJump<CR>
