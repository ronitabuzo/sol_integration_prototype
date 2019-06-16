pragma solidity ^0.5.0;

contract Claim{
    struct CourseApplication{
      uint caseId;
      string courseId;
      /*string applicantName;
      uint age;
      uint courseFee;*/
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
        string courseId
        /*,string applicantName,
        uint age,
        uint courseFee*/
    );

    event recordCourseUpdatesEvent (
        uint caseId,
        uint netfee,
        uint attendancePercentage,
        uint assessmentPercentage
    );

    function recordCourseApplication
        (uint _caseId, string memory _courseId
        /*,string memory _applicantName, uint _age, uint _courseFee*/
        )public{
         courseApplications[_caseId] = CourseApplication({
           courseId: _courseId,
           caseId: _caseId
           /*,applicantName: _applicantName,
           age: _age,
           courseFee: _courseFee*/
         });

         emit recordCourseApplicationEvent(_caseId, _courseId
            /*,_applicantName, _age, _courseFee*/
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
