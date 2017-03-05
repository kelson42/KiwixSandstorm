This is a work in progress (ALPHA) package of [Kiwix](http://www.kiwix.org) for Sandstorm. Since `kiwix-serve` is currently difficult to build from source, and it is expected to be easier sort of soon, this is going ahead by just downloading binaries from Kiwix's website. This should not be considered to be complete until it builds everything from source, or grabs everything from Debian packages (which may also be a possibilitey at some point). Until then, this is an item in `TODO.md`, and it will not leave BETA, or maybe even ALPHA, until it's fixed.

Relatedly, I acknowledge that the build process is currently not secure. Firstly, it downloads the binary of Kiwix over http, because even if you put "https" it just redirects to an http mirror anyway. (I fear far more sites do this than we like to think). So I don't bother. I do check sha256sum, but it's based on a binary I downloaded myself from a couple different wifi hotspots to have a little assurance that it's the same file. But please, take care until I figure this out.

See `TODO.md` file to get an idea of the current status of this packaging project.

# Dependencies

kiwix
xapian
...
