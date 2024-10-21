class FetchStopRequest {
    int? schoolId;
    String? routeType;
    String? busType;

    FetchStopRequest({
        this.schoolId,
        this.routeType,
        this.busType,
    });

    factory FetchStopRequest.fromJson(Map<String, dynamic> json) => FetchStopRequest(
        schoolId: json["school_id"],
        routeType: json["route_type"],
        busType: json["bus_type"],
    );

    Map<String, dynamic> toJson() => {
        "school_id": schoolId,
        "route_type": routeType,
        "bus_type": busType,
    };
}
