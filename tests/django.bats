#!/usr/bin/env bats


@test "test empty dir" {
  run deployer django
  [ "$status" -eq 104 ]
  [[ "${lines[0]}" =~ "Could not find the manage.py file in the current directory!" ]]
}


@test "start with mkdir: permission denied" {
  run deployer new django skip <<< "test_django"
  [ "$status" -eq 110 ]
}


@test "start a new Django project" {
  cd ~
  run deployer new django skip <<< "test_django"
  [ "$status" -eq 0 ]
  [ -f ./test_django/.gitignore ]
  [ -f ./test_django/django/manage.py ]
  [ -x ./test_django/django/manage.py ]
  [ "$(grep 'STATIC_ROOT = BASE_DIR / "staticfiles"' ./test_django/django/test_django/settings.py)" ]
}


@test "run a Django project" {
  cd ~
  run deployer django test
  [ "$status" -eq 0 ]
  [[ "${lines[1]}" =~ "Ran 0 tests" ]]
  [[ "${lines[2]}" = "OK" ]]
}
