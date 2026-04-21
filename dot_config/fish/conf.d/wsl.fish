# Ignore on non-WSL environments
if not string match -rq 'microsoft|wsl' -- (uname -r)
    return
end

# AMD ROCDXG library (https://github.com/ROCm/librocdxg/)
set HSA_ENABLE_DXG_DETECTION 1
