module 0x42::Demo{
    use std::debug;

    struct Person has drop{
        name: vector<u8>,
        age:u64
    }

    fun sayHello(){
        let person = Person {
            name: b"John",
            age: 30
        };
        debug::print(&person);
    }

    #[test]
    fun test_say_hello(){
        sayHello();
    }

}