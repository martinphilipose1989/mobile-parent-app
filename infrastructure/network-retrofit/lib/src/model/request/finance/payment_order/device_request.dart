import 'package:data/data.dart';
import 'package:network_retrofit/network_retrofit.dart';

part 'device_request.g.dart';

@JsonSerializable()
class DeviceRequest extends BaseLayerDataTransformer<DeviceRequest, Device> {
  @JsonKey(name: "init_channel")
  final String? initChannel;
  @JsonKey(name: "ip")
  final String? ip;
  @JsonKey(name: "user_agent")
  final String? userAgent;
  @JsonKey(name: "accept_header")
  final String? acceptHeader;
  @JsonKey(name: "browser_tz")
  final int? browserTz;
  @JsonKey(name: "browser_color_depth")
  final int? browserColorDepth;
  @JsonKey(name: "browser_java_enabled")
  final bool? browserJavaEnabled;
  @JsonKey(name: "browser_screen_height")
  final int? browserScreenHeight;
  @JsonKey(name: "browser_screen_width")
  final int? browserScreenWidth;
  @JsonKey(name: "browser_language")
  final String? browserLanguage;
  @JsonKey(name: "browser_javascript_enabled")
  final bool? browserJavascriptEnabled;

  DeviceRequest({
    this.initChannel,
    this.ip,
    this.userAgent,
    this.acceptHeader,
    this.browserTz,
    this.browserColorDepth,
    this.browserJavaEnabled,
    this.browserScreenHeight,
    this.browserScreenWidth,
    this.browserLanguage,
    this.browserJavascriptEnabled,
  });

  factory DeviceRequest.fromJson(Map<String, dynamic> json) =>
      _$DeviceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceRequestToJson(this);

  @override
  DeviceRequest restore(Device data) {
    // TODO: implement restore
    return DeviceRequest(
        acceptHeader: acceptHeader,
        browserColorDepth: browserColorDepth,
        browserJavaEnabled: browserJavaEnabled,
        browserJavascriptEnabled: browserJavascriptEnabled,
        browserLanguage: browserLanguage,
        browserScreenHeight: browserScreenHeight,
        browserScreenWidth: browserScreenWidth,
        browserTz: browserTz,
        initChannel: initChannel,
        ip: ip,
        userAgent: userAgent);
  }
}
