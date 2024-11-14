class VasOptionRequest {
  bool? transport;
  bool? cafeteria;
  bool? hostel;
  bool? kidsClub;
  bool? psa;
  bool? summarCamp;

  VasOptionRequest({
    this.transport,
    this.cafeteria,
    this.hostel,
    this.kidsClub,
    this.psa,
    this.summarCamp,
  });

  factory VasOptionRequest.fromJson(Map<String, dynamic> json) =>
      VasOptionRequest(
        transport: json["transport"],
        cafeteria: json["cafeteria"],
        hostel: json["hostel"],
        kidsClub: json["kids_club"],
        psa: json["psa"],
        summarCamp: json["summar_camp"],
      );

  Map<String, dynamic> toJson() => {
        "transport": transport,
        "cafeteria": cafeteria,
        "hostel": hostel,
        "kids_club": kidsClub,
        "psa": psa,
        "summar_camp": summarCamp,
      };
}
