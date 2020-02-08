trigger TaskIsclosedTrigger on Task (after insert, after update) {
    Map<Id, Lead> leadsToUpdate = new Map<Id, Lead>();
    for(Task task: Trigger.New){
        Boolean isClosedNow = false;
        if(Trigger.isUpdate){
            Task oldTask = Trigger.OldMap.get(task.Id);
            isClosedNow = oldTask != null 
                && oldTask.IsClosed == false 
                && task.IsClosed == true;
        }
        if(Trigger.isInsert){
            isClosedNow = task.IsClosed;
        }
        
        if(isClosedNow){
            if(leadsToUpdate.containsKey(task.WhoId)){
                Lead lead = leadsToUpdate.get(task.WhoId);
                lead.Completed_Activity_Count__c += 1;
                leadsToUpdate.put(lead.Id, lead);
            } else{
                List<Lead> leads = [SELECT Id, Completed_Activity_Count__c 
                                	FROM Lead
                                	WHERE Id = :task.WhoId];
                if(leads.size() == 1){
                    Lead lead = leads.get(0);
                    lead.Completed_Activity_Count__c += 1;
                    leadsToUpdate.put(lead.Id, lead);
                }
            }
        }
    }
    if(!leadsToUpdate.isEmpty()){
        update leadsToUpdate.values();
    }
}