# secure-election
My submission for codefundo++ 2019.

This submission is a Proof of Concept for an app, which uses Azure Blockchain Workbench and Aadhar API to secure an election and expedite the counting of votes.

The blockchain implementation does not allow a vote to be changed after it has been casted. It also stores the timestamps of each vote, so any vote that has been casted after the election ends can be found. It uses Aadhar VID to authenticate a voter, so that no one else other than the voter can vote on behalf of himself.

Further, the vote counting process can be expedited by simply fetching the details of all smart contracts (containing the details of the vote) on the blockchain by Azure Blockchain Workbench's Rest API.
