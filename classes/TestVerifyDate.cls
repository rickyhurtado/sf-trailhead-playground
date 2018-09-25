@isTest
public class TestVerifyDate {
    @isTest static void testDateWithin30Days() {
        Date date1 = Date.parse('06/19/1977');
        Date date2 = Date.parse('07/18/1977');
        Date resultDate = VerifyDate.CheckDates(date1, date2);
        
        System.assertEquals(date2, resultDate);
    }
    
    @istest static void testEndOfMonthDate() {
        Date date1 = Date.parse('06/19/1977');
        Date date2 = Date.parse('07/20/1977');
        Date endDate = Date.parse('06/30/1977');
        
        Date resultDate = VerifyDate.CheckDates(date1, date2);
        
        System.assertEquals(endDate, resultDate);        
    }
}