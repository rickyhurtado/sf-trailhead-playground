@isTest
private class LeadProcessorTest {
    @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
        
        for (Integer i=0; i<200; i++) {
            leads.add(
                new Lead(
                    LastName = 'Lead ' + i,
                    Company  = 'Company Name',
                    Status   = 'Open - Not Contacted'
                )
            );
        }

        insert leads;
    }

    static testmethod void test() {        
        Test.startTest();
            LeadProcessor lp = new LeadProcessor();
            Id batchId 		 = Database.executeBatch(lp);
        Test.stopTest();

        System.assertEquals(200, [SELECT count()
                                  FROM Lead
                                  WHERE LeadSource = 'Dreamforce'
                                 ]
                           );
    }
    
}