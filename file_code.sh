#!/bin/bash

default_directory="/mnt/c/Users/mohammed hassan/Desktop"
# directory="/mnt/c/Users/mohammed hassan/Desktop"
main="/mnt/c/Users/mohammed hassan/Desktop"
i="0"
while [ true ]
do

echo "========================================================================="
echo "-----------------------File Management System----------------------------"
echo "========================================================================="
echo "Welcome, The Main Menu is given below:"
echo "1- List all Files and Directories"
echo "2- Create New Files"
echo "3- Delete Existing Files"
echo "4- Rename Files"
echo "5- Edit File Content"
echo "6- Search Files"
echo "7- Details of Particular File"
echo "8- View Content of File"
echo "9- Sort File Content"
echo "10- List only Directories(Folders)"
echo "11- List Files of Particular Extension"
echo "12- Count Number of Directories"
echo "13- Count Number of Files"
echo "14- Sort Files in a Directory"
echo "15- Copy a File to another Directory"
echo "16- Remove a Directory"
echo "17- Move a File or Directory to another Location"
echo "18- Run Shell Script or C File"
echo "19- Banker's Algorithm"
echo "20- Producer-Consumer Code"
echo "21- partition and processes Code"
echo "0- Exit"
echo " "
echo "What action you want to Perform?" 
echo "Enter 0-21"

read opt1


cd "$default_directory"

if [ $opt1 == 19 ]
then
    gcc banker.c -o run 
    ./run

elif [ $opt1 == 20 ]
then
    gcc Producer_Consumer.c -o run 
    ./run

elif [ $opt1 == 21 ]
then
    gcc best_fit.c -o run 
    ./run

elif [ $opt1 == 0 ]
then
    echo "Good Bye.."
    echo "Successfully Exit"
    break

