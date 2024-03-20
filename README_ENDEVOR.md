# Code/Build/Debug Challenge
# Main Scenario
## Getting Started

1. Login the workshop system using the given URL, username and password
2. You are in the secure cloud environment which runs VS Code and is connected to the Mainframe
3. Make sure the initial build process has successfully completed. (**exit code: 0** message in the active terminal)
4. Close the terminal from it's right top corner

## Run the DOGGOS application - Getting used to the app
1. Go to Zowe Explorer (Z icon in the VS Code Activity Bar)
2. Hover the “zosmf” item in the DATA SET section in the sidebar and click on the magnifier icon
3. Fill in data set: CUST0xy.PUBLIC to add all data sets with this prefix to Zowe Explorer (Use your user id number instead CUST0xy) 
4. Expand the CUST0xy.PUBLIC.JCL data set and right click on the RUNDOG
5. Select “Submit Job” menu item, then click "Submit" from the pop-up window
6. Click on the JOB number in the pop up message in the right bottom corner to see the JOB output (if notification disappears, you can hit the bell icon from the bottom-right corner to see)
7. Expand the “RUNDOG(JOBxxxxx)” and click on the RUN:OUTREP item to browse the program output (Repeat 6th step if you cannot expand the job output)
8. Breeds those are not specified in the COBOL code, fall into the OTHER section in the execution report. Now, your task is adding one more breed to the program, so we can print it in this report

## Get DOGGOS application from the PROD environment

1. Go to Explorer for Endevor extension from the activity bar
2. Wait the initializing process to be completed

<img src='images/endevor/end5.png' width='30%'>

3. Expand **endevor** and **endevor-location** wait for fetching the elements (connection and location settings have already been pre-configured prior the workshop)

4. Fetching the elements will result in a warning due to your empty dev sandbox

5. Map the changes from the prod environment using the up-arrow

![Paste](images/endevor/end10.png)

6. Now you have all of the DOGGOS application in your cloud VS Code IDE.

7. Find the COBOL code associated with your user under the [MAP] folder by expanding as shown below

8. Right click, select edit and start coding to add a new dog breed.

<img src='images/endevor/end11.png' width='25%'>

## Edit&Build the DOGGOS application

1. Copy block of code (lines 59-61)
2. Paste it after line 61 (You can use CTRL+G to jump into the given line number)
3. Change JINGO to another dog breed name (e. g. **HUSKY**) in the whole pasted block of code
4. For HUSKY-INDEX-VALUE change VALUE to 9  (line 63)
5. For OTHER-INDEX-VALUE change VALUE to 10 (line 66)
6. Change PIC 9(1) to PIC 9(2) for OTHER-INDEX-VALUE (line 66)
7. Change OCCURS value to 10 (line 71)
8. Copy block of code (lines 208-210)
9. Paste it after line 210
10. Change JINGO to the dog breed name you picked in step 3 (**HUSKY**) within the pasted block of code
11. Copy block of code (lines 139-142)
12. Paste it after line 142
13. Change JINGO to the dog breed name you picked in step 3 (**HUSKY**) within the pasted block of code
14. Use CTRL+S (or COMMAND+S) to save the changes and bring the file to your sandbox
15. A prompt will ask for the Endevor path to upload the cobol element. Hit enter to approve the pre-filled value

<img src='images/endevor/end14.png' width='35%'>

16. Add your mainframe username as CCID, and add a change comment (e.g 'new breed added').

17. Select **Yes** from the list to generate the object modules

<img src='images/endevor/end14-2.png' width='40%'>

18. Wait for upload&fetch elements

## Link the DOGGOS application

1. Expand the LNK folder, find the element associated with your user under the [MAP] folder, right click and select edit

<img src='images/endevor/end16.png' width='25%'>

2. Without any edit, use CTRL+S (or COMMAND+S) to bring the file to your sandbox
3. A prompt will ask for the Endevor path to upload the link element. Hit enter to approve the pre-filled value
4. Add your mainframe username as CCID, and add a comment (e.g 'bring link element').
5. Select **Yes** from the list to generate the load modules

