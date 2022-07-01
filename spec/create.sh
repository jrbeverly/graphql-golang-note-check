payload="$(jq -c -n --arg query "$(cat spec/create.graphql)" '{"query": $query}')"
echo $payload
curl -i \
    -H 'Content-Type: application/json' \
    -X POST \
    -d "$payload" \
    localhost:8080/query