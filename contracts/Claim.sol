pragma solidity ^0.5.0;

contract Claim{
    struct CourseApplication{
      uint caseId;
      string courseId;
      string applicantName;
      string applicantNRIC;
      string applicantCitizenship;
      string tpId;
      string tpName;
      string applicationDate;
      uint applicantAge;
      uint courseFee;
    }

    struct CourseUpdates{
      uint caseId;
      uint netfee;
      uint attendancePercentage;
      uint assessmentPercentage;
    }

    mapping(uint => CourseApplication) public courseApplications;
    mapping(uint => CourseUpdates) public courseUpdates;

    event recordCourseApplicationEvent (
        uint caseId,
        string courseId,
        string applicantName,
        string applicantNRIC,
        string applicantCitizenship,
        string tpId,
        string tpName,
        string applicationDate,
        uint applicantAge,
        uint courseFee
    );

    event recordCourseUpdatesEvent (
        uint caseId,
        uint netfee,
        uint attendancePercentage,
        uint assessmentPercentage
    );

    function recordCourseApplication
        (uint _caseId, string memory _courseId,
        string memory _applicantName, 
        string memory _applicantNRIC,
        string memory _applicantCitizenship,
        string memory _tpId,
        string memory _tpName,
        string memory _applicationDate,
        uint _applicantAge, uint _courseFee
        )public{
         courseApplications[_caseId] = CourseApplication({
           courseId: _courseId,
           caseId: _caseId,
           applicantName: _applicantName,
           applicantNRIC: _applicantNRIC,
           applicantCitizenship: _applicantCitizenship,
           tpId: _tpId,
           tpName: _tpName,
           applicationDate: _applicationDate,
           applicantAge: _applicantAge,
           courseFee: _courseFee
         });

         emit recordCourseApplicationEvent(_caseId, _courseId,
            _applicantName, applicantNRIC, _applicantCitizenship, _tpId, _tpName, _applicationDate, _applicantAge, _courseFee
         );
    }

    function recordCourseUpdates
        (uint _caseId, uint _netfee, uint _attendancePercentage, uint _assessmentPercentage)
        public{
         courseUpdates[_caseId] = CourseUpdates({
           caseId: _caseId,
           netfee: _netfee,
           attendancePercentage: _attendancePercentage,
           assessmentPercentage: _assessmentPercentage
         });

         emit recordCourseUpdatesEvent(_caseId, _netfee, _attendancePercentage, _assessmentPercentage);
    }
}
