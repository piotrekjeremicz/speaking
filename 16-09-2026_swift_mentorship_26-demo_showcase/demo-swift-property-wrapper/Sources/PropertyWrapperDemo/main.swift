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
