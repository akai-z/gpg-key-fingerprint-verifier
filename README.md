# GnuPG Key Fingerprint Verifier

## Requirements

* GnuPG (Version 2 or higher.)

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
  --gpg-key-file=<gpg-key-file> \
  --gpg-key-fingerprint=<gpg-key-fingerprint> \
  --gpg-subkey-fingerprint=<gpg-subkey-fingerprint> \
  [--print-gpg-key-list=<print-gpg-key>] \
  [-q|--quiet]
```

* `--gpg-key-file`: GPG key import file path.

* `--gpg-key-fingerprint`: A 40 characters, with no spaces, GPG key fingerprint.  
  (Not used/required if `--print-gpg-key-list` is used.)

* `--gpg-subkey-fingerprint`: A 40 characters, with no spaces, GPG subkey fingerprint.  
  (Not used/required if `--print-gpg-key-list` is used.)

* `--print-gpg-key-list`: Prints machine-parseable GPG key listing of the provided GPG key import file. (Optional)

* `-q, --quiet`: Suppresses verification success message. (Optional)

## Authors

* [Ammar K.](https://github.com/akai-z)

## License

[GNU General Public License version 2](LICENSE)
