global class LeadProcessor implements Database.Batchable<sObject>,  Database.Stateful{
    
    global Integer recordsProcessed = 0;
	global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, LeadSource FROM Lead'
        );
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> records){
        System.debug('Number of records to proceed: ' + records.size());
        for(Lead lead: records){
            lead.LeadSource = 'Dreamforce';
            recordsProcessed = recordsProcessed + 1;
        }
        update records;
    }    
    
    global void finish(Database.BatchableContext bc){
        System.debug('recordsProcessed = ' + recordsProcessed);
    }  
}