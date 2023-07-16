public with sharing class WeatherCityController {
    //Could choose to instead remove inaccessible fields but just did this more explicitly for now
    public static void createWeatherCity(WeatherCity__c wc) {
        if (Schema.sObjectType.WeatherCity__c.isCreateable() &&
            Schema.sObjectType.WeatherCity__c.fields.Location__Latitude__s.isCreateable() &&
            Schema.sObjectType.WeatherCity__c.fields.Location__Longitude__s.isCreateable() &&
            Schema.sObjectType.WeatherCity__c.fields.Name.isCreateable() &&
            Schema.sObjectType.WeatherCity__c.fields.State__c.isCreateable()){
            
            insert wc;
        }
    }

    public static List<WeatherCity__c> retrieveCities(){
        return [SELECT Id, Name, Location__Latitude__s, Location__Longitude__s, State__c FROM WeatherCity__c WITH SECURITY_ENFORCED];
    }
}