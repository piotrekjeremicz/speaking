# SwiftUI Data Flow

**Event:** Swift Surat
**Date:** 2026-07-11

A sample Xcode project built for a talk on SwiftUI's data flow mechanisms — how values move between views, and specifically *when* a view actually re-renders versus when SwiftUI skips it.

A small `DesignSystem` package provides a reusable "glow" indicator (a rounded rect whose border flashes a random color on every real `body` re-evaluation), used throughout the sample app to make re-renders visible on screen. Each screen in `SampleApp` demonstrates one mechanism in isolation:

1. **Init** — passing a plain, constant value through a regular `init`.
2. **State + Init** — owning `@State` locally vs. letting it force unrelated ancestors to re-render.
3. **State + Binding** — sharing mutable state between views.
4. **Closure Trap** — why storing a closure (instead of a materialized value) defeats SwiftUI's ability to skip re-renders.
5. **Environment** — passing a value down through the view tree, skipping views that don't read it.
6. **Preference** — bubbling a value up the view tree from a child to an ancestor.
7. **Container Value** — per-child metadata a custom container reads directly from its own children.
