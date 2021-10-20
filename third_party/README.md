# Third Party Dependencies

This folder contains bazel build files for setting up and interacting with
caffeine's dependencies.

## Folder Layout
Generally, each top-level dependency has a folder under `third_party` which
contains at the minimum a bazel macro that does the needed setup for the repo.
It may also contain any other files that are needed to interact with the repo,
such as patches, build files, or bazel macros that get used by caffeine.

With that, the folder will usually look like this
- `BUILD`: Usually mostly empty, for more complicated libraries may contain
  aliases for targets in the external repo.
- `setup.bzl`: Contains a macro of the form `setup_<libname>` which is called
  within `WORKSPACE` and will actually acquire the repo from external sources.

Note that for libraries which only export a single relevant target the alias
declaration should go in `//third_party:BUILD`. 

## Adding a New Dependency
To add a new dependency first create a new folder within this directory and
write a `setup.bzl` bazel file that does the required setup. You can use any
of the other depedencies for this although `immer` is a good example of a
simple one that isn't using a preexisting bazel build module. Any other files
that are needed to set up the repo can also be put into the new folder.

If the new dependency only has a few targets that are used by caffeine then
they should have aliases declared either within the `//third_party:BUILD` or
`//third_party/<newfolder>:BUILD`. Prefer using `//third_party:BUILD` if there
is only one and putting them in the new `BUILD` folder otherwise. If the
library has many different targets that we can expect to be used (similar to,
e.g., boost or LLVM) then it is not necessary to make any aliases and we'll
use them by directly referring to the external repo (e.g. `@boost//:thread`).

If the dependency does not already have bazel support then it will be
necessary to write a bazel build file for it. There are lots of resources
online on doing this so that will not be covered here. Prefer building from
source instead of downloading prebuilt binaries since that ensure that it
will work on other people's systems.
