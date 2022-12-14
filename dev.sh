#!/usr/bin/env bash

. ~/.bashrc.d/.dockerfunc.sh ""

main() {
  docker build -f Dockerfile.dev -t flask-gsheets .
  docker_run flask-gsheets pytest
  docker_run --name flask flask-gsheets bash
}

deploy() {
  docker build -t lasery/flask-gsheets .
  docker push lasery/flask-gsheets
}

test() {
  # mocking function
  function docker {
    echo "calling: docker $@"
  }

  local res=$(main)
  if ! [[ $res =~ "-f Dockerfile.dev" ]]; then
    echo "TEST FAILURE: dev "
    exit 1
  fi

  local res=$(deploy)
  if ! [[ $res =~ "push lasery/flask-gsheets" ]]; then
    echo "TEST FAILURE: deploy "
    exit 1
  fi

  echo test succeed!
}

if [[ "$1" = "test" ]]; then
  test "$@"
  exit 0
fi

if [[ "$1" = "deploy" ]]; then
  deploy "$@"
  exit 0
fi

main "$@"
