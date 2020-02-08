trigger OrderEventTrigger on Order_Event__e (after insert) {
    for(Order_Event__e event: Trigger.New){
        if(event.Has_Shipped__c == true){
        Task tsk = new Task(Priority = 'Medium', 
                            Subject = 'Follow up on shipped order ' + event.Order_Number__c,
                            OwnerId = event.CreatedById);
        insert tsk;
    	}
    }
}