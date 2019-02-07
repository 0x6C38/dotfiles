# Haskell
On arch, install `ghc` and `stack`:

    sudo pacman -S stack ghc

Installing `ghc` also installs `ghci`.

## Haskell IDE Engine
There is an AUR package called `haskell-ide-engine-git` that can be installed and although it works fine, it's hard to get it to work with the vs code extension. For that reason its better to download it from source:

    git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules
    cd haskell-ide-engine

And then install the correct version (as well as hoogle) via:

    make hie-8.6.3
    make build-doc-8.6.3

The make script installs `hie` and `hie-wrapper` in `~/.local/bin/hie` and `~/.local/bin/hie-wrapper` respectively. These directories may not be in your `$PATH` so hie clients may have trouble starting it up.

The `ghc` version used in each project must be the same as the one used by `hie`. This can be bypassed using the `hie wrapper` but it is easier to simply create projects that target the same runtime as `hie`, for example:

    stack new --resolver=lts-12.13 sample-project

*Note: The lts-12.13 haskell version uses ghc 8.36*

## Visual Studio Code Support
The following extension provides support `hie`:

    code --install-extension alanz.vscode-hie-server

As explained above `hie` may not be in your path so in that case you must configure the `hie` path for the extension.

## Sources
- https://www.vacationlabs.com/haskell/environment-setup.html