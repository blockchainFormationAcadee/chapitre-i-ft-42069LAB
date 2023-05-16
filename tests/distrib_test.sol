// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "../exercices/rush/Distributeur.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract testSuite {

    Distributeur distrib;

    /// 'beforeAll' runs before all other tests
    function beforeAll () public {
        // Create an instance of contract to be tested
        distrib = new Distributeur();
    }

    // test ajout 5 ICE_TEA
    function testFillDish5() public {
        
        try distrib.fillDish(Distributeur.Dish.ICE_TEA, 5) returns (uint remaining, uint added_tot, uint added){
            Assert.equal(remaining , 5, "error remaining ICE_TEA");
            Assert.equal(added_tot , 5, "error added ICE_TEA");
            Assert.equal(added , 5, "error added ICE_TEA");
        } catch Error(string memory /*reason*/){
            // This is executed in case
            // revert was called inside getData
            // and a reason string was provided.
            Assert.ok(false, 'failed with reason');          
        } catch (bytes memory /*lowLevelData*/) {
            // This is executed in case revert() was used
            // or there was a failing assertion, division
            // by zero, etc. inside getData.
            Assert.ok(false, 'failed unexpected');
        }
    }
    // test donner 3 ICE_TEA
    function testGetDish3() public {
        
        try distrib.getDish(Distributeur.Dish.ICE_TEA, 3) returns (Distributeur.Dish met, uint remaining, uint given){
            Assert.equal(remaining , 2, "error remaining ICE_TEA");
            Assert.equal(given , 3, "error given ICE_TEA");
            Assert.ok(met == Distributeur.Dish.ICE_TEA, "error return met");
        } catch Error(string memory /*reason*/){
            // This is executed in case
            // revert was called inside getData
            // and a reason string was provided.
            Assert.ok(false, 'failed with reason');          
        } catch (bytes memory /*lowLevelData*/) {
            // This is executed in case revert() was used
            // or there was a failing assertion, division
            // by zero, etc. inside getData.
            Assert.ok(false, 'failed unexpected');
        }
    }

    // test donner 4 ICE_TEA 
    function testGetDish4() public {
        
        try distrib.getDish(Distributeur.Dish.ICE_TEA, 4) returns (Distributeur.Dish met, uint remaining, uint given){
            Assert.equal(remaining , 2, "error remaining ICE_TEA");
            Assert.equal(given , 3, "error given ICE_TEA");
            Assert.ok(met == Distributeur.Dish.ICE_TEA, "error return met");
        } catch Error(string memory /*reason*/){
            // This is executed in case
            // revert was called inside getData
            // and a reason string was provided.
            Assert.ok(false, 'failed with reason');          
        } catch (bytes memory /*lowLevelData*/) {
            // This is executed in case revert() was used
            // or there was a failing assertion, division
            // by zero, etc. inside getData.
            Assert.ok(false, 'failed unexpected');
        }
    }

    
    // test ajouter 50 ICE_TEA 
    function testFillDish50() public {
        
        try distrib.fillDish(Distributeur.Dish.ICE_TEA, 50) returns (uint remaining, uint added_tot, uint added){
            Assert.equal(remaining , 42, "error remaining ICE_TEA");
            Assert.equal(added_tot , 45, "error added_tot ICE_TEA");
            Assert.equal(added , 40, "error added ICE_TEA");
        } catch Error(string memory /*reason*/){
            // This is executed in case
            // revert was called inside getData
            // and a reason string was provided.
            Assert.ok(false, 'failed with reason');          
        } catch (bytes memory /*lowLevelData*/) {
            // This is executed in case revert() was used
            // or there was a failing assertion, division
            // by zero, etc. inside getData.
            Assert.ok(false, 'failed unexpected');
        }
    }

}
    