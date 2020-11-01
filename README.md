# `init`
LispKit Linux Initialization.

## What's this?
From [Wikipedia](https://en.wikipedia.org/wiki/Init):

> `init` (short for initialization) is the first process started during
> booting of the computer system. Init is a daemon process that
> continues running until the system is shut down. It is the direct or
> indirect ancestor of all other processes and automatically adopts all
> orphaned processes. Init is started by the kernel during the booting
> process; a kernel panic will occur if the kernel is unable to start
> it. Init is typically assigned process identifier 1.

LispKit Linux aims to create an initialization implementation that is
easy to understand and modify. Basically we're using the KISS
principle which is common in LispKit code. [Flecker's
`init`](http://ewontfix.com/14/) is a simple `init` in which process
identifier 1 is respected and results in start another process and
taking on the sole responsibility of reaping zombie processes.