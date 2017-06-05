# width of indent with spaces
set global indentwidth 4

# width of tab
set global tabstop 4

# use spaces tabs for alignment
set global aligntab false

# keep space around cursor
set global scrolloff 5,7

# insert spaces instead of tabs
# license : WTFPL  - (aka I don't know how to make an addition to the wiki)
map global insert <backspace> '<a-;>:insert-bs<ret>'

hook global InsertChar \t %{
    exec -draft h@
}

# supposed to make <backspace> remove 4 spaces
def -hidden insert-bs %{
    try %{
        # delete indentwidth spaces before cursor
        exec -draft -no-hooks h %opt{indentwidth}H <a-k>\A<space>+\Z<ret> d
    } catch %{
        exec <backspace>
    }
}

# add line numbers to all editors
hook global WinCreate .* %{ add-highlighter number_lines }

# use "jk" instead of "ESC"
hook global InsertChar k %{ try %{
  exec -draft hH <a-k>jk<ret> d
    exec <esc>
}}
