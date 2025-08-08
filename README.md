# Lab Condition Instructions

## Task: 
1.) Generate a sequence of even or odd numbers up to 20
2.) Find the largest number among five integer numbers. Use initialized variables, and the
output goes to the largest un-initalized variable.

## Flowchart

[Flowchart](docs/diagram.jpeg)

## Challenges Faced During the Lab

### Phase 1: Planning
At this point in my ASM journery I feel like I have solid understanding of the fundamentals
required to complete this task. For the first tasks I knew that I had to create variables both 
initialized and un-initialized to eventually store the largest of 5 variables and to store the 
sequence of odds number from 1 - 20. After this I began constucting the `sequence` block where all 
of the main logic is. I followed the same basic structure for the second task. The only differnce
is for this task the goal is to push the largest of three numbers by using `cmp` operation. Both
task blocks end with a standard print and exit. 

### Phase 2: Implementaiton
This stage was a bit tricky but I was able to call upon the knowledge I've gained from this course
to implement each task seasmlessly. I didn't use a function approach for the ASCII conversion for 
both tasks. I implemented it by hand twice using the same structure. For the first task I made sure
to store an initial value of 0 in the `al` register, which would be the register that is used to 
convert the current value into ASCII, and increment the `cl` register which is used to keep track of
which digit we are currently on in the sequence. 

### Phase 3: Debugging
Throughout the process of writing the program I used gdb to debug the steps for the ASCII conversion. 
I had a little trouble keep tracking of the proper index's using the `edx` register whhich is what
I mainly used gdb to keep track of. An interesting problem that I ran into was keeping track of the
spaces that I imbedded after each ASCII value was printed to the console. I did this because I
wanted the digits to print to the console in a stacking format instead of a single line holding
every digit. 

