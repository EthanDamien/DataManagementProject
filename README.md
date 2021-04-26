# DataManagementProject
Rutgers Data Management class repo for Ethan Chang, Kevin Cubillos, Rachael Chin, David Lam

Group 107: David Lam, Ethan Chang, Kevin Cubillos, Rachael Chin

I. Create accounts of users; login, logout.

II. Auctions (Manual)
   [Rachael] seller creates auctions and posts items for sale x
	[Rachael] set all the characteristics of the item x
	[Rachael] set closing date and time x
        	[Rachael] set a hidden minimum price (reserve) x
    [Ethan and Kevin] a buyer should be able to bid x
	    [Ethan] let the buyer set a new bid x
	    [Kevin] alert other buyers of the item that a higher bid has been placed x
  [Kevin and Ethan] define the winner of the auction 
	[Kevin and Ethan] when the closing time has come, check if the seller has set a reserve x
	    [Kevin] if yes: if the reserve is higher than the last bid none is the winner. x
	    [Ethan] if no: whoever has the higher bid is the winner x
		[Kevin] alert the winner that they won the auction x

III Auctions (Automatic)
    [Ethan] a buyer should be able to set an automatic bidding x
	[Ethan] set a secret upper limit x
	[Ethan] set a bid increment (put in the database a higher bid automatically for the user in       
       case someone bids higher) x
    	[Kevin] alert buyers in case someone bids more than their upper limit  x
   [Kevin and Ethan] define the winner of the auction
	[Kevin] when the closing time has come, check if the seller has set a reserve x
	    [Kevin] if yes: if the reserve is higher than the last bid none is the winner. x
	    [Ethan] if no: whoever has the higher bid is the winner x
		[Kevin] alert the winner that they won the auction x


IV Browsing and advanced search functionality
    [Rachael] let people browse on the items and see the status of the current bidding x
    [Rachael] sort by different criteria (by type, bidding price etc.) x
    [Rachael] search the list of items by various criteria. x
    [Rachael] a user should be able to: 
	[] view all the history of bids for any specific auction x
    	[Ethan] view the list of all auctions a specific buyer or seller has participated in x
	[] view the list of "similar" items on auctions in the preceding month (and auction information about them) x
    [Ethan and David] let user set an alert for specific items s/he is interested x
	[Ethan and David] get an alert when the item becomes available x

V Admin and customer rep functions
      [David] Admin (create an admin account ahead of time)
	[David] creates accounts for customer representatives
    	[David] generates sales reports for:
		[David] total earnings
		[David] earnings per:
	    		[David] item
	    		[David] item type
	    		[David] end-user
    		[David] best-selling items
   		[David] best buyers

      [David] Customer representative functions:
	[David] users browse questions and answers
	[David] users search questions by keywords
	[David] users post questions to the customer representatives (i.e. customer service)
	[David] reps reply to user questions
	[David] edits and deletes account information
	[David] removes bids 
	[David] removes auctions 


