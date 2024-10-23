module 0x44::calculator {
    
    use std::debug;

    struct Calculator has drop {
        result: u64
    }

    public fun add(calculator: &mut Calculator, num1: u64, num2: u64 ) {
        let sum: u64 = num1 + num2;
        calculator.result = sum
    }

    public fun subtract(calculator: &mut Calculator, num1: u64, num2: u64){
        let answer = num1 - num2;
        calculator.result = answer;
    }

    public fun multiply(calculator: &mut Calculator, num1:u64, num2:u64) {
        let answer = num1 * num2;
        calculator.result = answer;
    }

    public fun divide(calculator: &mut Calculator, num1:u64, num2:u64){
        calculator.result = num1 / num2;
    }


    #[test]
    fun test_add(){
        let calculator = Calculator {
            result: 0u64
        };

        add(&mut calculator, 5, 6);
        debug::print(&calculator.result);
        assert!(calculator.result == 11, 0);
    }

    #[test]
    fun test_subtract(){
        let calculator = Calculator{
            result: 0u64
        };

        subtract(&mut calculator, 50, 30);
        debug::print(&calculator.result);
        assert!(calculator.result == 20, 0);
    }

    #[test]
    fun test_multipy(){
        let calculator = Calculator{
            result: 0u64,
        };

        multiply(&mut calculator, 6, 6);
        assert!(calculator.result == 36, 0);
    }

    #[test]
    fun test_divide(){
        let calculator = Calculator{
            result: 0u64,
        };
        divide(&mut calculator, 36, 6);
        assert!(calculator.result == 6, 0);
    }


}