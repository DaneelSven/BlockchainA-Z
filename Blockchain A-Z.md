## Blockchain A-Z

# <u>Cryptocurrency Intuition</u>

## Bitcoin's Monetary policy: 

- The Halving
  every 4 years the block reward gets cut in half.
- Block frequency
  is how often the block gets added to the network. In bitcoins example it is an average of 10 min.



## Mining Difficulty:

Difficulty = current target / max target
for example: The hash is 64 characters long and each character can be represented from 0-9 and A-F so 16 possibilities. 
max target = 16^64 = 10^77
say our current target hash is 0000A4F... so 4 zeroes. 
current Target = 16^(64-4) = 16^60 = 1.7*10^72

probability that a random picked has is valid = 0.000017%

The mining difficulty is adjusted every 2016 blocs with is about every 2 weeks.
The difficulty is adjust by increasing the leading 0 in front of the hash. which will lead to the current target having having less characters being able to represent either 0-9 or A-Z which will lead to a smaller number and thus a smaller number divided by the same max target will decrease the percentage of mining a block and therefore make it harder.

![IMG_20190926_145307](C:\Users\Sven Daneel\Desktop\img\IMG_20190926_145307.jpg)

## Mining Pools:

Since it is not possible to mine alone anymore on a single computer now we have mining pools, which combine all the hashing power of the participants into the mining pool. The mining pool dictates the miners which nonce range they should calculate since if each mining rig would randomly try to solve the problem there would be an overlap and some miners might try the same nonce and therefore doing double or triple the work required. So when the mining pool gets the reward and the fee for solving the problem each miner gets a reward proportional to the hashing power contributing to solving the puzzle.



## Nonce Range:

The Nonce is a 32-bit number so it is an unsigned intergern between 0 and 4,3 Billion. But sometimes the Nonce is not enough to calculate the current hash. since what if all the possible nonce between 0 and 4,3 billion don't produce valid hash target. There is actually another field which is called timestamp. Which represents amount of seconds passed since 1. January 1970. So by doing this the timestamp gets update and increased by 1 every second and thus changing the hash completely so one can start looking for the nonce again from 0 cause it will produce a totally different hash. If this timestamp didn't exist one could go through all the possible nonce and not find the required hash and just sit there and have nothing to do. This problem is solved for a miner who would maybe to 100 million hashes per second. 

![IMG_20190926_161825](C:\Users\Sven Daneel\Desktop\IMG_20190926_161825.jpg)



But how does that effect a mining pool which has 2 million Trillion hashes per second? it would eat through all the possible nonce in much less than 1 second which it takes to update the timestamp. So what the miner does it exchanges the lowest fee transaction of the preselected transactions and takes another transaction from the MEMPOOL which is the next highest transaction and calculates all the hashes by going through the nonce again from 0 to 4,3 billion. It will continue doing this either until the hash is found or the second has passed and the mining pool can search through all the nonce again without replacing a transaction. 



## How Miners Pick Transactions:

The Miners pick transactions from the MEMPOOL which is attached on every one and which is a memory pool of unconfirmed transactions transactions. One can regard the MEMPOOL like a staging area for transactions before they get added to the next block. So the Block can fit around 1 MB of transactions which accounts to roughly 2000 transactions. The Miner will choose transactions with the highest fees since if the block gets added the miner gets the block reward and the fees. So logically the miner chooses the transactions with the most fees. So if you want to make sure that your transaction gets processed faster and included into the next block it behoves you to pay a higher fee. 



## CPUs vs GPUs vs ASICs:

CPU (Central Processing Unit) General < 10 MH/s

GPU (Graphics Processing Unit) Specialized for matrix operations < 1 GH/s = 1 billion Herz per second

ASIC ( Application-Specific Integrated Circuit) Totally Specialized for cracking hashes(SHA256) > 1,000 GH/s  \\



## How Mempools work: 

The Mempool is a staging area for transactions before they get added to the next block. Every node and miner share the same copy of the mempool. 



## Orphaned Blocks: 

Detached or Orphaned blocks are valid blocks which are not part of the main chain. They can occur naturally when two miners produce blocks at similar times or they can be caused by an attacker (with enough hashing power) attempting to reverse transactions. This happens when two miners or pools find a solution to the hash puzzle at the same time or close to each other. Then both parties with validly have found a block, so therefore both parties will have to race to find the next block after this and usually it is the party with more hashing power thus making it more likely to find the solution. So the party who finds the next block first and has the longest chain wins and gets to add both blocks to the chain and the losing party will have to admit defeat and it will be an orphaned block. 



## Bits to Target conversion:

23 bytes = 23 x 8 bits
			   = 23 x 2 x 4 bits
			   = 23 x 2 x Hex Digits = 46 Hex Digits

The length of the number is described in the first two digits of the bits in hex in this case 17. 

![IMG_20190926_180328](C:\Users\Sven Daneel\Desktop\IMG_20190926_180328.jpg)







# <u>Transactions Intuition</u>

