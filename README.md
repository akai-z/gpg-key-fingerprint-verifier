# GnuPG Key Fingerprint Verifier

## Requirements

* GnuPG (Version 2 or higher.)

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
  --gpgkey-file=<gpgkey-file> \
  --gpgkey-fingerprint=<gpgkey-fingerprint> \
  --gpg-subkey-fingerprint=<gpg-subkey-fingerprint>
```

* `--gpgkey-file`: GPG key file path.

* `--gpgkey-fingerprint`: GPG key fingerprint.

* `--gpg-subkey-fingerprint`: GPG subkey fingerprint.

## Authors

* [Ammar K.](https://github.com/akai-z)

## License

[GNU General Public License version 2](LICENSE)
