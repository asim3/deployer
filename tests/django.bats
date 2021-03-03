#!/usr/bin/env bats

@test "test empty dir" {
  run deployer django
  [ "${lines[0]}" = "run           install and collectstatic" ]
  [ "$status" -eq 104 ]
}


@test "start a new Django project" {
  run deployer django init
  [ "$status" -eq 0 ]
  [ "$output" = "Done" ]
}


@test "run a Django project" {
  run deployer django
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "run           install and collectstatic" ]
  [ "$output" = "Done" ]
}
