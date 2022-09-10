
// ** An observation here is the multiple condtions in the if blocks. I will extract these into methods. 
// ** Refactor purpose here will focus on readability and it very important to write robust tests. 



public class CaseUtility {

    public static void iteratecases(Case cs) {
        Boolean start = True;
        for(Case c: cs) {
            if (start) {
                this.ukClaim(c);
                this.ukRequestQuote(c);
                this.ukRequestOrder(c);
                this.notDear1InlandDana(c);
                this.notDear1InlandWohnraum(c);
                this.notDear1InlandObjekt(c);
                this.notDear1InlandInlandBaumarkt(c);
                this.equalsDear1InlandStandardFachandel(c);
                this.equalsDear1InlandObjekt(c);
                this.equalsDear1Dana(c);
                this.equalsDear1Kilsgaard(c);
            }
            else {
                else {cs.OwnerId = cs.OwnerId}
            }
            
        }
        
    }

    private static Boolean deConditionalNotDear1(Case cs) {
        return (cs.Country__c =='DE' && cs.Web_Enquiry_Form__c != 'DE-AR-1' && cs.Origin != 'External Sales' && cs.Assigned_To__c == FALSE && cs.Type == 'Claim');
    }

    private static Boolean deConditionalEqualsDear1(Case cs) {
        return (cs.Country__c =='DE' && cs.Web_Enquiry_Form__c == 'DE-AR-1' && cs.Origin != 'External Sales' && cs.Assigned_To__c == FALSE && cs.Type == 'Claim' && cs.ContactId != '' && cs.ContactId != NULL);
    }

    private static void ukClaim(Case cs) {
        if(cs.Country__c=='UK' && cs.Type=='Claim' && cs.Assigned_To__c == FALSE){
        cs.OwnerId = ASAgents.get(cs.AccountId);
        cs.Assigned_to__c = TRUE;
        }
    }

    private static void ukRequestQuote(Case cs) {
        if(cs.Country__c=='UK' && cs.Type=='Request for Quote' && cs.Assigned_To__c == FALSE){
        cs.OwnerId = QAgents.get(cs.AccountId);
        cs.Assigned_to__c = TRUE;
        }
    }

    private static void ukRequestOrder(Case cs) {
        if(cs.Country__c=='UK' && cs.Type=='Request for Order' && cs.Assigned_To__c == FALSE){
        cs.OwnerId = ISAgents.get(cs.AccountId);
        cs.Assigned_to__c = TRUE;
        }
    }


    private static void notDear1InlandDana(Case cs) {
        if(deConditionalNotDear1(cs) && cs.Account.Distribution_Channel__c == 'Inland DANA') {
            cs.OwnerId = QueueMap.get('Inbox_DANA_Deutschland');
        }
    }
    private static void notDear1InlandWohnraum(Case cs) {
        if(deConditionalNotDear1(cs) && cs.Account.Distribution_Channel__c == 'Inland Wohnraum') {
            cs.OwnerId = QueueMap.get('Inbox_Fachhandel');
        }
    }
    private static void notDear1InlandObjekt(Case cs) {
        if(deConditionalNotDear1(cs) && cs.Account.Distribution_Channel__c == 'Inland Objekt') {
            cs.OwnerId = QueueMap.get('Inbox_Objekt');
        }
    }
    private static void notDear1InlandInlandBaumarkt(Case cs) {
        if(deConditionalNotDear1(cs) && cs.Account.Distribution_Channel__c == 'Inland Baumarkt') {
            cs.OwnerId = QueueMap.get('Inbox_Kilsgaard'); 
        }
    }
    private static void equalsDear1InlandStandardFachandel(Case cs) {
        if(deConditionalEqualsDear1(cs) && cs.Account.Distribution_Channel__c == 'Inland Standard-fachandel') {
            cs.OwnerId = QueueMap.get('Inbox_Fachhandel');
        }
    }
    private static void equalsDear1InlandObjekt(Case cs) {
        if(deConditionalEqualsDear1(cs) && cs.Account.Distribution_Channel__c == 'Inland Objekt') {
            cs.OwnerId = QueueMap.get('Inbox_Objekt');
        }
    }
    private static void equalsDear1Dana(Case cs) {
        if(deConditionalEqualsDear1(cs) && cs.Account.Distribution_Channel__c == 'Dana') {
            cs.OwnerId = QueueMap.get('Inbox_DANA_Deutschland');
        }
    }
    private static void equalsDear1Kilsgaard(Case cs) {
        if(deConditionalEqualsDear1(cs) && cs.Account.Distribution_Channel__c == 'Kilsgaard') {
            cs.OwnerId = QueueMap.get('Inbox_Kilsgaard');
        }
    }

}


 