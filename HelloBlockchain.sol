pragma solidity >=0.4.25 <0.6.0;

contract SecureElection {
    
    //Set of States
    enum StateType { Vote }

    //List of properties
    StateType public  State;
    address public  Voter;

    string public AadharVID;
    PoliticalParty public VotedParty;
    string public AadharOTP;

    //Set of Political Parties
    enum PoliticalParty { BJP, Congress, AAP}

    // constructor function
    constructor(string memory aadharVid, string memory aadharOtp, PoliticalParty party) public
    {
        SendVote(aadharVid, aadharOtp, party);
    }

    // call this function to send a request
    function SendVote(string memory aadharVid, string memory aadharOtp, PoliticalParty party) public
    {
        string memory otp1 = "9401";
        string memory otp2 = "8462";

        bool condition1 = keccak256(abi.encodePacked(aadharOtp)) != keccak256(abi.encodePacked(otp1));
        bool condition2 = keccak256(abi.encodePacked(aadharOtp)) != keccak256(abi.encodePacked(otp2));

        if(condition1 && condition2)
        {
            revert("OTP verification failed.");
        }

        AadharVID = aadharVid;
        AadharOTP = aadharOtp;
        VotedParty = party;
        State = StateType.Vote;
    }
}