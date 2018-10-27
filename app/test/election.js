var Election = artifacts.require("./Election.sol");

contract("Election", function(accounts) {
  var electionInstance;

  it("initializes with two candidates", async () => {
    instance = await Election.deployed()
    count = await instance.candidatesCount();
    assert.equal(count, 2);
  });

  it("it initializes the candidates with the correct values", async () => {
    electionInstance = await Election.deployed()
    candidate = await electionInstance.candidates(1);
    assert.equal(candidate[0], 1, "contains the correct id");
    assert.equal(candidate[1], "Candidate 1", "contains the correct name");
    assert.equal(candidate[2], 0, "contains the correct votes count");
    candidate = await electionInstance.candidates(2);
    assert.equal(candidate[0], 2, "contains the correct id");
    assert.equal(candidate[1], "Candidate 2", "contains the correct name");
    assert.equal(candidate[2], 0, "contains the correct votes count");
  });

  it("allows a voter to cast a vote", async () => {
    electionInstance = await Election.deployed()
    candidateId = 1;
    receipt = await electionInstance.vote(candidateId, { from: accounts[0] });
    assert.equal(receipt.logs.length, 1, "an event was triggered");
    assert.equal(receipt.logs[0].event, "votedEvent", "the event type is correct");
    assert.equal(receipt.logs[0].args._candidateId.toNumber(), candidateId, "the candidate id is correct");
    voted = await electionInstance.voters(accounts[0]);
    assert(voted, "the voter was marked as voted");
    candidate = await electionInstance.candidates(candidateId);
    var voteCount = candidate[2];
    assert.equal(voteCount, 1, "increments the candidate's vote count");
  });

  it("throws an exception for invalid candiates", async () => {
    electionInstance = await Election.deployed()
    try {
      await electionInstance.vote(99, { from: accounts[1] })
      assert.fail
    } catch (error) {
      assert(error.message.indexOf('revert') >= 0, "error message must contain revert");
    }
    candidate1 = await electionInstance.candidates(1);
    var voteCount = candidate1[2];
    assert.equal(voteCount, 1, "candidate 1 did not receive any votes");
    candidate2 = await electionInstance.candidates(2);
    var voteCount = candidate2[2];
    assert.equal(voteCount, 0, "candidate 2 did not receive any votes");
  });

  it("throws an exception for double voting", async () => {
    electionInstance = await Election.deployed()
    candidateId = 2;
    await  electionInstance.vote(candidateId, { from: accounts[1] });
    candidate = await electionInstance.candidates(candidateId);
    var voteCount = candidate[2];
    assert.equal(voteCount, 1, "accepts first vote");
    // Try to vote again
    try {
      await electionInstance.vote(candidateId, { from: accounts[1] });
      assert.fail
    } catch(error) {
      assert(error.message.indexOf('revert') >= 0, "error message must contain revert");
    }
    candidate1 = await electionInstance.candidates(1);
    var voteCount = candidate1[2];
    assert.equal(voteCount, 1, "candidate 1 did not receive any votes");
    candidate2 = await electionInstance.candidates(2);
    var voteCount = candidate2[2];
    assert.equal(voteCount, 1, "candidate 2 did not receive any votes");
  });
});
