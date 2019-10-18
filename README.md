# cloudcomputing
Chef Kitchen repository for UAS


For Kitchen you need Virtualbox, Chefdk and Vagrant installed.
You should have at least Powershell Version 3 installed on 
Windows.

## Installation of Chefdk on Windows
Install Chefdk from this 
link(https://downloads.chef.io/chefdk#windows)


## Installation of Virtualbox on Windows
Install Virtualbox from this 
link(https://www.virtualbox.org/wiki/Downloads)


## Installation of Vagrant on Windows
Install Vagrant from this 
link(https://www.vagrantup.com/downloads.html)






# You find our solution in this step and we describe a how 
# to do it self

## Kitchen setup

For the Kitchen testing we need several steps

1. Generate cookbook skeleton
2. Modify kitchen.yml
3. Add recipes
4. Add tests

After working through all these points it is possible to run the recipes and tests. (See Test section)

### Generate cookbook skeleton

Cookbook skeleton can be created with this command where $$ 
is a placeholder:
**chef generate cookbook $cookbookname$**

### Modify kitchen yml
The kitchen.yml can be found under <cookbookname>/kitchen.yml

The kitchen.yml defines which instances should be created 
(platforms-section).

It additionally defines the location for tests 
(inspectests-section).


This is an example kitchen.yml:
![Alt text](kitchen.yml_example.PNG?raw=true "Example kitchen.yml")

### Add recipes
Recipes are defined under /recipes/$filename$.rb
We used the default.rb in our solution

### Add tests
Tests are defined under 
/test/integration/$testname$/$testname$_$type$.rb
We used the default_test.rb under /test/integration/default
You define the path for the test in the kitchen.yml


## Running Tests

With Kitchen it is possible to run automated tests or go through
 each teststep manually

### Manually
This statement lists the instances defined in the kitchen.yml 
and also their current action status based on tests
**kitchen list**

This statement creates the instance
**kitchen create $suitename$-$platformname$**

The both statements below run the defined cookbooks
**kitchen converge**
or
**kitchen converge $suitename$-$platformname$**

This statement run the defined tests on the instance
**kitchen verify $suitename$-$platformname$**
### Automatic
**kitchen test**
or
**kitchen test $suitename$-$platformname$**

This statement creates the defined instances in the kitchen.yml 
and deletes them if they already exists.
It works through the cookbook and installs all defined packages.
Afterwards it tests your defined tests and output a statement.


# Additional Information
We had to reinstall the Policyfile.rb with 
**chef install ./Policyfile.rb** 
since we deleted the created subfolder from **chef generate**



HowTo from Web:
https://kitchen.ci/docs/getting-started/introduction/

