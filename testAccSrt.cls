// ** Test class has been updated. Notice data creation in the makedata function which is TestSetup annotated. 

// ** Assertions made. 

@isTest
private class TestAccSrt{
    
    @TestSetup
    static void makedata() {
        Account a1 = new Account();
        Account a2 = new Account();
        List<Account> la = new List<Account>();
        a1.name = 'test account 1';
        a1.RecordTypeId = 'XA00000XA-Customer';
        a1.processed = false;

        a2.name = 'test account 2';
        a2.RecordTypeId = 'XP9999XP-NonCustomer';
        a1.processed = false;
        la.add(a1);
        la.add(a2);

        insert la;
    }

    @IsTest
    private static void testAccsrt() {
        Test.startTest();
        List<Account> allAcounts = [SELECT name from Account where processed = false]; 
        List<Account> accWithType = new AccSrt().accsrt(allAcounts);
        Test.stopTest();

        System.assertNOTEquals(accWithType[0].RecordTypeId, null, 'Record Type Id should not be null');

        System.assertNotEquals(accWithType[0].name, null, 'Account name should not be null');

        System.asserEquals(accWithType[0].processed, false);
    }
}
