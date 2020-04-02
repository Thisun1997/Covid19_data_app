class DataApi{
  Data data;

  DataApi({this.data});

  DataApi.fromJson(Map<String, dynamic> json){
    data = new Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> result = new Map<String, dynamic>();
    result['data'] = this.data.toJson();
    return result;
  }

}

class Data{
  String update_date_time;
  num local_new_cases;
  num local_total_cases;
  num local_total_number_of_individuals_in_hospitals;
  num local_deaths;
  num local_recovered;
  num local_active_cases;
  num global_new_cases;
  num global_total_cases;
  num global_deaths;
  num global_recovered;

  Data(
    {
      this.update_date_time,
      this.local_new_cases,
      this.local_total_cases,
      this.local_total_number_of_individuals_in_hospitals,
      this.local_deaths,
      this.local_recovered,
      this.local_active_cases,
      this.global_new_cases,
      this.global_total_cases,
      this.global_deaths,
      this.global_recovered,
    }
  );

  Data.fromJson(Map<String, dynamic> json){
    update_date_time = json['update_date_time'];
    local_new_cases = json['local_new_cases'];
    local_total_cases = json['local_total_cases'];
    local_total_number_of_individuals_in_hospitals = json['local_total_number_of_individuals_in_hospitals'];
    local_deaths = json['local_deaths'];
    local_recovered = json['local_recovered'];
    local_active_cases = json['local_active_cases'];
    global_new_cases = json['global_new_cases'];
    global_total_cases = json['global_total_cases'];
    global_deaths = json['global_deaths'];
    global_recovered = json['global_recovered'];
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = new Map<String, dynamic>();
      result['update_date_time'] = this.update_date_time;
      result['local_new_cases'] = this.local_new_cases;
      result['local_total_cases'] = this.local_total_cases; 
      result['local_total_number_of_individuals_in_hospitals'] = this.local_total_number_of_individuals_in_hospitals;
      result['local_deaths']=this.local_deaths; 
      result['local_recovered']=this.local_recovered;
      result['local_active_cases'] = this.local_active_cases;
      result['global_new_cases']=this.global_new_cases; 
      result['global_total_cases']=this.global_total_cases ;
      result['global_deaths']=this.global_deaths ;
      result['global_recovered']=this.global_recovered ;
      return result;
   }
}