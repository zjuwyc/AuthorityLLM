from modelscope import (AutoModelForCausalLM, AutoTokenizer, GenerationConfig, snapshot_download)

import torch
model_dir = snapshot_download('Fengshenbang/Ziya-LLaMA-13B-v1', 'master')

print(model_dir)