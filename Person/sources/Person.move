module 0x42::PersonModule {

    use std::vector;

    struct Friends has store, key, drop{
        people: vector<Person>
    }

    struct Person has store, key, drop, copy{
        name: vector<u8>,
        age: u8
    }

    public fun create_friend(myFriend: Person, friends: &mut Friends): Person {
        let newFriend = Person {
            name: myFriend.name,
            age: myFriend.age
        };

        add_friend(newFriend, friends);
        newFriend
    }   

    public fun add_friend(_person: Person, friends: &mut Friends){
        vector::push_back(&mut friends.people, _person)
    }

    // public fun set_age(new_age: u8) : u8{
    //     let person = Person { age: new_age };
    //     person.age
    // }

    // #[test]
    // fun test_set_age(){
    //     let age = set_age(10);
    //     debug::print(&age);
    // }

    #[test]
    fun test_create_friend(){
        let prince = Person {
            name: b"Prince",
            age: 31,
        };

        let friends = Friends {
            people : (vector[prince])
        };

        let createdFriend = create_friend(prince, &mut friends);
        assert!(createdFriend.name == b"Prince", 0)
    }


}