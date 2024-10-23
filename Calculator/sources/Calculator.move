module 0x44:: calculator{
    use std::debug;
    struct Calculator has drop{
      
        result: u64
    }
    fun add_numbers(calculator: &mut Calculator, first_number: u64, second_number: u64){
        let sum: u64 = first_number + second_number;
        calculator.result = sum;
    }
    
    #[test]
    fun test_add_numbers(){
        let calculator = Calculator{
            result: 0u64,
        };
        add_numbers(&mut calculator, 2u64, 5u64);
        let expected = 7;
        debug:: print(&calculator.result);
        assert!(calculator.result==expected, 0)
    }
}