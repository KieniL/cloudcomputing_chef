# cloudcomputing
Kitchen testing on Windows


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


### Add recipes
Recipes are defined under /recipes/$filename$.rb
We used the an own cookbook file for each segment of the test.
an example. We need to add apt update since the ubuntu 18.04 
image does not allow installing without it.
For modifying index.html in nginx we need to create the 
index.html in our directory with:
**chef generate file index.html**
Now the file will be under files/index.html and can be modifed 
with normal HTML.

New Recipes should also be added to the Policyfile.rb
as a run_list

#### Attention ####
Please be aware that change the default recipe also means 
to change the recipename in the Policyfile.lock.json file

### Add tests
Tests are defined under 
/test/integration/$testname$/$testname$_$type$.rb
We created the three folder nginx, motd and user under test/ingegration.
You define the path for the test in the kitchen.yml


## Running Tests

With Kitchen it is possible to run automated tests or go through
each teststep manually

### Manually
At manual testing the instance needs to be created, 
then the recipe converged and at last the test verified.


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

HowTo from Web:
https://kitchen.ci/docs/getting-started/introduction/

