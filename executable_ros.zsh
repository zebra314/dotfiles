#!/bin/zsh

# >>> choose workspace >>>
folder_path="/home/alfonso/ROS"
workstations=($(ls "$folder_path"))
for ((i=1; i<=${#workstations[@]}; i++)); do
    echo "$(($i)). ${workstations[$i]}"
done

echo "Choose the number: \c"
read selection

if ! [[ $selection =~ ^[0-9]+$ ]] || [ "$selection" -lt 1 ] || [ "$selection" -gt "${#workstations[@]}" ]; then
    echo "error"
    exit 1
fi

selected_workstation="${workstations[$((selection))]}"
cd "$folder_path/$selected_workstation/"
echo "---------------------------------"
echo "$selected_workstation is choosed"
# <<< choose workspace <<<

# >>> Check ROS version of the chosen workstation
# Search for folders containing "/install"
version=1
install_folders=($(find $folder_path/$selected_workstation/ -type d -name "install"))
build_folders=($(find $folder_path/$selected_workstation/ -type d -name "build"))
devel_folders=($(find $folder_path/$selected_workstation/ -type d -name "build"))
if [ "${#install_folders[@]}" -gt 0 ] && [ "${#build_folders[@]}" -gt 0 ]; then 
    # ROS2 workspace contains install and build folder.
    version=2
elif [ "${#devel_folders[@]}" -gt 0 ] && [ "${#build_folders[@]}" -gt 0 ]; then 
    # ROS1 workspace contains devel and build folder.
    version=1
elif [ "${#devel_folders[@]}" -eq 0 ] && [ "${#build_folders[@]}" -eq 0 ]; then
    # DOCKER workspace contains either devel and install folder.
    version=0 
fi
# <<< Check ROS version of the chosen workstation

# Source the workspace
if [ "$version" -eq 1 ]; then

    # >>> Activate conda env
    ros_env="ros_noetic_env"
    conda activate $ros_env
    # <<< Activate conda env 

    source "$folder_path/$selected_workstation/devel/setup.zsh"

elif [ "$version" -eq 2 ]; then
    # !!If first build the workspace!!
    # You should run "source /opt/ros/humble/setup.bash" instead
    source "$folder_path/$selected_workstation/install/setup.zsh"

elif [ "$version" -eq 0 ]; then
    echo "Docker workspace or something else"
fi
