public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String name) {
        List<List<sObject>> searchList = [FIND :name IN ALL FIELDS 
                                          RETURNING
                                              Lead(FirstName, LastName),
                                              Contact(FirstName, LastName)];
        
        return searchList;
    }
}