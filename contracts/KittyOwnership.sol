// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./KittyBase.sol";


/// @title The facet of the CryptoKitties core contract that manages ownership, ERC-721 (draft) compliant.
/// @author Axiom Zen (https://www.axiomzen.co)
/// @dev Ref: https://github.com/ethereum/EIPs/issues/721
///  See the KittyCore contract documentation to understand how the various contract facets are arranged.
contract KittyOwnership is KittyBase {

    /// @notice Name and symbol of the non fungible token, as defined in ERC721.
   

    // bool public implementsERC721 = true;
    //
 
    
    // Internal utility functions: These functions all assume that their input arguments
    // are valid. We leave it to public methods to sanitize their inputs and follow
    // the required logic.

    /// @dev Checks if a given address is the current owner of a particular Kitty.
    /// @param _claimant the address we are validating against.
    /// @param _tokenId kitten id, only valid when > 0
    function _owns(address _claimant, uint256 _tokenId) internal view returns (bool) {
        // return kittyIndexToOwner[_tokenId] == _claimant;
        address owner = ownerOf(_tokenId);
        return (_claimant == owner);
    }

    /// @dev Checks if a given address currently has transferApproval for a particular Kitty.
    /// @param _claimant the address we are confirming kitten is approved for.
    /// @param _tokenId kitten id, only valid when > 0


    /// @dev Marks an address as being approved for transferFrom(), overwriting any previous
    ///  approval. Setting _approved to address(0) clears all transfer approval.
    ///  NOTE: _approve() does NOT send the Approval event. This is intentional because
    ///  _approve() and transferFrom() are used together for putting Kitties on auction, and
    ///  there is no value in spamming the log with Approval events in that case.
   

    /// @dev Transfers a kitty owned by this contract to the specified address.
    ///  Used to rescue lost kitties. (There is no "proper" flow where this contract
    ///  should be the owner of any Kitty. This function exists for us to reassign
    ///  the ownership of Kitties that users may have accidentally sent to our address.)
    /// @param _kittyId - ID of kitty
    /// @param _recipient - Address to send the cat to
    function rescueLostKitty(uint256 _kittyId, address _recipient) public onlyCOO whenNotPaused {
        require(_owns(address(this), _kittyId));
        _transfer(address(this), _recipient, _kittyId);
    }

    /// @notice Returns the number of Kitties owned by a specific address.
    /// @param _owner The owner address to check.
    /// @dev Required for ERC-721 compliance
 

    /// @notice Transfers a Kitty to another address. If transferring to a smart
    ///  contract be VERY CAREFUL to ensure that it is aware of ERC-721 (or
    ///  CryptoKitties specifically) or your Kitty may be lost forever. Seriously.
    /// @param _to The address of the recipient, can be a user or contract.
    /// @param _tokenId The ID of the Kitty to transfer.
    /// @dev Required for ERC-721 compliance.
    

    /// @notice Grant another address the right to transfer a specific Kitty via
    ///  transferFrom(). This is the preferred flow for transfering NFTs to contracts.
    /// @param _to The address to be granted transfer approval. Pass address(0) to
    ///  clear all approvals.
    /// @param _tokenId The ID of the Kitty that can be transferred if this call succeeds.
    /// @dev Required for ERC-721 compliance.
  

    /// @notice Transfer a Kitty owned by another address, for which the calling address
    ///  has previously been granted transfer approval by the owner.
    /// @param _from The address that owns the Kitty to be transfered.
    /// @param _to The address that should take ownership of the Kitty. Can be any address,
    ///  including the caller.
    /// @param _tokenId The ID of the Kitty to be transferred.
    /// @dev Required for ERC-721 compliance.
  

    /// @notice Returns the total number of Kitties currently in existence.
    /// @dev Required for ERC-721 compliance.
 

    /// @notice Returns the address currently assigned ownership of a given Kitty.
    /// @dev Required for ERC-721 compliance.
  

    /// @notice Returns the nth Kitty assigned to an address, with n specified by the
    ///  _index argument.
    /// @param _owner The owner whose Kitties we are interested in.
    /// @param _index The zero-based index of the cat within the owner's list of cats.
    ///  Must be less than balanceOf(_owner).
    /// @dev This method MUST NEVER be called by smart contract code. It will almost
    ///  certainly blow past the block gas limit once there are a large number of
    ///  Kitties in existence. Exists only to allow off-chain queries of ownership.
    ///  Optional method for ERC-721.
 
}
