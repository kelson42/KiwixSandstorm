@0x938a4b7c91ffc67d;

using Spk = import "/sandstorm/package.capnp";
# This imports:
#   $SANDSTORM_HOME/latest/usr/include/sandstorm/package.capnp
# Check out that file to see the full, documented package definition format.

const pkgdef :Spk.PackageDefinition = (
  # The package definition. Note that the spk tool looks specifically for the
  # "pkgdef" constant.

  id = "5uh349d0kky2zp5whrh2znahn27gwha876xze3864n0fu9e5220h",
  # Your app ID is actually its public key. The private key was placed in
  # your keyring. All updates must be signed with the same key.

  manifest = (
    # This manifest is included in your app package to tell Sandstorm
    # about your app.

    appTitle = (defaultText = "Kiwix"),

    appVersion = 14,  # Increment this for every release.

    appMarketingVersion = (defaultText = "0.1.0"),
    # Human-readable representation of appVersion. Should match the way you
    # identify versions of your app in documentation and marketing.

    actions = [
      # Define your "new document" handlers here.
      ( title = (defaultText = "New free content mirror"),
        nounPhrase = (defaultText = "free content mirror"),
        command = .myCommand
        # The command to run when starting for the first time. (".myCommand"
        # is just a constant defined at the bottom of the file.)
      )
    ],

    continueCommand = .myCommand,
    # This is the command called to start your app back up after it has been
    # shut down for inactivity. Here we're using the same command as for
    # starting a new instance, but you could use different commands for each
    # case.

    metadata = (
      # Data which is not needed specifically to execute the app, but is useful
      # for purposes like marketing and display.  These fields are documented at
      # https://docs.sandstorm.io/en/latest/developing/publishing-apps/#add-required-metadata
      # and (in deeper detail) in the sandstorm source code, in the Metadata section of
      # https://github.com/sandstorm-io/sandstorm/blob/master/src/sandstorm/package.capnp
      icons = (
        # Various icons to represent the app in various contexts.
        # Images are GPL-3.0, derived from:
        # https://raw.githubusercontent.com/kiwix/kiwix/master/kiwix/chrome/icons/default/main.png
        appGrid = (png = (dpi1x = embed "kiwix-icons/appgrid-128x128.png")),
        grain = (png = (dpi1x = embed "kiwix-icons/grain-24x24.png",
                        dpi2x = embed "kiwix-icons/grain-48x48.png")),
        market = (png = (dpi1x = embed "kiwix-icons/market-150x150.png")),
        marketBig = (png = (dpi1x = embed "kiwix-icons/market-big-300x300.png")),
      ),

      website = "http://kiwix.org/",
      # This should be the app's main website url.

      codeUrl = "https://github.com/orblivion/KiwixSandstorm",
      # URL of the app's source code repository, e.g. a GitHub URL.
      # Required if you specify a license requiring redistributing code, but optional otherwise.

      license = (openSource = gpl3),
      # The license this package is distributed under.  See
      # https://docs.sandstorm.io/en/latest/developing/publishing-apps/#license

      categories = [media],
      # A list of categories/genres to which this app belongs, sorted with best fit first.
      # See the list of categories at
      # https://docs.sandstorm.io/en/latest/developing/publishing-apps/#categories

      author = (
        # Fields relating to the author of this app.

        contactEmail = "dan@danielkrol.com",
        # Email address to contact for any issues with this app. This includes end-user support
        # requests as well as app store administrator requests, so it is very important that this be a
        # valid address with someone paying attention to it.

        pgpSignature = embed "pgp-signature",
        # PGP signature attesting responsibility for the app ID. This is a binary-format detached
        # signature of the following ASCII message (not including the quotes, no newlines, and
        # replacing <app-id> with the standard base-32 text format of the app's ID):
        #
        # "I am the author of the Sandstorm.io app with the following ID: <app-id>"
        #
        # You can create a signature file using `gpg` like so:
        #
        #     echo -n "I am the author of the Sandstorm.io app with the following ID: <app-id>" | gpg --sign > pgp-signature
        #
        # Further details including how to set up GPG and how to use keybase.io can be found
        # at https://docs.sandstorm.io/en/latest/developing/publishing-apps/#verify-your-identity

        upstreamAuthor = "Kiwix (www.kiwix.org)",
        # Name of the original primary author of this app, if it is different from the person who
        # produced the Sandstorm package. Setting this implies that the author connected to the PGP
        # signature only "packaged" the app for Sandstorm, rather than developing the app.
        # Remove this line if you consider yourself as the author of the app.
      ),

      pgpKeyring = embed "pgp-keyring",
      # A keyring in GPG keyring format containing all public keys needed to verify PGP signatures in
      # this manifest (as of this writing, there is only one: `author.pgpSignature`).
      #
      # To generate a keyring containing just your public key, do:
      #
      #     gpg --export <key-id> > keyring
      #
      # Where `<key-id>` is a PGP key ID or email address associated with the key.

      description = (defaultText = embed "description.md"),
      # The app's description in Github-flavored Markdown format, to be displayed e.g.
      # in an app store. Note that the Markdown is not permitted to contain HTML nor image tags (but
      # you can include a list of screenshots separately).

      shortDescription = (defaultText = "Local Wikipedia & more"),
      # A very short (one-to-three words) description of what the app does. For example,
      # "Document editor", or "Notetaking", or "Email client". This will be displayed under the app
      # title in the grid view in the app market.

      screenshots = [
        # Screenshots to use for marketing purposes.  Examples below.
        # Sizes are given in device-independent pixels, so if you took these
        # screenshots on a Retina-style high DPI screen, divide each dimension by two.

        #(width = 746, height = 795, jpeg = embed "path/to/screenshot-1.jpeg"),
        #(width = 640, height = 480, png = embed "path/to/screenshot-2.png"),

        (width = 1024, height = 696, png = embed "screenshots/wikipedia.png"),
        (width = 1024, height = 696, png = embed "screenshots/ted.png"),
        (width = 1024, height = 696, png = embed "screenshots/stackexchange.png"),
        (width = 1024, height = 696, png = embed "screenshots/gutenberg.png"),
      ],
      #changeLog = (defaultText = embed "path/to/sandstorm-specific/changelog.md"),
      # Documents the history of changes in Github-flavored markdown format (with the same restrictions
      # as govern `description`). We recommend formatting this with an H1 heading for each version
      # followed by a bullet list of changes.
    ),
  ),

  sourceMap = (
    # Here we defined where to look for files to copy into your package. The
    # `spk dev` command actually figures out what files your app needs
    # automatically by running it on a FUSE filesystem. So, the mappings
    # here are only to tell it where to find files that the app wants.
    searchPath = [
      ( sourcePath = "." ),  # Search this directory first.
      ( sourcePath = "/",    # Then search the system root directory.
        hidePaths = [ "home", "proc", "sys",
                      "etc/passwd", "etc/hosts", "etc/host.conf",
                      "etc/nsswitch.conf", "etc/resolv.conf" ]
        # You probably don't want the app pulling files from these places,
        # so we hide them. Note that /dev, /var, and /tmp are implicitly
        # hidden because Sandstorm itself provides them.
      )
    ]
  ),

  fileList = "sandstorm-files.list",
  # `spk dev` will write a list of all the files your app uses to this file.
  # You should review it later, before shipping your app.

  alwaysInclude = ["usr/lib/python3", "usr/lib/python3.5",],
  # Fill this list with more names of files or directories that should be
  # included in your package, even if not listed in sandstorm-files.list.
  # Use this to force-include stuff that you know you need but which may
  # not have been detected as a dependency during `spk dev`. If you list
  # a directory here, its entire contents will be included recursively.

  bridgeConfig = (
    # Used for integrating permissions and roles into the Sandstorm shell
    # and for sandstorm-http-bridge to pass to your app.
    # Uncomment this block and adjust the permissions and roles to make
    # sense for your app.
    # For more information, see high-level documentation at
    # https://docs.sandstorm.io/en/latest/developing/auth/
    # and advanced details in the "BridgeConfig" section of
    # https://github.com/sandstorm-io/sandstorm/blob/master/src/sandstorm/package.capnp
    viewInfo = (
      # For details on the viewInfo field, consult "ViewInfo" in
      # https://github.com/sandstorm-io/sandstorm/blob/master/src/sandstorm/grain.capnp

      permissions = [
      # Permissions which a user may or may not possess.  A user's current
      # permissions are passed to the app as a comma-separated list of `name`
      # fields in the X-Sandstorm-Permissions header with each request.
      #
      # IMPORTANT: only ever append to this list!  Reordering or removing fields
      # will change behavior and permissions for existing grains!  To deprecate a
      # permission, or for more information, see "PermissionDef" in
      # https://github.com/sandstorm-io/sandstorm/blob/master/src/sandstorm/grain.capnp
        (
          name = "uploader",
          title = (defaultText = "uploader"),
          description = (defaultText = "grants ability to upload content file"),
        ),
      ],
      roles = [
        (
          title = (defaultText = "uploader"),
          permissions  = [true], # (a bool for each permission, in the same order)
          verbPhrase = (defaultText = "can upload content file"),
          description = (defaultText = "uploaders may upload to be viewed."),
        ),
        (
          title = (defaultText = "viewer"),
          permissions  = [false],
          verbPhrase = (defaultText = "can view the content"),
          description = (defaultText = "viewers may view content."),
        ),
      ],
    ),
    #apiPath = "/api",
    # Apps can export an API to the world.  The API is to be used primarily by Javascript
    # code and native apps, so it can't serve out regular HTML to browsers.  If a request
    # comes in to your app's API, sandstorm-http-bridge will prefix the request's path with
    # this string, if specified.
  ),
);

const myCommand :Spk.Manifest.Command = (
  # Here we define the command used to start up your server.
  argv = ["/sandstorm-http-bridge", "8000", "--", "/launcher.sh"],
  environ = [
    # Note that this defines the *entire* environment seen by your app.
    (key = "PATH", value = "/usr/local/bin:/usr/bin:/bin"),
    (key = "SANDSTORM", value = "1"),
    (key = "PYTHONHOME", value = "/usr:/usr/local"),
    # Export SANDSTORM=1 into the environment, so that apps running within Sandstorm
    # can detect if $SANDSTORM="1" at runtime, switching UI and/or backend to use
    # the app's Sandstorm-specific integration code.
  ]
);
