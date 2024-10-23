module 0x42::Company{

    use std::vector;

    const CONTRACT:address = @0x42;

    struct Employees has store, key, drop{
        people: vector<Employee>
    }

    struct Employee has store, key, drop, copy{
        name: vector<u8>,
        age: u8,
        income: u64,
    }

    struct Info has drop{
        company_name: vector<u8>,
        owns: vector<u8>
    }

    public fun get_info(): Info{
        let subCompanyName = 0x42::SubCompany::get_company_name();


        let info = Info {
            company_name: b"Jumongweb",
            owns: subCompanyName
        };
        info
    }

    public fun create_employee(_employee: Employee, _employees: &mut Employees): Employee {
        let newEmployee = Employee {
            name: _employee.name,
            age: _employee.age,
            income: _employee.income
        };

        add_employee(newEmployee, _employees);
        newEmployee
    }

    fun add_employee(_employee: Employee, _employees: &mut Employees){
        vector::push_back(&mut _employees.people, _employee)
    }

    public fun increase_income(employee: &mut Employee, bonus: u64): &mut Employee {
        employee.income = employee.income + bonus;
        employee
    }

    public fun decrease_income(employee: &mut Employee, penalty: u64): &mut Employee {
        employee.income = employee.income - penalty;
        employee
    }

    public fun multiply_income(employee: &mut Employee, factor: u64): &mut Employee {
        employee.income = employee.income * factor;
        employee
    }

    public fun divide_income(employee: &mut Employee, divisor: u64): &mut Employee {
        employee.income = employee.income / divisor;
        employee
    }

    public fun is_employee_age_even(employee: Employee): bool{
        let isEven: bool;
        if (employee.age % 2 == 0){
            isEven = true
        }
        else {
            isEven = false;
        };
        isEven
    }

    #[test]
    fun test_create_employee(){
        let king = Employee {
            name: b"King",
            age: 25,
            income: 10000,
        };

        let employees = Employees {
            people: (vector[king])
        };

        let createEmployee = create_employee(king, &mut employees);
        assert!(createEmployee.name == king.name, 0);

    }

    #[test]
    fun test_increase_employee_income(){
        let king = Employee {
            name: b"King",
            age: 25,
            income: 10000,
        };

        let employees = Employees {
            people: (vector[king])
        };

        let createEmployee = create_employee(king, &mut employees);
        assert!(createEmployee.name == king.name, 0);
        assert!(createEmployee.income == 10000, 0);

        let employeeWithIncrease = increase_income(&mut king, 2000);
        assert!(employeeWithIncrease.income == 12000, 0);
    }

    #[test]
    fun test_decrease_employee_income(){
        let king = Employee {
            name: b"King",
            age: 25,
            income: 10000,
        };

        let employees = Employees {
            people: (vector[king])
        };

        let createEmployee = create_employee(king, &mut employees);
        assert!(createEmployee.name == king.name, 0);
        assert!(createEmployee.income == 10000, 0);

        let employeeWithDecrease = decrease_income(&mut king, 2000);
        assert!(employeeWithDecrease.income == 8000, 0);
    }

    #[test]
    fun test_multiply_income(){
        let general = Employee {
            name: b"General",
            age: 25,
            income: 5000
        };

        let generals = Employees {
            people: (vector[general]),
        };

        let createdGeneral = create_employee(general, &mut generals);
        assert!(createdGeneral.name == general.name, 0);
        assert!(createdGeneral.income == 5000, 0);

        let multipliedIncomeGeneral = multiply_income(&mut createdGeneral, 2);
        assert!(multipliedIncomeGeneral.income == 10000, 0);

    }

    #[test]
    fun test_divide_income(){
        let general = Employee {
            name: b"General",
            age: 25,
            income: 5000
        };

        let generals = Employees {
            people: (vector[general]),
        };

        let createdGeneral = create_employee(general, &mut generals);
        assert!(createdGeneral.name == general.name, 0);
        assert!(createdGeneral.income == 5000, 0);

        let dividedIncomeGeneral = divide_income(&mut createdGeneral, 2);
        assert!(dividedIncomeGeneral.income == 2500, 0);

    }

    #[test]
    fun test_is_employee_age_even_with_odd_value(){
        let general = Employee {
            name: b"General",
            age: 25,
            income: 5000
        };

        let generals = Employees {
            people: (vector[general]),
        };

        let createdGeneral = create_employee(general, &mut generals);
        assert!(createdGeneral.name == general.name, 0);
        
        let isEven = is_employee_age_even(createdGeneral);
        assert!(isEven == false, 0);
    }

        #[test]
    fun test_is_employee_age_even_with_even_value(){
        let general = Employee {
            name: b"General",
            age: 20,
            income: 5000
        };

        let generals = Employees {
            people: (vector[general]),
        };

        let createdGeneral = create_employee(general, &mut generals);
        assert!(createdGeneral.name == general.name, 0);
        
        let isEven = is_employee_age_even(createdGeneral);
        assert!(isEven == true, 0);
    }

}