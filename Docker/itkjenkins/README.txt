Starting an ITK Jenkins instance
================================

* run `build.sh` to create the Jenkins image
* run `run.sh` to start the Jenkins server
* Get admin temporary password
  - Read the output of `run.sh`. The initial admin password is printed
  in the output.
  - or run `docker exec itkjenkins more /var/jenkins_home/secrets/initialAdminPassword`
    (or `getSecret.sh` script).
* Open browser and connect to server. Don't forget the `https` in the address.
* Enter admin password.
* Click on "x" next to "Getting Started" to skip installation of plugins. The ones we need are already installed in the
docker image.
* Click on "Start using Jenkins"
* Click on 	Manage Jenkins"->"Configure Global Security"
* Select "Github Authentication Plugin"
* Make sure that Github Authentification is configured on https://github.com/organizations/InsightSoftwareConsortium/settings/applications
  Follow the instructions available here: https://wiki.jenkins.io/display/JENKINS/GitHub+OAuth+Plugin . Potentially disregard warning message
  about URL being incorrect.
* Under "Global GitHub OAuth Settings", enter
 - "Client ID"
 - "Client Secret"
* Save!
* Log out!
* Log back in
* Click on 	Manage Jenkins"->"Configure Global Security"
* Select "Role-Based Strategy"
* Save!
* In "Manage Jenkins"->"Manage and Assign Roles"
  - Manage Roles
  - Assign Roles:
    - group "authenticated" is for all authenticated users.
    - Use Github user names to add users to role (e.g. fbudin69500)

Backup/Sync
===========

* Run `createBackup.sh ${output_directory}`.
* Save archive on a safe hard drive.
* Expected tar file size: about 300MB

Recover
=======

* Install Jenkins by running `run.sh`.
* Stop jenkins during recovery process with `docker stop itkjenkins`.
* Update Jenkins to a version at least as recent as the backup.
* Restart Jenkins with `docker start itkjenkins`
* Stop Jenkins with `docker stop itkjenkins`
* Run `recoverBackup.sh ${my_backup_file}`
* The script will verify that the current version of Jenkins is more recent
than the version that was backed up. The version is read in `~/itkjenkins/war/META-INF/MANIFEST.MF`.
* Start jenkins with `docker start itkjenkins`.

Update Jenkins
==============

* Run `updateJenkins.sh latest` or `updateJenkins ${url}`
* Jenkins war files URL can be found [here](http://updates.jenkins-ci.org/download/war/)

Start and stop Jenkins
======================

* From the website UI, `https://my_url/restart` and press `YES`.
* Start container with `docker start itkjenkins`
* Stop container with `docker stop itkjenkins`

Additional information
======================

How to find plugin name for installation from list of plugins installed on Jenkins instance:
-Click on plugin in current ITKJenkins
-Click on 'on the plugin site'
-Click on 'GitHub →'
-Copy repo name and remove '-plugin'

Current ITK Jenkins server:
https://jenkinsitk.kitware.com/

Configuration files
===================

* Non-exhaustive list of configuration files in /tmp/itkjenkins
 - users/${USERNAME}/config.xml
 - config.xml
* Custom files
 - org.jenkinsci.plugins.configfiles.GlobalConfigFiles.xml

