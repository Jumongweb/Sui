module 0x43::Company{
    //use std::vector;

    struct Company has copy, drop{
        name: vector<u8>,
        company_address:vector<u8>,
        is_registered: bool
    }
    public fun get_company_details(company: Company):(vector<u8>, vector<u8>, bool){
        (company.name, company.company_address, company.is_registered)

    }
    #[test]
    fun test_get_company_details(){
        let company: Company = Company{
            name: b"semicolon africa",
            company_address: b"312, herbert macaulay way, sabo yaba",
            is_registered: true,
        };
        let (name, company_address, registration_status) = get_company_details(company);
        assert!(name == b"semicolon africa", 1);
        assert!(company_address == b"312, herbert macaulay way, sabo yaba", 1);
        assert!(registration_status == true, 1)
    }
}