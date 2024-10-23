module 0x42::SubCompany {
    friend 0x42::Company;

    public(friend) fun get_company_name(): vector<u8>{
        return b"Sub Company"
    }

}