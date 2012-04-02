function ToggleBackgroundColour ()
  if (&background == 'light')
    set background=dark
    echo "background -> dark"
  else
    set background=light
    echo "background -> light"
  endif
endfunction
