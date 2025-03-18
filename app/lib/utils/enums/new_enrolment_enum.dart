enum VasOptions { kidsClub, cafeteria, psa, summerCamp, transport }

enum EnrolmentFeeType {
  cafeteria('cafeteria'),
  kidsClub('kids_club'),
  psa('psa'),
  summerCamp('summer_camp'),
  transport('transport');

  final String type;

  const EnrolmentFeeType(this.type);
}
