public with sharing class WeatherController {
	public List<WeatherCity__c> cities {
		get {
			cities = WeatherCityController.retrieveCities();
			return cities;
		}
		private set;
	}

	public String searchTerm {get;set;}

	public LocationSearch.LocationResponse searchResult{get; private set;}

	public PageReference search() {

		String location = searchTerm;
		LocationSearch search = new LocationSearch(location);
		HTTPRequest req = search.buildHttpRequest();
		Http http = new Http();
		LocationSearch.LocationResponse locationResponse;
		HTTPResponse res;
		try{
			res = http.send(req);

			if (res.getStatusCode() == 200) {
				locationResponse = (LocationSearch.LocationResponse) JSON.deserialize(
					res.getBody(),
					LocationSearch.LocationResponse.class
				);

				//This doesn't work because there is a default city that is returned regardless of input
				//the default appears to be Washington, DC. Could do a check on what was searched to make sure it wasn't Washington DC or
				//in the JSON that is returned there is a 'fallback' which appears to signify this was just defaulted instead of searched for.
				if (locationResponse.results[0].locations.size() < 1) { 
					locationResponse.errorMessage = 'No Results Found';
				}

			} else {
				throw new LocationSearch.LocationSearchException(res.getStatusCode() + ' : ' + res.getStatus());
			}
		}
		catch(Exception e) {
			locationResponse.errorMessage = e.getMessage();
		}
		searchResult = locationResponse;
		return null;
	}

	public PageReference addCity() {
		//Really I need more time to think about this because Ideally I don't want to allow inserts of the same info twice so what can we use as a unique identifier? 
		//Depending on the vagueness of the search we may already have the city covered. Is the combination of City/State enough? Not sure if city name is unique enough for a state.

		String cityId = ApexPages.currentPage().getParameters().get('cityIdentifier');

		WeatherCity__c weatherCity;
		List<LocationSearch.Location> locations = searchResult.results[0].locations;
		
		for (LocationSearch.Location loc : locations) {
			if (loc.getIdentifier() == cityId) {
				weatherCity = new WeatherCity__c(
					Name = loc.getCity(),
					State__c = loc.getState(),
					Location__Latitude__s = Decimal.valueOf(loc.getLatitude()),
					Location__Longitude__s = Decimal.valueOf(loc.getLongtitude())
				);
				break;
			}
		}
		WeatherCityController.createWeatherCity(weatherCity);
		return null;
	}
}