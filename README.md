# CMPT275-Anchor
# Git Info
1 Clone the repo
	`git clone https://github.com/lgair/CMPT275-Anchor.git`

2 Update the repo with your git credentials  so that you can push/pull/fetch without loging in everytime
	`git config credential.helper store`
	Then `git pull` enter username and password
	your credentials are now stored and you wont have to retype them

3 Git Workflow
	workflow chart: this will help us reduce the chance of breaking already working code and features
	
	Master (Remote)<------+Staging (Remote)
	      +                 ^      +
	      |                 |      |
	      |                 |      |
	      |     +-----------+      |
	      |     |                  |
	      v     +                  |
	Master (Local)                 |
	      +   ^                    v
	      |   +------------+Staging (Local)
	      v                        ^
	Developement Branch            |
	(Local)+-----------------------+
	
	- There are two main remote branches Master and Staging, Never push or update the remote master  		  branch unless the code you are pushing has been tested, and has been reviewed by at
	  least one other person.
	- Every time a new feature is to be developed make sure your local copy of the repo
	  is up do date with the current version of the code `git fetch` and `git pull`
	- Make your developement branch from your updated master branch on your local 
	  machine. `git checkout -b <NewBranchName>
	- Develop and test your feature
	- Merge your developement to your local staging branch
 	  `git checkout staging`, `git merge <DevelopementBranch>
	- Test
	- Update local master
	- Merger to local master
	- Push local master to remote staging `git push origin staging`
	- Delete old developement branch `git branch -D <DevelopementBranch>`
	- Final testing to be done using code from the remote staging branch
	- Once tested have someone review code (idk how pull requests work but
 	  something like that should be implemented)
	-merge remote staging to remote master.
	-Feature is done!
4 Making a commit
	when you make a commit you should always include a descriptive comment.

5 Some Usefull git commands that I like
	`git status`
		- Shows status of your branch
	`git add .`
		- Stages all files for commit
	`git log --oneline --decorate --all --graph` 
		- shows git history as a tree
	`git branch -a`
		- Shows all local and remote branches 
	`git merge <BranchName> --squash` 
		- if you have a branch with a bunch of small commits you can combine 
		  them all down to one commit with this command

