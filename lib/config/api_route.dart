
class ApiRoute {
  //Base Url
  static String? baseurl = "";
  String login = "$baseurl/loginProcess";
  String logout = "$baseurl/logout";
  String register = "$baseurl/new_registration";
  String getUser = "$baseurl/user/get-my-details";
  String getCycle = "$baseurl/user/get-cycle-details";
  String getIssueReq = "$baseurl/user/get-issue-request";
  String makeIssueReq = "$baseurl/user/make-issue-request";
  String withdrawIssueReq = "$baseurl/user/withdrawl-issue-request";
  String makeSurenderReq = "$baseurl/user/make-surrender-request";
  String admin = "$baseurl/";

  // admin
  String cycleInvUrl = "$baseurl/admin/get-cycle-inventory";
  String adminCycleReqUrl = "$baseurl/admin/get-cycle-issue-request";
  String updateIssueReq = "$baseurl/admin/update-issue-request";
}
