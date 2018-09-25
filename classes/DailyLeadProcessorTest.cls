@isTest
private class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';

    @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();

        for (Integer i=0; i<200; i++) {
            leads.add(
                new Lead(
                    LastName = 'Lead ' + i,
                    Company	 = 'Company Name',
                    Status	 = 'Open - Not Contacted'
                )
			);
        }
        
        insert leads;
        
        System.debug(leads.size());
    }

    static testmethod void testScheduledJob() {
        List<Lead> leads = [SELECT LeadSource
                            FROM Lead
                            WHERE LeadSource = null
                            LIMIT 200];

        Test.startTest();
        	String jobId = System.schedule(
                'ScheduledApexTest',
            	CRON_EXP,
                new DailyLeadProcessor()
			);

        	System.assertEquals(200, leads.size());
        Test.stopTest();

        List<Lead> updatedLeads = [SELECT LeadSource
                                   FROM Lead
                                   WHERE LeadSource = 'Dreamforce'
                                   LIMIT 200];

        System.assertEquals(200, updatedLeads.size());
    }
}