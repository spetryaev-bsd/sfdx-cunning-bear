public class AccountProcessor {

    @future
    public static void countContacts(List<Id> accIds){
        for(Id accId: accIds){
            Account acc = [SELECT Id, Name, Number_of_Contacts__c FROM Account];
            acc.Number_of_Contacts__c = [SELECT count() FROM Contact WHERE AccountId = :accId];
            update acc;
        }
    }
}