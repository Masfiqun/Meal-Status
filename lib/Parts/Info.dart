class InformationModel{
  String name;
  String room_no;
  String M_name;

  InformationModel({
    required this.M_name,
    required this.name,
    required this.room_no,
  });

  static List<InformationModel> getInfo(){
    List<InformationModel> information = [];

    information.add(
      InformationModel(
        M_name: 'Raihan Miraj', 
        name: 'Miraj', 
        room_no: '406'
      )
    );

    return information;
  }
}