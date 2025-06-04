" test-themes.vim - Test script for iB-theme VIM themes
" Maintainer: iB-theme <themanpfc@outlook.com>
" Version: 1.0.0
" License: GPL v3+

" Description:
" Test script to validate iB-theme VIM themes functionality.
" Run this script to ensure both themes load correctly.

function! TestIBThemes()
  echo "Testing iB-theme VIM themes..."
  echo "=============================="
  echo ""
  
  " Test dark theme
  echo "Testing dark theme..."
  try
    colorscheme ib-theme-dark
    echo "✓ ib-theme-dark loaded successfully"
    echo "  Current colorscheme: " . g:colors_name
  catch
    echo "✗ Failed to load ib-theme-dark: " . v:exception
    return
  endtry
  
  " Wait a moment
  sleep 1
  
  " Test light theme
  echo ""
  echo "Testing light theme..."
  try
    colorscheme ib-theme-light
    echo "✓ ib-theme-light loaded successfully"
    echo "  Current colorscheme: " . g:colors_name
  catch
    echo "✗ Failed to load ib-theme-light: " . v:exception
    return
  endtry
  
  echo ""
  echo "Testing highlight groups..."
  
  " Test key highlight groups
  let test_groups = [
    \ 'Normal',
    \ 'Comment',
    \ 'String',
    \ 'Keyword',
    \ 'Function',
    \ 'Type',
    \ 'Number',
    \ 'StatusLine',
    \ 'CursorLine',
    \ 'Visual'
  \ ]
  
  for group in test_groups
    if hlexists(group)
      echo "✓ Highlight group '" . group . "' is defined"
    else
      echo "✗ Highlight group '" . group . "' is not defined"
    endif
  endfor
  
  echo ""
  echo "Testing theme switching function..."
  
  " Test theme switching
  if exists('*ToggleIBTheme')
    echo "✓ ToggleIBTheme function is available"
    try
      call ToggleIBTheme()
      echo "✓ Theme switching works"
    catch
      echo "✗ Theme switching failed: " . v:exception
    endtry
  else
    echo "⚠ ToggleIBTheme function not found (install script adds this)"
  endif
  
  echo ""
  echo "Testing color support..."
  
  " Check color support
  if &t_Co >= 256
    echo "✓ Terminal supports " . &t_Co . " colors"
  else
    echo "⚠ Terminal only supports " . &t_Co . " colors (256+ recommended)"
  endif
  
  if has('termguicolors') && &termguicolors
    echo "✓ True color support is enabled"
  elseif has('termguicolors')
    echo "⚠ True color support available but not enabled"
  else
    echo "⚠ True color support not available"
  endif
  
  echo ""
  echo "Testing syntax highlighting..."
  
  " Create a temporary buffer with sample code
  new
  setlocal buftype=nofile
  setlocal bufhidden=wipe
  setlocal noswapfile
  
  " Add sample code for testing
  call append(0, [
    \ '// Sample code for testing syntax highlighting',
    \ '#include <stdio.h>',
    \ '',
    \ 'int main() {',
    \ '    char *message = "Hello, World!";',
    \ '    printf("%s\n", message);',
    \ '    return 0;',
    \ '}',
    \ '',
    \ '/* Multi-line comment',
    \ '   for testing purposes */',
    \ '',
    \ 'function testFunction() {',
    \ '    const number = 42;',
    \ '    const boolean = true;',
    \ '    return number + boolean;',
    \ '}'
  \ ])
  
  " Set file type for syntax highlighting
  setfiletype c
  
  echo "✓ Created test buffer with syntax highlighting"
  echo "  Check the syntax highlighting in the test buffer"
  echo "  Press any key to close the test buffer..."
  
  " Wait for user input
  call getchar()
  
  " Close test buffer
  bdelete!
  
  echo ""
  echo "Theme testing complete!"
  echo "======================"
  echo ""
  echo "If all tests passed, your iB-theme installation is working correctly."
  echo "Use :colorscheme ib-theme-dark or :colorscheme ib-theme-light to switch themes."
  
endfunction

" Command to run the test
command! TestIBThemes call TestIBThemes()

" Auto-run message
echo "iB-theme test script loaded."
echo "Run :TestIBThemes to test the themes." 