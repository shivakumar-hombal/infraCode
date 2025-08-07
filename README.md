Prerequisites: A fully configured Jenkins server to run docker commands.

Steps to config Jengins Job to auto trigger docker image build:
1. Click on "New Item".
2. Enter Name and choose Freestyle project.
3. In job config, select below options.
    a. General -> GitHub project -> github url.
    b. Source Code Management -> Git -> set the repo and branch.
    c. Triggers -> "GitHub hook trigger for GITScm polling".
    d. Post-build Actions -> Build other projects -> (project-name).
