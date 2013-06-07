---
title: "Pow - RVM integration"
---

## Using RVM with Pow

Pow has removed automated detection of rvm, here is how it can be restored by creating
`.powenv` in the root of the project, according to [Pow docs](http://pow.cx/manual.html#section_2.2)
it should not be checked in to source control (unless all team members agree on that).

`.powenv`:

    # detect `$rvm_path`
    if [ -z "${rvm_path:-}" ] && [ -x "${HOME:-}/.rvm/bin/rvm" ]
    then rvm_path="${HOME:-}/.rvm"
    fi
    if [ -z "${rvm_path:-}" ] && [ -x "/usr/local/rvm/bin/rvm" ]
    then rvm_path="/usr/local/rvm"
    fi

    # load environment of current project ruby
    if
      [ -n "${rvm_path:-}" ] &&
      [ -x "${rvm_path:-}/bin/rvm" ] &&
      rvm_project_environment=`"${rvm_path:-}/bin/rvm" . do rvm env --path 2>/dev/null` &&
      [ -n "${rvm_project_environment:-}" ] &&
      [ -s "${rvm_project_environment:-}" ]
    then
      echo "RVM loading: ${rvm_project_environment:-}"
      \. "${rvm_project_environment:-}"
    else
      echo "RVM project not found at: $PWD"
    fi

## Resources

* [Pow `.rvmrc` example](http://pow.cx/manual.html#section_2.3.2)
