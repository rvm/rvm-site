# Security

RVM `1.26.0` signs and verifies all releases and the `rvm-installer`
script. In most cases it's all automated and the installer will check
if the downloaded releases signature matches the public key imported by
user. But there is the first step that would need to be done manually -
verifying the `rvm-installer` was signed by the given key:

    # Install mpapis public key (might need `gpg2` and or `sudo`)
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

    # Download the installer
    \curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer
    \curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer.asc

    # Verify the installer signature (might need `gpg2`), and if it validates...
    gpg --verify rvm-installer.asc &&

    # Run the installer
    bash rvm-installer stable

In rare cases the `gpg --keyserver` is failing, use this instead:

    curl -sSL https://rvm.io/mpapis.asc | gpg --import -

Identity of [mpapis](/authors/mpapis/) can be confirmed with
[mpapis public key on keybase.io](https://keybase.io/mpapis).
