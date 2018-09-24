
# Finish occurrence {finish}

if matches = /^\s*(.*)\s*(-->-)\s*(.*)\s*:\s*(.*)\s*$/.match(line)
    n = [ matches[2], matches[1], matches[3], matches[4] ]

# Return message {return}

elseif matches = /^\s*(.*)\s*(-->)\s*(.*)\s*:\s*(.*)\s*$/.match(line)
    n = [matches[2], matches[1], matches[3], matches[4] ]
    
# Start occurrence {start}
elseif matches = /^\s*(.*)\s*(->\+)\s*(.*)\s*:\s*(.*)\s*$/.match(line)
    n = [matches[2], matches[1], matches[3], matches[4] ]

# Object creation message {create}    
elseif matches = /^\s*(.*)\s*(->\*)\s*(.*)\s*:\s*(.*)\s*$/.match(line)
    n = [matches[2], matches[1], matches[3], matches[4] ]

# (Synchronous) message {call}
elseif matches = /^\s*(.*)\s*(->)\s*(.*)\s*:\s*(.*)\s*$/.match(line)
    n = [matches[2], matches[1], matches[3], matches[4] ]

end
