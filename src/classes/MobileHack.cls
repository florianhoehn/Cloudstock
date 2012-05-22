public with sharing class MobileHack {
    public boolean isIPhone {
        get {
            String userAgent = System.currentPageReference().getHeaders().get('User-Agent');
            String device = System.currentPageReference().getParameters().get('device');
            return (userAgent.contains('iPhone') || device == 'mobile');
        }
    }
    public List<Contact> contacts {
        get {
            return [SELECT Id, Name, Email, Phone FROM Contact ORDER BY LastName ASC LIMIT 20];
        }
    }
}