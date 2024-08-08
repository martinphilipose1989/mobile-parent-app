import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DomainModule {
  @lazySingleton
  GetEnquiryListUsecase getEnquiryListUseCase(EnquiryRepository enquiryRepository) {
    return GetEnquiryListUsecase(enquiryRepository);
  }

  @lazySingleton
  GetAdmissionJourneyUsecase getAdmissionJourneyUsecase(EnquiryRepository enquiryRepository) {
    return GetAdmissionJourneyUsecase(enquiryRepository);
  }

  @lazySingleton
  GetNewAdmissionDetailUseCase getNewAdmissionDetailUseCase(EnquiryRepository enquiryRepository) {
    return GetNewAdmissionDetailUseCase(enquiryRepository);
  }

  @lazySingleton
  GetPsaDetailUsecase getPsaDetailUsecase(EnquiryRepository enquiryRepository) {
    return GetPsaDetailUsecase(enquiryRepository);
  }

  @lazySingleton
  GetAdmissionJourneyUsecase getIvtDetailUsecase(EnquiryRepository enquiryRepository) {
    return GetAdmissionJourneyUsecase(enquiryRepository);
  }
}