
REGEX_TYPE_FINISH = /^\s*(.*)\s*(-->-)\s*(.*)\s*:\s*(.*)\s*$/

# Finish occurrence {finish}
matches = REGEX_TYPE_FINISH.match(line)
if matches
    n = [ matches[2], matches[1], matches[3], matches[4] ]
end
