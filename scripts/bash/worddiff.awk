BEGIN {
    RS="\n?~\n"
    FS="\n"
}

# Special case the diff header/chunk header lines.
/^diff --git/ {
    print
    next
}

{
    delete outs
    for (i=1; i<=NF; i++) {
        if ($i ~ /^[-+]/) {
            mode = substr($i, 1, 1)
            $i = ((mode=="-")?red:green) substr($i, 2) reset
            outs[mode] = outs[mode] $i reset
            outs["set" mode]++
        } else {
            gsub(/^ /, "", $i)
            outs["-"] = outs["-"] $i
            outs["+"] = outs["+"] $i
        }
    }

    # If we didn't have any changes then this is a context line and we need to
    # print it out.
    if (!outs["set-"] && !outs["set+"]) {
        print " " outs["-"]
        next
    }

    if (outs["set-"]) {
        print red "-" reset outs["-"]
    }

    if (outs["set+"]) {
        print green "+" reset outs["+"]
    }
}
