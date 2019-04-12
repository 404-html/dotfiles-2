#!/bin/bash

hash kubectl 2>/dev/null || return

if [[ "$(ps -p$$ -ocmd=)" =~ .*zsh.* ]]; then
    source <(kubectl completion zsh)
elif [[ "$(ps -p$$ -ocmd=)" =~ .*bash.* ]]; then
    source <(kubectl completion bash)
fi

export KUBECONFIG="$(ls $HOME/.kube/config* | tr '\n' ':' | sed -e 's/:$//g')"
alias k=kubectl

