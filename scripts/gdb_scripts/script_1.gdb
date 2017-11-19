set width 0
set height 0
set verbose off

# at entry point - cmd1
b main
commands 1
  print argc
  continue
end

# printf line - cmd2
b test_1.c:17
commands 2
  p i
  p b
  continue
end

# int b = line - cmd3
b test_1.c:16
commands 3
  p i
  p b
  continue
end


# note: even if arguments are shown;
# must specify cmdline arg for "run"
show args
printf "Note, however: in batch mode, arguments will be ignored!\n"

run 2     # run
quit
