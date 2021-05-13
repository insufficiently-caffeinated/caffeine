# Tracing in Caffeine

This document is meant to serve as a guide for using tracing within caffeine.

## Creating a Trace File
If you just want to look at existing tracing info then the first thing you'll
need to do is to collect a trace from a run of caffeine. This is done by
running caffeine with the `--trace` parameter
```sh
caffeine test-file.bc main --trace caffeine.trace
```

Then, caffeine will write the trace to `caffeine.trace`.

## Viewing the trace file in Chrome
As is, the trace file is more or less a binary blob. This isn't very useful.
Chrome has a built-in trace viewer available at <chrome://tracing> and we 
can use this to view the traces.

To start off, clone the tracing tools repo at
<https://github.com/insufficiently-caffeinated/tracing-tools>. From now on I'll
assume that the `convert-to-chrome-trace` tool is available in the path but you
can just use `cargo run --bin convert-to-chrome-trace --` instead.

To convert the caffeine trace to the chrome trace event format you need to run
```sh
convert-to-chrome-trace path/to/caffeine.trace --output chrome-trace.json
```

Then, go to <chrome://tracing> and open up `chrome-trace.json` by clicking the
"load" button.

