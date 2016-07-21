define snap
  dont-repeat
  set pagination off
  set print vtbl on
  set print demangle on
  set print union on
  set print object on
  set print pretty on
  set print array on
  set print array-indexes on
  set print object on
  set print static-members on
  set logging file gdb.log
  set logging redirect on
  set logging on
  attach $arg0
  thread apply all bt full
  output $_siginfo
  detach
end
