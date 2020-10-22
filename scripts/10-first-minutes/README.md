
First 10 minutes on a server, as scripts
==========================================

Does pretty much everything as https://dbwebb.se/kunskap/github-education-pack-och-en-server-pa-digital-ocean#first10, so we don't need to do it manually.

Note! The scripts assume that you have added your ssh key to AWS and created the server with it. They are copied from the original user to the `deploy` user.



## Usage

1. Copy this folder to your server with:
    - `scp -i <path-to-keyfile> -r 10-first-minutes azureuser@<ip>:`

3. Login to the server:
    - `ssh -i <path-to-keyfile> admin@<ip>`

4. Change to root user with:
    - `sudo su`.

5. Enter the copied folder, edit variables in the scripts and execute the scripts in order.

6. Logout from the server and login again the `deploy` user. Then delete the `azureuser` user, `sudo userdel -r azureuser`.

7.  Profit!

Not you are ready to use your server!