else

    echo "Enter path to directory (default is Desktop):"
    read user_directory

    # Set directory based on user input or default
    if [ -z "$user_directory" ]; then
        directory="$default_directory"
    else
        directory="$user_directory"
    fi

    # Navigate to the directory
    cd "$directory"

    # Handle different options here...
    # Insert your existing menu options and commands here...

    if [ $opt1 == 1 ]
    then
    echo "List all files and Directories here.."
    echo "Showing all files and directories...."
    sleep 3
    echo "Loading.."
    sleep 3
    echo "-------------------------------OutPut------------------------------------"
    ls
    echo " "

    elif [ $opt1 == 2 ]
    then
    echo "Create New Files here.."
    echo "Which type of file you want to create !"
    echo "1- .c"
    echo "2- .sh"
    echo "3- .txt"
    echo "Enter your choice from 1-3"
    read filechoice

    if [ $filechoice == 1 ]
    then
    echo "Enter File Name without .c Extension"
    read filename
    touch "$filename.c"
    echo "-------------------------------OutPut------------------------------------"
    echo "File Created Successfully"
    echo " "

    elif [ $filechoice == 2 ]
    then
    echo "Enter File Name without .sh Extension"
    read filename2
    touch "$filename2.sh"
    echo "-------------------------------OutPut------------------------------------"
    echo "File Created Successfully"
    echo " "

    elif [ $filechoice == 3 ]
    then
    echo "Enter File Name without .txt Extension"
    read filename3
    touch "$filename3.txt"
    echo "-------------------------------OutPut------------------------------------"
    echo "File Created Successfully"
    echo " "

    else
    echo "Invalid Input..Try Again."
    echo " "
    fi

    elif [ $opt1 == 3 ]
    then
    echo "Delete existing files here.. "
    echo "Enter name of File you want to Delete!"
    echo "Note: Please Enter full Name with Extension."
    read delfile
    echo "-------------------------------OutPut------------------------------------"

    if [ -f "$delfile" ];
    then
    rm "$delfile"
    echo "Successfully Deleted."
    echo " "

    else
    echo "File Does not Exist..Try again"
    echo " "
    fi

    elif [ $opt1 == 4 ]
    then
    echo "Rename files here.."
    echo "Enter Old Name of File with Extension.."
    read old
    echo "Checking for file..."
    sleep 3

    if [ -f "$old" ];
    then
    echo "Ok File Exist."
    echo "Now Enter New Name for file with Extension"
    read new
    mv "$old" "$new"
    echo "Successfully Rename."
    echo "Now Your File Exist with $new Name"

    else
    echo "$old does not exist..Try again with correct filename."
    fi
    echo " "

    elif [ $opt1 == 5 ]
    then
    echo "Edit file content here.."
    echo "Enter File Name with Extension : "
    read edit
    echo "-------------------------------OutPut------------------------------------"
    echo "Checking for file.."
    sleep 3

    if [ -f "$edit" ];
    then
    echo "Opening file.."
    sleep 3
    vim "$edit"
    # gedit "$edit"
    echo " "

    else
    echo "$edit File does not exist..Try again."
    fi

    elif [ $opt1 == 6 ]
    then
    echo "Search files here.."
    echo "Enter File Name with Extension to search"
    read f
    echo "-------------------------------OutPut------------------------------------"

    if [ -f "$f" ];
    then
    echo "Searching for $f File"
    echo "File Found."
    find . -name "$f"
    # find /home -name "$f"
    echo " "

    else
    echo "File Does not Exist..Try again."
    echo " "
    fi

    elif [ $opt1 == 7 ]
    then
    echo "Detail of file here.."
    echo "Enter File Name with Extension to see Detail : "
    read detail
    echo "-------------------------------OutPut------------------------------------"

    echo "Checking for file.."
    sleep 4
    if [ -f "$detail" ];
    then
    echo "Loading Properties.."
    stat "$detail"

    else
    echo "$detail File does not exist..Try again"
    echo " "
    fi

    elif [ $opt1 == 8 ]
    then
    echo "View content of file here.."
    echo "Enter File Name : "
    read readfile
    echo "-------------------------------OutPut------------------------------------"
    if [ -f "$readfile" ]
    then
    echo "Showing file content.."
    sleep 3
    cat "$readfile"

    echo "Do you want to search for specific sentences? (yes/no)"
    read search_option

    if [ "$search_option" == "yes" ]
    then
    echo "Enter the sentence to search for:"
    read search_sentence
    echo "-------------------------------OutPut------------------------------------"
    grep "$search_sentence" "$readfile"
    fi

    else
    echo "$readfile does not exist"
    echo " "
    fi

    elif [ $opt1 == 9 ]
    then
    echo "Sort files content here.."
    echo "Enter File Name with Extension to sort :"
    read sortfile
    echo "-------------------------------OutPut------------------------------------"
    if [ -f "$sortfile" ];
    then
    echo "Sorting File Content.."
    sleep 3
    sort "$sortfile"

    else
    echo "$sortfile File does not exist..Try again."
    echo " "
    fi

    elif [ $opt1 == 10 ]
    then
    echo "-------------------------------OutPut------------------------------------"
    echo "List of all Directories here.."
    echo "showing all Directories..."
    echo "Loading.."
    sleep 3
    ls -d */
    echo " "

    elif [ $opt1 == 11 ]
    then
    echo "List of Files with Particular extensions here.."
    echo "Which type of file list you want to see?"
    echo "1- .c"
    echo "2- .sh"
    echo "3- .txt"
    echo "Enter your choice from 1-3"
    read extopt
    echo "-------------------------------OutPut------------------------------------"

    if [ $extopt == 1 ]
    then
    echo "List of .c Files shown below."
    echo "Loading.."
    sleep 3
    ls *.c

    elif [ $extopt == 2 ]
    then
    echo "List of .sh Files shown below."
    echo "Loading.."
    sleep 3
    ls *.sh

    elif [ $extopt == 3 ]
    then
    echo "List of .txt Files shown below."
    echo "Loading.."
    sleep 3
    ls *.txt

    else
    echo "Invalid Input..Try again.."
    echo " "
    fi

    elif [ $opt1 == 12 ]
    then
    echo "-------------------------------OutPut------------------------------------"
    echo "Total number of Directories here.."
    echo "Loading all directories.."
    sleep 3
    echo "Counting.."
    sleep 3
    echo "Number of Directories are : "
    # echo */ | wc -w
    ls -l | grep -c '^d'
    echo " "

    elif [ $opt1 == 13 ]
    then
    echo "-------------------------------OutPut------------------------------------"
    echo "Total Numbers of Files in Current Directory here.."
    echo "Loading all files.."
    sleep 3
    echo "Number of Files are : "
    ls -l | grep -v 'total' | grep -v '^d' | wc -l
    echo " "

    elif [ $opt1 == 14 ]
    then
    echo "-------------------------------OutPut------------------------------------"
    echo "Sort Files here.."
    echo "Your Request of Sorting file is Generated."
    echo "Sorting.."
    sleep 3
    ls | sort
    echo " "

    elif [ $opt1 == 15 ]
    then
    # cd 
    echo "Copy a File to another Directory"
    read -p "Enter file name to copy: " file_to_copy
    if [ -f "$file_to_copy" ]
    then
    read -p "Enter destination directory: " destination_dir
    if [ -d "$destination_dir" ]
    then
    cp "$file_to_copy" "$destination_dir"
    echo "-------------------------------OutPut------------------------------------"
    echo "File copied successfully."
    else
    echo "Destination directory not exist.." 
    echo " " 
    fi 
    else 
    echo "file not exist.."
    echo " "
    fi

    elif [ $opt1 == 16 ]
    then
    # cd
    echo "Remove a Directory"
    read -p "Enter directory name to remove: " dir_to_remove
    if [ -d "$dir_to_remove" ]
    then
    rm -rf "$dir_to_remove"
    echo "-------------------------------OutPut------------------------------------"
    echo "Directory '$dir_to_remove' removed successfully."
    else 
    echo "Directory not exist.."
    echo " "
    fi

    elif [ $opt1 == 17 ]
    then
    # cd
    echo "Move a File or Directory to another Location"
    read -p "Enter file/directory name to move: " move_item
    if [ -e "$move_item" ]
    then
    read -p "Enter destination directory: " destination_dir
    if [ -e "$destination_dir" ]
    then
    echo "-------------------------------OutPut------------------------------------"
    mv "$move_item" "$destination_dir"
    echo "File/directory moved successfully."
    else
    echo "File/directory not found.."
    echo " "
    fi
    else 
    echo "Destination directory not found.."
    echo " "
    fi

    elif [ $opt1 == 18 ]
    then
    echo "Run Shell Script or C File"
    read -p "Enter file name to run with extension: " file_to_run
    echo "-------------------------------OutPut------------------------------------"
    if [ -f "$file_to_run" ]; 
    then
    if [[ "$file_to_run" == *".sh" ]]; 
    then
    bash "$file_to_run"
    elif [[ "$file_to_run" == *".c" ]]; 
    then
    gcc "$file_to_run" -o run
    ./run
    else 
    echo "Invalid input.."
    echo " "
    fi
    else 
    echo "file not exist.."
    echo " "
    fi

    # elif [ $opt1 == 19 ]
    # then
    # gcc banker.c -o run 
    # ./run


    # elif [ $opt1 == 20 ]
    # then
    # gcc Producer_Consumer.c -o run 
    # ./run


    # elif [ $opt1 == 21 ]
    # then
    # gcc best_fit.c -o run 
    # ./run



    # elif [ $opt1 == 0 ]
    # then
    # echo "Good Bye.."
    # echo "Successfully Exit"
    # break

    else
    echo "Invalid Input..Try again...."
    fi
fi
cd "$main"
i=$[$i+1];
done
