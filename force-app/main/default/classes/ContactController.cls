@RestResource(urlMapping='/Contacts/scorecard_recipients')
global with sharing class ContactController {
	@HttpGet
    global static List<Contact> getScorecardRecipients(){
        
        List<Contact> scorecardRecipients = [SELECT Id, FirstName, LastName, Email, Contact_Role__c 
                         					FROM Contact
                         					WHERE AccountId IN (
                             					SELECT AccountId FROM Opportunity
                         					) 
                         					AND Contact_Role__c INCLUDES ('Scorecard Recipient')];
        return scorecardRecipients;
    }
}