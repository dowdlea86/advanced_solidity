# Advanced Solidity

Creating a deploying a crowdsale for a token called Pupper Coin to help fund development<br>
of the network.  The goal is to raise a maximum of 100 Ether.  If the goal is met, we will<br>
write in a refund function.  The crowdsale will run for 5 minutes in this case so we can<br>
see our results.<br>

We will write our code in Remix and have attached the relevant code files in the repo.<br>
We will bootstrap the contract by inheriting 5 OpenZeppelin contracts:<br>
CrowdSale
MintedCrowdSale
CappedCrowdSale
TimedCrowdSale
RefundablePostDeliveryCrowdsale

We will then need to write contracts that takes into account all the parameters of our crowdsale<br>
that suit our requirements. Along with calling the OpenZepplin contracts we will need to put<br>
in the payable wallet, rate, open time, clsoe time, among others.  Our PupperCoinSale contract<br>
should look as follows:<br>

!

We will then write another contract that deployes the sale and the PupperCoinSaleDeployer<br>
will look as follows:<br>

!

After our code is written and succesfully compiled we will use the deploy contract, we need<br>
to fill in the relevant information that includes our wallet, name, symbol, and our goal or<b>
cap that we would like raised.<br>

![sale_deployer](https://github.com/dowdlea86/advanced_solidity/blob/main/png_files/sale_deployer.png)

After we deploy the contract we will be given two addresses, our token address and sale address.<br>

![sale_deployer_outcome](https://github.com/dowdlea86/advanced_solidity/blob/main/png_files/sale_deployer_outcome.png)

We will then grab our token sale address, change our contract to PupperCoinSale so we can transact.<br>
We need to add the account that we want to buy from and put the amount, in this case 10 ether,<br>
our cap was set at 100 ether.<br>

![buy_tokens](https://github.com/dowdlea86/advanced_solidity/blob/main/png_files/buy_tokens.png)

Meta-mask will flash to confirm the transaction:<br> 

![buy_tokens](https://github.com/dowdlea86/advanced_solidity/blob/main/png_files/testnet_confirm.png)

We can see the transaction went through:<br>

![testnet_confirmation](https://github.com/dowdlea86/advanced_solidity/blob/main/png_files/testnet_confirmation.png)

There are a lot of functions that we wrote into our contract that can tell us interesting things about<br>
our auction.  We can check balances, see if the auction is still active, see if we have reached our cap.<br>
It will be under our contract:

![function](https://github.com/dowdlea86/advanced_solidity/blob/main/png_files/function.png)

Now we can repeat the process using the Ropsten network.  In this case, because we cannot get 100 test<br> 
fauctet we set our cap at 5 token and for this example purpose bought 1 ether.<br>

![ropsten_confirm](https://github.com/dowdlea86/advanced_solidity/blob/main/png_files/ropsten_confirm.png)

Confirmation looks as follows from MetaMask:

![testnet_confirmation](https://github.com/dowdlea86/advanced_solidity/blob/main/png_files/testnet_confirmation.png)

In Mycrypto we can do the same thing, we can add the token using the token address we created<br>
and can send a transaction.<br>

![mycrypto_address(https://github.com/dowdlea86/advanced_solidity/blob/main/png_files/mycrypto_address.png)

A confirmation of the transaction will look as follows:

![mycrypto_confirmation(https://github.com/dowdlea86/advanced_solidity/blob/main/png_files/mycrypto_confirmation.png) 
