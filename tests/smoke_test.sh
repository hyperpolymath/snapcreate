#!/usr/bin/env bash
# SPDX-License-Identifier: PMPL-1.0-or-later
# Copyright (c) 2026 Jonathan D.A. Jewell (hyperpolymath) <j.d.a.jewell@open.ac.uk>
# smoke_test.sh — Smoke and structural tests for snapcreate.

set -euo pipefail
PASS=0; FAIL=0; BASE=/var/mnt/eclipse/repos/snapcreate

assert() {
  if [[ "$2" == "0" ]]; then echo "PASS: $1"; PASS=$((PASS+1))
  else echo "FAIL: $1"; FAIL=$((FAIL+1)); fi
}

echo "=== Smoke: RSR Required Files ==="
for f in LICENSE README.adoc CONTRIBUTING.md CODE_OF_CONDUCT.md SECURITY.md; do
  assert "RSR file $f exists" "$([ -f "$BASE/$f" ] && echo 0 || echo 1)"
done

echo ""
echo "=== Smoke: Build System Files ==="
for f in Justfile guix.scm flake.nix; do
  assert "Build file $f exists" "$([ -f "$BASE/$f" ] && echo 0 || echo 1)"
done

echo ""
echo "=== Smoke: AI Manifest ==="
assert "0-AI-MANIFEST.a2ml exists" "$([ -f "$BASE/0-AI-MANIFEST.a2ml" ] && echo 0 || echo 1)"

echo ""
echo "=== Smoke: Contractile System ==="
assert "contractiles/ directory exists" "$([ -d "$BASE/contractiles" ] && echo 0 || echo 1)"
assert "contractile.just exists" "$([ -f "$BASE/contractile.just" ] && echo 0 || echo 1)"

echo ""
echo "=== Results: $PASS passed, $FAIL failed ==="
[ "$FAIL" -eq 0 ] && exit 0 || exit 1
