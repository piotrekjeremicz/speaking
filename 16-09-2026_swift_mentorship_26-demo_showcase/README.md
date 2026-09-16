# There and Back Again

**Event:** Swift Mentorship Program — Final Showcase
**Date:** 2026-09-16

Closing showcase for a 10-week Swift Mentorship Program cycle, mentored by
Augusto. The talk follows one feature end to end: teaching LLDB to read a
new DWARF v6 tag (`DW_TAG_property`) so the debugger can resolve a property
like `x` straight to its real backing storage (`_x`), instead of falling
back to a full JIT-compiled expression every time. Covers the whole
pipeline — Clang emitting it, LLVM carrying it through DWARF, LLDB reading
it back — landing two merged upstream `llvm/llvm-project` PRs along the way.

## What's here

- [`slides/`](slides) — the deck itself (`there-and-back-again.html`), a
  self-contained, keyboard-navigable single-file presentation. Open it
  directly in a browser; press `N` to toggle presenter notes.
- [`demo-swift-property-wrapper/`](demo-swift-property-wrapper) — "the
  problem," illustrated in Swift with a `@propertyWrapper`. Shows why
  `frame variable f.x` fails today and what `p f.x` actually costs.
- [`demo-objc-property-simple/`](demo-objc-property-simple) — "the
  solution," the same shape in Objective-C, built and debugged with the
  patched toolchain — `p f.x` takes the fast path instead of falling back
  to a full expression evaluation.
