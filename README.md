#Docu-Mentor:

![Build Status](https://codeship.com/projects/1e824bc0-e4ad-0133-1a57-724c43b6c1d3/status?branch=master)
![Code Climate](https://codeclimate.com/github/N8Goodman/docu_mentor.png)
![Coverage Status](https://coveralls.io/repos/N8Goodman/docu_mentor/badge.png)

###Overview:

If you would like to play around with the admin functionality, please sign in as the guest_admin:
  email: admin@documentor.com
  password: password
  (Please be respectful!)

An application designed to stream-line complex work-flows. (Think applying for a loan or applying to college.) Any process with multiple stages can be created.

Administrators are able to create process templates and define the multiple(sequential) stages that are necessary for completion. They can then create the individual requirements for each stage to define what a user must do to complete a stage and move on with the process.

Users are able to start a process working from stage to stage by uploading documents and fulfilling the necessary requirements of each stage.

In a real world-application, administrators would be able to review a stage when it is submitted, and either accept the stage as complete, or send feedback with the any needed changes.

####Technologies Utilized:

* Ruby on Rails (Back-end)
* PostgreSQL (Database w/ ActiveRecord)
* Javascript and AJAX (Front-End)
* jQuery Sortable and DropzoneJS (User Experience Enhancement)


####Next Features to Implement:

1. Email Notifications:
  * Admins are notified when a stage is submitted for review
  * Users are notified when a stage is accepted or rejected
2. Email Packaging:
  * When a stage is submitted for review, admins will be able to easily export the files into a nested folder system, allowing the files to be emailed to any relevant parties
React Integration:
3. When creating a process, Admins will be able to drag and drop available stages directly into the procedure.
  * Similarly, when creating stages, Admins will be able to drag and drop stages onto process.
4. One Page Process Creation:
  * The entire process creation functionality will be done on one page with the ability to directly add stages to a process and documents to a stage.
