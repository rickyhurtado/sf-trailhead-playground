@isTest
public class TestRestrictContactByName {
    @isTest static void testInsertInvalidLastName() {
        Contact contact = new Contact(LastName = 'INVALIDLASTNAME');
        
        Test.startTest();
        Database.SaveResult result = Database.insert(contact, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDLASTNAME" is not allowed for DML.',
                             result.getErrors()[0].getMessage());
    }

    @isTest static void testInsertValidLastName() {
        Contact newContact = new Contact(LastName = 'VALIDLASTNAME');
        
        Test.startTest();
        Database.SaveResult result = Database.insert(newContact, false);
        Test.stopTest();
                
        System.assert(result.isSuccess());
    }

    @isTest static void testUpdateValidLastName() {
        Contact newContact = new Contact(LastName = 'NEWLASTNAME');
        insert newContact;
        
        Contact newContactResult = [SELECT LastName FROM Contact WHERE LastName='NEWLASTNAME'];
        newContactResult.LastName = 'VALIDLASTNAME';
        
        Test.startTest();
        Database.SaveResult result = Database.update(newContactResult, false);
        Test.stopTest();
                
        System.assert(result.isSuccess());
    }

    @isTest static void testUpdateInvalidLastName() {
        Contact contact = new Contact(LastName = 'NEWLASTNAME');
        insert contact;
        
        Contact newContactResult = [SELECT LastName FROM Contact WHERE LastName='NEWLASTNAME'];
                
        newContactResult = [SELECT LastName FROM Contact WHERE LastName='NEWLASTNAME'];
        newContactResult.LastName = 'INVALIDLASTNAME';
        
        Test.startTest();
        Database.SaveResult invalidLastNameResult = Database.update(newContactResult, false);
        Test.stopTest();
        
        System.assert(!invalidLastNameResult.isSuccess());
        System.assert(invalidLastNameResult.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDLASTNAME" is not allowed for DML.',
                             invalidLastNameResult.getErrors()[0].getMessage());
    }
}