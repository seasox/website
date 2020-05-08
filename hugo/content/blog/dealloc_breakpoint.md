+++
date = "2019-04-12T17:19:19+02:00"
draft = false
title = "Life Hack: Set a symbolic breakpoint to track down UIViewController memory leaks"

+++

Add a symbolic breakpoint on -[UIViewController dealloc] to get a "Pop" sound each time a UIViewController gets deallocated. You probably want to check "Automatically continue after evaluating actions", though.

![Breakpoint on -[UIViewController dealloc] with a "Pop" sound and log message](/img/dealloc_breakpoint.png)
