MODEL="granite"

URL1="https://LLM_HOST"
URL2="v1/chat/completions"
URL="${URL1}/${URL2}"

lm_eval --model local-chat-completions \
--tasks gsm8k \
--model_args model=$MODEL,base_url=$URL,num_concurrent=1,max_retries=3,tokenized_requests=False,verify_certificate=False \
--apply_chat_template \
--limit 1 \
--log_samples \
--output_path ./
