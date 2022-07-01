payload="$(jq -c -n --arg query "$(cat spec/read.graphql)" '{"query": $query}')"
echo $payload
curl -i \
    -H 'Content-Type: application/json' \
    -d "$payload" \
    localhost:8080/query