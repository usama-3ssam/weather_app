class WeatherModel {
  final String cityName;

  final String date;

  final String image;

  final String weatherCondition;

  dynamic temp;

  dynamic minTemp;

  dynamic maxTemp;

  WeatherModel({
    required this.image,
    required this.cityName,
    required this.date,
    required this.weatherCondition,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: json['current']['last_updated'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
    );
  }
}
