# Reads AWS cridentials from clipboard, formats them and inserts to file. Keeping the file encrypted after.
# Should work with WSL or bash environments where xclip is installed.
# Put ansible cridentials in a config file and add to ENV to avoid the need to input password all the time.
# Need dos2unix installed. Might not be needed on a Linux computer.

if [ -x "$(command -v powershell.exe)" ]; then
    copied_text=$(powershell.exe Get-Clipboard)
else
    copied_text=$(xclip -o)
fi

ansible-vault decrypt aws_keys.yml
echo "$copied_text" | dos2unix | sed -e '1s/^/---\n/' -e 's/\[default\]//' -e 's/access_key=/key=/' -e 's/key_id/key/' -re 's/(key|token)=(\w)/\1: \2/g' > aws_keys.yml
ansible-vault encrypt aws_keys.yml
