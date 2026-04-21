# Ignore on non-WSL environments
if not string match -rq 'microsoft|wsl' -- (uname -r)
    return
end

# AMD ROCDXG library (https://github.com/ROCm/librocdxg/)
set -gx HSA_ENABLE_DXG_DETECTION 1

# Ollama
# NOTE: `librocdxg` is not supported yet by Ollama, remove it when needed: https://github.com/ollama/ollama/issues/5275
set -l WIN_HOST (ip route show | grep -i default | awk '{ print $3 }')
set -gx OLLAMA_HOST "http://$WIN_HOST:11434"
