// ** The provided code does not fit with the description outlined. Why is there a query in a loop if the function is supposed to be passed in a list of accounts as parameter. 


// ** In any case, SOQL query should be moved outside of the for loop.


public class AccSrt {

    public static List<Account> accsrt(List<Account> la){
       
        List<sObject> retAccs = new List<Account>();

        for(Account a : la) {
            if(a.RecordTypeId = '00N580000097LSc') {
                retAccs.put(a)
           } 
        }

    return retAccs;
   }
}