<img src='images/endevor/end16-2.png' width='30%'>

6. Wait for upload&fetching elements
7. Collapse the [MAP] folders to see your edited LINK element
8. At this step your Explorer for Endevor tab would look like the following:

<img src='images/endevor/end17.png' width='30%'>

## Run the DOGGOS application AFTER the change is made

1. Go to Zowe Explorer (Z icon in the VS Code Activity Bar)
2. Hover the “zosmf” item in the DATA SET section in the sidebar and click on the magnifier icon.
3. Click on the CUST0xy.PUBLIC.INPUT data set  to edit it
4. Add the following line with the name of the dog breed you chose in the code change (**HUSKY**)

![Change](images/image06.png)

5. Use CTRL+S (or COMMAND+S) to save the change
6. Expand the CUST0xy.PUBLIC.JCL data set and right click on the **NDRUNDOG**
7. Select “Submit Job” menu item, then click "Submit" from the pop-up window
8. Click on the JOB number in the pop up message in the right bottom corner to see the JOB output
9. Expand the “NDRUNDOG(JOBxxxxx)” and click on the RUN:OUTREP item to browse the program output (Repeat 8th step if you cannot expand the job output)

The new dog breed “HUSKY” is listed and the counter reports 11 adopted HUSKY dogs. 🎉

## Debug

1. Let’s introduce a bug in the program data 🙂 Go to the input file again and change the breed from “JINGO” to “JINGA”.
2. Use CTRL+S (or COMMAND+S) to save the change
3. Rerun the application repeating the steps in the previous section (from 6th step) 
4. Open the output file and see that report is wrong, it now contains 0 for JINGO and 6 for the OTHER
5. Let’s debug the program
6. Go to debugger extension by clicking the play icon with a bug

<img src='images/endevor/end19.png' width='30%'>

7. We already have the debugging session preconfigured for DOGGOS application, make sure you choose the one for Endevor from the dropdown

<img src='images/endevor/end20.png' width='30%'>

7. Hit the green play icon to start debugging.
8. You will be asked for your Mainframe password. It is the same as your  mainframe userID. Now the debugger will fetch the extended source and start the session.
8. Now where to put a breakpoint?
9. The report for JINGO breed was wrong, so let’s put a breakpoint where the value is updated. Let’s find the first place in the code by searching for JINGO with Ctrl+F (CMD+F on Mac).
10. We can see that processing for JINGO breed is handled by these variables.
11. Let’s find all instances where JINGO-BREED-NAME by right-clicking on it, selecting Peek> Peek references. Go through the referenced to find where the amount is updated. It will be here around line 240 in extended source. Put a break point here by clicking before the line number.
12. Close the peek references pop-up.
14. The value for OTHER breeds was wrong in the repo. Let’s put there a breakpoint as well
That would be on line 246
15. We now have 2 breakpoints (you can see them in breakpoints section in the bottom left corner):

![Paste](images/endevor/end22.png)

16. Now let’s continue the execution by clicking the play button on the left of the debug toolbar:

<img src='images/endevor/end21.png' width='30%'>

17. We can see that while looping through the breeds the debugger has skipped the breakpoint on line 240 and stopped at line 246

<img src='images/endevor/end23.png' width='40%'>

18. Let’s check the variables. Click on the INP-DOG-BREED, right click and “Add to watch” (line 217)

<img src='images/endevor/end24.png' width='30%'>

19. Do the same for the INP-ADOPTED-AMOUNT variable on line 219 to understand which breed we are analyzing

20. You can see in your watch section the value of the variables (BTW, a quick way is just to hover over a variable name in your extended source and the value will pop up)

<img src='images/image18.png' width='30%'>

21. As you can see we have encountered a wrong breed name “JINGA”, which means that our input file is corrupted! We also never entered a section for the JINGO breed, which means we never actually encountered this breed while parsing.

22. Now we found our problem - wrong breed in the input file :)

23. Stop the debug session by clicking the stop icon from the debugging toolbar.

![Paste](images/endevor/end25.png)