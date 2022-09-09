// ** SOQL query should be moved outside of the for loop.

// ** The function accsrt takes in a parameter. I see no use for it here. 

// ** is processed a custom field? if so, __c will need to be appended. 

// Not minor variable name adjustments. 

public class AccSrt {

    public static List<Account> accsrt(List<ID> la){
        Account acc = [SELECT Name from Account WHERE processed__c = false]; 
        List<sObject> retAccs = new List<Account>();

       for(Account a : acc) {
            if(a.RecordTypeId = '00N580000097LSc') {
                retAccs.put(a)
           } 
       }

    return retAccs;
   }
}