There isn't actually a balance value in a blockchain only transactions and UTXO's
An Unspent Transaction [Output](https://bitcoin.org/en/glossary/output) ([UTXO](https://bitcoin.org/en/glossary/unspent-transaction-output)) that can be spent as an [input](https://bitcoin.org/en/glossary/input) in a new transaction. When it gets spend in a new transaction it will get killed from my UTOX list and whomever received my bitcoins it is now their new UTOX.

![IMG_20190926_185307](C:\Users\Sven Daneel\Desktop\IMG_20190926_185307.jpg)

Fees constitute the difference between a transactions inputs and Outputs. Anything that is unused is given to the miner and that's how you can choose what fee you want to pay. 



## How Wallets work:

The Wallet calculates your total UTXO and adds it up. 

For public key/ private key demo

https://tools.superdatascience.com/blockchain/public-private-keys/signatures



## Segregated Witness (SegWit):

A normal transaction has the transaction hash from, to, amount, Signature and public key. The Signature and public key  which is called the sciptSig amount to about 60 % of the data from the transaction even though it is not the important part it just adds to extra security measures. so what SegWit does it strips away this and sends it through its own messaging service on the network but still be linked to the transaction. So by doing this we can add way more transactions into a block. So SegWit increases network throughput and speed by being able to add more transactions and reducing the amount of data being sent with the transaction.



## Public key vs Bitcoin Address:

![IMG_20190926_195214](Blockchain A-Z/IMG_20190926_195214.jpg)









# <u>Smart Contract Intuition:</u> 



## Ethereum: 

Ethereum's vision is to build a world super computer that is interconnected with each other and decentralised. 

## **Smart Contracts**:

Smart Contracts are programs running on the Ethereum Blockchain. Solidity is the programming language to write smart contracts on Ethereum, Ethereum is Turning-Complete which means that any logic can be coded in Solidity. So instead of adding just transactions as data in the blocks mined we can add Smart Contracts into the data field of the Ethereum blocks. 
Each Ethereum Node has: 

1. History of all smart contracts.
2. History of all transactions. 
3. Current state of all smart contracts.

 link to Supply chain management: https://www.provenance.org/whitepaper

Intro into smart contracts: https://medium.com/free-code-camp/smart-contracts-for-dummies-a1ba1e0b9575

## Decentralized Applications (DAPPS): 

DAPPS contains an interface for people to connect with applications. You can think of the smart contract as the API for applications on the blockchain. 

## Ethereum Virtual Machine & Gas: 

Ethereum Virtual machine is running on your machine and and it acts like a virtual machine so this reduces security risk when it comes to viruses or accessing private files on your local machine. Nothing can get out of the virtual machine.
Another problem is infinitive loops how does Ethereum solve this problem? 
Here we introduce GAS, for any computation running on the blockchain the smart contracts need to pay a certain amount for running this application. So we have this Gas and we use the gas to pay for any calculation that we need to run. One can compare it as we rent the services Ethereum provides. 

## Decentralized Autonomous Organizations (DAOs):

If you look at a normal organisation and how it is governed, usually there is a hierarchy structure whereas the director is at the top and managers bellow him and employees below them. What is you could automate this with smart contracts and this is basically what DOAs are. By creating logic into the smart contract you can structure hierarchy and follow protocols with smart contracts that everything runs autonomous. This structure is designed to exclude human interaction. 

## DAO Attack:

the concept was to created a venture capital fund. it was stateless, it was crowdfunded in May 2016 for 150'000'000$. There was a code error in the smart contract and it was hacked for 50'000'000$ in June 2016. The problem was in the DAO code not Ethereum and this vulnerability was exploited. Here there was a dilemma "Code is law?" should it be able to change the rules of this smart contract. It ended up with a Hard fork and it ended up with a split in the blockchain. Thus creating ETH and ETC in the ETH version the money got returned to its owners and in the ETC version the hacker kept the money. 

Article to the DAO attack: https://www.bloomberg.com/features/2017-the-ether-thief/



## Soft & Hard Forks:  Hard Forks = loosen rules // Soft Forks = Tighten Rules

***Hard Fork:*** There is a new software upgrade to the blockchain which allows for certain things that weren't previously allowed. two examples were the DAO attack where ETH decided to reverse the transactions and ETC which didn't and thus creating a split in the blockchain in July 2016 at the block 1919999 and two different version of the chain continued. Anther example is BTC and BTH, BTC which introduced SEGWIT in July 2017 at the block 476768 everything went fine but a few developers were unhappy with this where BTH was an advocate to increasing block sizes and thus creating two separate chains that are the same until the fork occurred on 1. August 2017 at block 478558 and continue with each of their own versions of the blockchain. BTC had another hard Fork in October 2017 where some proponents were against mining with ASICs and Bitcoin Gold was created. In a hard fork if you own funds before the hard fork and the chain splits you will get funds equal to the funds you held before the fork in both chains. 

![IMG_20190928_160426](Blockchain A-Z/IMG_20190928_160426.jpg)



***Soft Fork:*** 

In terms of blockchain technology, a soft fork (or sometimes soft fork) is a change to the software protocol where only previously valid blocks/transactions are made invalid. Since old nodes will recognize the new blocks as valid, a soft fork is backward-compatible. This kind of fork requires only a majority of the miners upgrading to enforce the new rules, as opposed to a hard fork which requires all nodes to upgrade and agree on the new version.

![IMG_20190928_162916](Blockchain A-Z/IMG_20190928_162916.jpg)

In this scenario the miners that haven't upgraded yet find a block that is 0.9MB which isn't accepted by the majority of miners that already upgraded and therefore they will mine their own block at 0.5MB but since they have the majority they will most likely after some time has passed find blocks faster and mine another 0.5MB block and have a longer chain and thus the golden rule comes in with the longest chain wins. Therefore the old miners which haven't upgraded will adopt the other chain and create an orphaned block with the 0.9MB, by doing this it incentivises the old miners to start upgrading and follow the new rules proposed by the system or they will continuously lose out on orphaned blocks. 

## 









