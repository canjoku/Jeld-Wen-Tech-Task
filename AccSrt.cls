// ** SOQL query should be moved outside of the for loop.

Public Static Class AccSrt {
    public List<Account> accsrt(List<ID> la){
	    Account a = [SELECT Name from Account WHERE processed = false]; 
        List<sObject> retAcc = new List<Account>()

       for(Account a : LA){
            if(a.RecordTypeId = '00N580000097LSc') {
                retAcc.put(a)
           } 
       }

    return retAccs;
   }
}