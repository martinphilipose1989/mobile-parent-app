import 'dart:io';

import 'package:data/data.dart';
import 'package:network_retrofit/src/model/response/get_ivt_detail/ivt_detail_response_entity.dart';
import 'package:network_retrofit/src/model/response/get_new_admission/new_admission_detail_entity.dart';
import 'package:network_retrofit/src/model/response/get_psa_detail/psa_detail_response_entity.dart';

class EnquiryRepositoryImpl implements EnquiryRepository{
  final NetworkPort _networkPort;

  EnquiryRepositoryImpl(this._networkPort);

 
  @override
  Future<Either<NetworkError, EnquiryListModel>> getEnquiryList({required String phone, required int pageNumber, int pageSize = 10}){
    return _networkPort.getEnquiryList(
     pageNumber: pageNumber,phone: phone,pageSize: pageSize
    );
  }

  @override
  Future<Either<NetworkError, AdmissionJourneyBase>> getAdmissionJourney({required String enquiryID,required String type}){
    return _networkPort.getAdmissionJourney(
     enquiryID: enquiryID,
     type: type
    );
  }

  @override
  Future<Either<NetworkError, NewAdmissionBase>> getNewAdmissionDetail({required String enquiryID}){
    return _networkPort.getNewAdmissionDetail(
     enquiryID: enquiryID,
    );
  }

  @override
  Future<Either<NetworkError, PsaResponse>> getPsaDetail({required String enquiryID}){
    return _networkPort.getPsaDetail(
     enquiryID: enquiryID,
    );
  }

  @override
  Future<Either<NetworkError,  IVTBase>> getIvtDetail({required String enquiryID}){
    return _networkPort.getIvtDetail(
     enquiryID: enquiryID,
    );
  }

  @override
  Future<Either<NetworkError, NewAdmissionBase>> updateNewAdmissionDetail({required String enquiryID, required NewAdmissionDetailEntity newAdmissionDetail}) {
    return _networkPort.updateNewAdmissionDetail(enquiryID: enquiryID, newAdmissionDetail: newAdmissionDetail);
    
  }

  @override
  Future<Either<NetworkError, IVTBase>> updateIvtDetail({required String enquiryID, required IvtDetailResponseEntity ivtDetails}) {
    return _networkPort.updateIvtDetail(enquiryID: enquiryID, ivtDetails: ivtDetails);
  }

  @override
  Future<Either<NetworkError, PsaResponse>> updatePsaDetail({required String enquiryID, required PsaDetailResponseEntity psaDetail}) {
    return _networkPort.updatePsaDetail(enquiryID: enquiryID, psaDetail: psaDetail);
  }

  @override
  Future<Either<NetworkError, EnquiryDetailBase>> getEnquiryDetail({required String enquiryID}) {
    return _networkPort.getEnquiryDetail(enquiryID: enquiryID);
  }

  @override
  Future<Either<NetworkError, EnquiryTimeLineBase>> getEnquiryTimeline({required String enquiryID}) {
    return _networkPort.getEnquiryTimeline(enquiryID: enquiryID);   
  }

  @override
  Future<Either<NetworkError, EnquiryFileUploadBase>> uploadEnquiryDocument({required String enquiryID, required String documentID, required File file}) {
    return _networkPort.uploadEnquiryDocument(enquiryID: enquiryID, documentID: documentID, file: file);
  }

  @override
  Future<Either<NetworkError, DownloadEnquiryFileBase>> downloadEnquiryDocument({required String enquiryID, required String documentID}) {
    return _networkPort.downloadEnquiryDocument(enquiryID: enquiryID, documentID: documentID);
  }

  @override
  Future<Either<NetworkError, DeleteEnquiryFileBase>> deleteEnquiryDocument({required String enquiryID, required String documentID}) {
    return _networkPort.deleteEnquiryDocument(enquiryID: enquiryID, documentID: documentID);
  }

  @override
  Future<Either<NetworkError, MdmAttributeBaseModel>> getMdmAttribute({required String infoType}) {
    return _networkPort.getMdmAttribute(infoType: infoType);
  }

}