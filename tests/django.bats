#!/usr/bin/env bats

@test "test empty dir" {
  run deployer django
  [ "$status" -eq 104 ]
  [[ "${lines[0]}" =~ "Could not find the manage.py file in the current directory!" ]]
}


@test "start a new Django project" {
  run deployer new django <<< "test_django"
  [ "$status" -eq 0 ]
}


@test "run a Django project" {
  run deployer django
  [ "$status" -eq 0 ]
}
