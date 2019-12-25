# GnuPG Key Fingerprint Verifier

GnuPG Key Fingerprint Verifier is a shell tool that allows to verify GPG keys before importing/adding them.

Beside verifying GPG keys with their fingerprints, the tool will also check whether GPG keys import files  
contain any malicious keys that are embedded with the actual keys.  
(Where the number of maximum allowed public keys in an import file is `1`.)

This could be useful for automation purposes (Like in Docker for example),  
where GPG keys fingerprints cannot be manually verified.

Piping GPG keys using curl to commands such as `apt-key` is bad.  
More details about that could be found [here](https://www.tablix.org/~avian/blog/archives/2017/08/on_piping_curl_to_apt_key/).

## Requirements

* GnuPG (Legacy versions are supported.)

## Installation

Download using `curl`:
```
curl -fL -O https://raw.githubusercontent.com/akai-z/gpg-key-fingerprint-verifier/master/gpg-key-fingerprint-verifier
```

Or by using `wget`:
```
wget https://raw.githubusercontent.com/akai-z/gpg-key-fingerprint-verifier/master/gpg-key-fingerprint-verifier
```

Optionally, you could verify file integrity before using it. (Recommended)  
Check [file integrity verification](#file-integrity-verification) section for more details.

Make the tool executable:
```
chmod +x gpg-key-fingerprint-verifier
```

Make the tool globally accessible:
```
sudo mv gpg-key-fingerprint-verifier /usr/local/bin/
```

## File Integrity Verification

To verify file (gpg-key-fingerprint-verifier) integrity, you will need a tool that can calculate `SHA-3-512` hash.

Here are some tools that provide that:  
* OpenSSL:
```
openssl dgst -sha3-512 gpg-key-fingerprint-verifier
```

* [RHash](https://github.com/rhash/RHash):
```
rhash --sha3-512 gpg-key-fingerprint-verifier
```

* [sha3sum](https://github.com/maandree/sha3sum):
```
sha3-512sum -l gpg-key-fingerprint-verifier
```

Once the hash of the current state of the file is calculated,  
you have to compare it with the hash provided by this repository ([gpg-key-fingerprint-verifier.sha3-512](https://raw.githubusercontent.com/akai-z/gpg-key-fingerprint-verifier/master/gpg-key-fingerprint-verifier.sha3-512)).

## Usage

```
gpg-key-fingerprint-verifier \
  --gpg-key-import-file=<gpg-key-import-file> \
  --gpg-public-key-fingerprint=<gpg-public-key-fingerprint> \
  --gpg-subkey-fingerprint=<gpg-subkey-fingerprint> \
  [--print-gpg-key-list] \
  [-q | --quiet]
```

* `--gpg-key-import-file`: GPG key import file path.

* `--gpg-public-key-fingerprint`: A 40 characters, with no spaces, GPG public key fingerprint.  
  (This will be ignored if `--print-gpg-key-list` is used.)

* `--gpg-subkey-fingerprint`: A 40 characters, with no spaces, GPG subkey fingerprint.  
  This should be the default subkey (with record type [`sub`](https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=blob_plain;f=doc/DETAILS)) in the GPG key listing.  (But other subkeys could be used.)  
  Verifying GPG subkey fingerprint is optional, but recommended.  
  (This will be ignored if `--print-gpg-key-list` is used.)

* `--print-gpg-key-list`: Prints machine-parseable GPG key listing of the provided GPG key import file. (Optional)  
More details about the format of the machine-parseable GPG key listing could be found [here](https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=blob_plain;f=doc/DETAILS).

* `-q, --quiet`: Suppresses verification success message. (Optional)

### Example

This example shows how the verification tool could be used with `apt-key add` command:
```
curl -fL -o <gpg-key-import-file> <gpg-key-import-file-url> && \

gpg-key-fingerprint-verifier -q \
  --gpg-key-import-file=<gpg-key-import-file> \
  --gpg-public-key-fingerprint=<gpg-public-key-fingerprint> \
  --gpg-subkey-fingerprint=<gpg-subkey-fingerprint> \

&& apt-key add <gpg-key-import-file>
```

The AND operator (`&&`) could be omitted, if the [Set Builtin](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html) is used with the exit on error option (`set -e`).

## Authors

* [Akai](https://github.com/akai-z)

## License

[GNU General Public License version 2](LICENSE)
