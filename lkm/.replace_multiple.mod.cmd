savedcmd_replace_multiple.mod := printf '%s\n'   replace_multiple.o | awk '!x[$$0]++ { print("./"$$0) }' > replace_multiple.mod
