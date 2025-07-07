# UP

A simple command-line application that
allows you to follow easily which episode comes next.

## Problem

Imagine that you are watching a TV show and
this is the content of the current directory:

```text
episode-001.mp4
episode-002.mp4
episode-003.mp4
episode-004.mp4
episode-005.mp4
episode-006.mp4
episode-007.mp4
episode-008.mp4
episode-009.mp4
episode-010.mp4
```

You watch episode 5 and then you take a pause. A few days later, you want to continue, but you have no idea where you left off. Sounds familiar?

## Solution

Execute the binary `up` and it'll create
an empty subfolder. First, it is called
`seen_00/`. Then, when you watched an episode,
execute `up` and it'll rename the folder
to `seen_01/`, then `seen_02/`, etc. Every
time, it'll increment the counter. This way,
you'll always know which episode is the next one.

You can also provide a command-line argument
to the program, a number. Example:

```bash
$ up 8
```

And it'll create the subfolder `seen_08/`.
Use it only for initialization. After that,
just launch `up` without any arguments.

## Compiling

The project is written in [D](https://dlang.org/). You can use any D compiler. Here is
an example with the reference compiler:

```bash
$ dmd main.d
```

Or, you can also use the provided `Makefile`:

```bash
$ make release
```

## Tested platforms

I tried it under Linux and Windows only.
