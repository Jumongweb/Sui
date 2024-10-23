module 0x42::Demo {
    use std::vector;
    

    fun solve_two_sum(numbers: vector<u8>, target: u8) :vector<u8> {
        let counter:u64 = 0;
    
        let result = vector::empty<u8>();
        while(counter < 5){
            let index:u64 = 1;
            while(index < 5){
                let first: &u8 = vector::borrow(&numbers, counter);
                let second: &u8= vector::borrow(&numbers, index);
                
                if(*first + *second == target){
                    vector::push_back(&mut result, *first);
                    vector::push_back(&mut result, *second);
                        break
                };
                index = index + 1;
            };
            if(vector::length(&result) == 2){
                break
            };
            counter = counter +1;

        };
        result
    }

#[test]
    fun test_solve_two_sum(){
        let numbers = vector<u8>[3, 8,5,1,6];
        let target: u8 = 6;

        let result = solve_two_sum(numbers, target);
        let expected = vector<u8>[5, 1];

        assert!(result == expected, 0);
    }
} 