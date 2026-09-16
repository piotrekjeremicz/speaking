# property wrapper + LLDB `p` — jak to teraz działa

Przykład od Augusto (patrz `swift-mentorship-program/week-2.md` w checkoucie `swift`),
pokazujący problem, który ma rozwiązać zadanie z `DW_TAG_property` (DWARF 6).

## Kod (`Sources/PropertyWrapperDemo/main.swift`)

```swift
@propertyWrapper
struct Wrapper<Value> {
    private var value: Value

    var wrappedValue: Value {
        get { value }
        set { value = newValue }
    }

    init(wrappedValue: Value) {
        self.value = wrappedValue
    }
}

class Foo {
    @Wrapper var x: Int = 42
}

let f = Foo()
print(f.x) // <- breakpoint here
```

Kompilator podmienia `x` na getter/setter, a prawdziwe storage ląduje pod `_x`
(typu `Wrapper<Int>`). W runtime `x` w ogóle nie istnieje jako zmienna pamięciowa —
istnieje tylko `_x`.

## Struktura

To jest pakiet SwiftPM (`Package.swift`, executable target `PropertyWrapperDemo`),
kod jest w `Sources/PropertyWrapperDemo/main.swift`. Otwiera się bezpośrednio
w Xcode (`open Package.swift`).

## Build z linii poleceń

```
swift build
swift run
```

## Debug w Xcode

1. Postaw breakpoint na linii `print(f.x)`.
2. Uruchom (Cmd+R) — zatrzyma się na breakpoincie.
3. W panelu **Variables** po lewej zobaczysz `f` z polem `_x`, nie `x` — to ten sam
   efekt co `frame variable f` w terminalu.
4. W konsoli debuggera (na dole) wpisz `po f.x` (odpowiednik `p`/`expression` z LLDB) —
   zadziała, bo to pełny JIT-owany `expression`.
5. Możesz też ręcznie wpisać `frame variable f.x` w konsoli debuggera Xcode — powinno
   dać ten sam błąd co w terminalowym LLDB.

## Demo w LLDB

Breakpoint na linii z `print(f.x)`:

```
(lldb) frame variable f
(demo.Foo) f = 0x00000001005f12b0 {
  _x = (value = 42)
}
```

Widać, że jedyne co naprawdę jest w pamięci to `_x`.

### `frame variable f.x` — pada

```
(lldb) frame variable f.x
error: <user expression 0>:1:3: "x" is not a member of "(demo.Foo) f"
   1 | f.x
     | ^
```

`frame variable` czyta DWARF bezpośrednio i nie wie nic o `x` — nie ma go w debug info,
bo to nie jest realne pole.

### `frame variable f._x` — działa (bo `_x` naprawdę istnieje)

```
(lldb) frame variable f._x
(demo.Wrapper<Int>) f._x = (value = 42)
```

### `p f.x` — działa, ale przez pełny `expression`

```
(lldb) p f.x
(Int) 42
```

`p` to alias `expression --`. Widać to wprost:

```
(lldb) expression -- f.x
(Int) $R0 = 42
```

`p`/`expression` odpalają mini-kompilator Swifta (JIT), który wie, że `x` to
computed property, i umie wygenerować kod wywołujący getter. To działa, ale jest
znacznie kosztowniejsze niż zwykły odczyt pamięci, którego używa `frame variable`.

## O co chodzi w zadaniu

Cel: dodać do DWARF nowy tag `DW_TAG_property` (+ `DW_TAG_property_getter`,
`DW_AT_property_forward`), żeby zakodować w debug info, że `x` odpowiada realnemu
polu `_x`. Wtedy LLDB mogłoby przy `frame variable f.x` (albo nawet `p f.x`) zrobić
de facto szybki odczyt `f._x` zamiast odpalać cały JIT-owany `expression`.
