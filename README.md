# Introduction
* Setup a version control environment for the on going work that's occuring in the vCloud Director, PowerCLI and REST API automation work for Aurion Web Build. 

# Getting Started
To get started with this piece of work the following requirements need to be met. 
* Install Visual Studio Community 2017
* Install the latest version of PowerCLI for vCloud
    * Once done, install the Module into PowerShell by running the following command using elevated privilages: Get-Module –ListAvailable VM* | Import-Module
* Install the PowerShell toolkit for Visual Studio found here: https://marketplace.visualstudio.com/items?itemName=AdamRDriscoll.PowerShellToolsforVisualStudio2017-18561
* If your machine works behind a proxy, create a System Environment variable called gitconfig, target the below file as the destination:
	* C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer\Git\mingw32\etc\gitconfig 
		* Edit this file
			* Under '[http]' add the following:
				* proxy = http://squids.citec.com.au:3128
				* The formatting is important here, use a tab (not spaces) to indent the line so it lines up with the line above that starts with 'sslCAinfo'
				* NB: this config is apparently lost any time Visual Studio Community is updated so this may need to be repeated
 * Install Git for Windows if not already installed, use all of the default settings unless you're weird and like Vi over Nano... insert flame war
	* Set global proxy settings, launch Git (if you search for Git in your Start Menu it should launch a dedicated terminal for Git, or launch it using Cmder or your preferred terminal of choice
        * git config --global http.proxyhttp://squida.citec.com.au:3128
    * Create the HTTP_PROXY system envrionment variable on your host - HTTP_PROXY = squida.citec.com.au:3128
# Build and Test
* The basics from Git\Visual Studio apply when moving changes between different branches 
	* I recomend using at least two Non-Prodiction tiers, in my instance I use Dev, UAT and the master branch
* Use Merge to move your changes from the lesser branches into other branches (e.g. Dev -> UAT), useful for when you edit a higher branch in error (e.g. edit your local Master branch)
* Once you've made a change to your code, use commit to commit the changes to your local branch
	* Once you've commited your changes, you can push the files from your local branch to the remote branch on Visual Studio Team Services (VSTS) 
	* You can use Pull, to pull remote changes from VSTS into your local branch if anyone else has made changes
		* To make changes to the Master branch, right click on the Master branch in your Team Explorer in Visual Studio and click 'Create Pull Request'
		* Your browser will open and here the master branch will be updated from (e.g. UAT) 
		* Enter a suitable title and Description for what's been changed in your code 
		* Select any items that your work is aligned to as appropriate
		* Click Create
		* Tag the users you want to peer review your code
		* Once two people have reviewed your commit (one of those people can be you), the 2nd reviewer can commit the change to the master branch

# Contribute
* TODO
If you want to learn more about creating good readme files then refer the following [guidelines](https://www.visualstudio.com/en-us/docs/git/create-a-readme). You can also seek inspiration from the below readme files:
- [ASP.NET Core](https://github.com/aspnet/Home)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Chakra Core](https://github.com/Microsoft/ChakraCore)
