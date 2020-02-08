trigger OpportunityChangeTrigger on OpportunityChangeEvent (after insert) {
    List<Task> tasks = new List<Task>();
    for(OpportunityChangeEvent event: Trigger.New){
        EventBus.ChangeEventHeader header = event.ChangeEventHeader;
        if(header.changetype == 'UPDATE'){
            if(event.IsWon){
                tasks.add(
                    new Task(
                        Subject='Follow up on won opportunities:' + header.recordids,
                    	OwnerId=header.commituser	
                    )
                );
            }
        }
        //else do nothing
    }
    if(tasks.size() > 0){
        insert tasks;
    }
}