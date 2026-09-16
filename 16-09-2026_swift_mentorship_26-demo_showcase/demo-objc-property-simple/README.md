# objc property — simple problem demo

Minimalny odpowiednik `../demo-swift-property-wrapper` po stronie Objective-C.
Ta sama historia, ten sam kształt, ta sama nazwa: property `x` jest w
rzeczywistości backowane przez pole `_x`, i debugger tego dziś nie wie —
dokładnie jak w Swiftowym demo.

## Kod (`main.m`)

```objc
@interface Foo : NSObject
@property (nonatomic) NSInteger x;
@end

@implementation Foo {
    NSInteger _x;
}
@synthesize x = _x;
@end
```

## Build

```
clang -g -O0 -fobjc-arc -framework Foundation -o demo main.m
```

## Demo (breakpoint na `main.m:17`, linia z `NSLog`)

```
lldb ./demo
(lldb) settings set dwim-print-verbosity full
(lldb) b main.m:17
(lldb) run
```

1. `frame variable *f` → `_x = 42`, nie `x`. (uwaga: w ObjC trzeba
   dereferencjonować `*f` — wskaźnik sam w sobie nie rozwija pól, inaczej niż
   przy Swiftowej klasie)
2. `frame variable f.x` → `error: member reference type 'Foo *' is a pointer;
   did you mean to use '->'?` — szybka ścieżka nie umie dojść do `x`.
3. `p f.x` → `note: ran \`expression -- f.x\`` → `(NSInteger) 42` — działa,
   ale przez pełny JIT (`p` to `dwim-print --`, nie `expression` wprost).
4. `frame variable f->_x` → `(NSInteger) f->_x = 42` — natychmiast,
   bez kompilacji. To jest właśnie ten szybki odczyt, którego dziś `x` nie ma.

Zweryfikowane end-to-end 2026-09-16.
