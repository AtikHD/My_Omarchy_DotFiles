# Run Fastfetch when opening an interactive terminal
if status is-interactive
    fastfetch
end

oh-my-posh init fish --config jandedobbeleer | source
