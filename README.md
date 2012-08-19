Ruby-Saucelabs
==============

Command line tool for SauceLabs REST API.
* get job information
* get job results (log, flv, images)

INSTALL
=======
  $ rake gem
  $ gem install --local rubysauce

USAGE
=====
   # list jobs
   $ sauce-jobs list

   # get detailed job information
   $ sauce-jobs job [job-id]

   # get job results
   $ sauce-jobs results [job-id]

