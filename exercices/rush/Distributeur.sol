// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

contract Distributeur {

    // struct, arrays, enums
    struct User{
        string username;
        uint age;
        address wallet;
    }

     enum Dish{
        ICE_TEA,
        MARS,
        LION, 
        FANTA, 
        COCA_COLA
        }

    mapping (Dish => uint) public dishQuantity;
    mapping (Dish => uint) public dishQtyGived;
    mapping (Dish => uint) public dishQtyAdded;

    //functions------------------

    function getDish(Dish met, uint qty) public returns(Dish, uint, uint){
        // si il y a assez de stock
        //require(dishQuantity[met] >= qty, "Not enought item(s) available");
        if(dishQuantity[met] < qty ){
            dishQuantity[met] = dishQuantity[met];
            dishQtyGived[met] = dishQtyGived[met];

        } else {
            dishQuantity[met] = dishQuantity[met] - qty;
            dishQtyGived[met] = dishQtyGived[met] + qty;
        }
        //maj du stock
        return (met, dishQuantity[met], dishQtyGived[met]);
    }
        

    function fillDish(Dish met, uint qte) public returns(uint, uint, uint){
        uint added;
        //require(dishQuantity[met] < 42, "Too much item(s)");
        if(dishQuantity[met] + qte > 42){
            added = qte - (dishQuantity[met] + qte - 42);
            dishQtyAdded[met] = dishQtyAdded[met] + added;
            dishQuantity[met] = 42;
        } else {
            added = qte;
            dishQuantity[met] = dishQuantity[met] + qte;
            dishQtyAdded[met] =  dishQtyAdded[met] + qte;
        }

        return(dishQuantity[met],dishQtyAdded[met],added);
    }

}