#!/bin/bash

# gpg --list-signatures 실행 결과
gpg_output=$(gpg --list-signatures)

# 특정 키 ID를 추출하기 위해 grep 사용
key_id=$(echo "$gpg_output" | grep -oP 'sig \d+\s+\K[0-9A-F]+')

# 추출된 키 ID 출력
echo "Key ID: $key_id"

version="1.0.3-test"
dpkg-sig -k $key_id --sign posod cpack-study_${version}_amd64.deb