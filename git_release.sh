#!/bin/bash

version="Release_1_0"
text="test"
repo_full_name="rmunde1493/temp"
token=$(git config --global github.token)

generate_post_data()
{
  cat <<EOF
{
  "tag_name": "$version",
  "name": "$version",
  "body": "$text",
  "draft": false,
  "prerelease": false
}
EOF
}
echo "Create release $version for repo: $repo_full_name branch: $branch"
curl --data "$(generate_post_data)" "https://api.github.com/repos/$repo_full_name/releases?access_token=$token"


curl -s -H "Authorization: token $token"  \
        -H "Content-Type: application/zip" \
        --data-binary @release1.zip  \
        "$upload_url?name=release1.zip&label=release1.zip"
