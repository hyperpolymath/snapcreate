; SPDX-License-Identifier: MPL-2.0
;; guix.scm — GNU Guix package definition for snapcreate
;; Usage: guix shell -f guix.scm

(use-modules (guix packages)
             (guix build-system gnu)
             (guix licenses))

(package
  (name "snapcreate")
  (version "0.1.0")
  (source #f)
  (build-system gnu-build-system)
  (synopsis "snapcreate")
  (description "snapcreate — part of the hyperpolymath ecosystem.")
  (home-page "https://github.com/hyperpolymath/snapcreate")
  (license mpl2.0))
