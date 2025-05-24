#!/bin/bash

URL1="https://LLM_HOST"
URL2="v1/chat/completions"
URL="${URL1}/${URL2}"

MODEL="granite"
CONTENT="$@"

curl -k -q -X POST "$URL" \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d "{
    \"model\": \"$MODEL\",
    \"messages\": [
      {\"role\": \"system\", \"content\": \"Answer the user's requests as clearly and directly as possible, without adding opinions.\"},
      {\"role\": \"user\", \"content\": \"$CONTENT\"}
    ]
  }" | jq .
