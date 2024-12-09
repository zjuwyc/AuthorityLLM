from modelscope.utils.constant import Tasks
from modelscope.pipelines import pipeline
pipe = pipeline(task=Tasks.text_generation, model='Fengshenbang/Ziya-LLaMA-13B-v1', model_revision='v1.0.7', device_map='auto')
query="帮我写一份去西安的旅游计划"
inputs = '<human>:' + query.strip() + '\n<bot>:'
result = pipe(inputs, max_new_tokens=1024, do_sample=True, top_p=0.85, temperature=1.0, repetition_penalty=1., eos_token_id=2, bos_token_id=1, pad_token_id=0)
print(result['text'])