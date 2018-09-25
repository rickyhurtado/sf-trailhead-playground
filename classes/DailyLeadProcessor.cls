global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT LeadSource
                            FROM Lead
                            WHERE LeadSource = null
                            LIMIT 200];
        
        List<Lead> leadList = new List<Lead>();
        
        for (Lead lead : leads) {
            lead.LeadSource = 'Dreamforce';
            leadList.add(lead);
        }
        
		update leadList;
    }
}