Ruby-Saucelabs
==============

Command line tool for SauceLabs REST API.
* get job information
* get job results (log, flv, images)

SauceLabs doesn't provide api to know how many images in the result for now.
So this script counts images on the selenium-server.log.


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

