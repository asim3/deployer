#!/usr/bin/env bats


@test "check install main" {
  run deployer install
  [ "$status" -eq 0 ]
  [[ "${lines[0]}" =~ "Usage:  deployer install COMMAND" ]]
}


@test "check install help" {
  run deployer install help
  [ "$status" -eq 0 ]
  [[ "${lines[0]}" =~ "Usage:  deployer install COMMAND" ]]
}


@test "install docker" {
  run deployer install docker
  [ "$status" -eq 0 ]
}
