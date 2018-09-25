trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {
    List<Task> taskList = new List<Task>();
    
	for (Opportunity o : Trigger.new) {
        if (o.StageName == 'Closed Won') {
            taskList.add(
                new Task(Subject = 'Follow Up Test Task', WhatId = o.Id)
            );
        }
    }
    
    insert taskList;
}