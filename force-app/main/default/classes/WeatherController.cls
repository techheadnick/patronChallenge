public with sharing class WeatherController {
	public List<WeatherCity__c> cities {
		get{
			//TODO: Flesh out schema
			cities = [SELECT Id, Name FROM WeatherCity__c];
			return cities;
		}
		private set;
	}

	public String searchTerm {get;set;}

	public List<String> searchResult{get; private set;}

	public PageReference search(){
		//TODO: Mocked data to be replaced with live Weather API data
		searchResult = new List<String>();
		searchResult.add('Boston');
		searchResult.add('Bangor');
		return null;
	}

	public PageReference addCity(){
		//TODO: See coding challenge doc for what should happen for each new City

		String city = ApexPages.currentPage().getParameters().get('city');

		WeatherCity__c weatherCity = new WeatherCity__c(
				Name = city
		);
		insert weatherCity;

		return null;
	}

}