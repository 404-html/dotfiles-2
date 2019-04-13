#!/bin/bash

hash kubectl 2>/dev/null || return


if [[ "$(ps -p$$ -ocmd=)" =~ .*zsh.* ]]; then
    source <(kubectl completion zsh)
elif [[ "$(ps -p$$ -ocmd=)" =~ .*bash.* ]]; then
    source <(kubectl completion bash)
fi

if [ -d $HOME/.kube ] && [ "$(ls $HOME/.kube/)" ]; then
    export KUBECONFIG="$(echo -n $HOME/.kube/config* | tr ' ' ':')"
fi

alias k=kubectl
