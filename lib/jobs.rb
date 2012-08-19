require File.dirname(__FILE__) + '/restbase'
require 'fileutils'

module RubySauce
  class Jobs < SauseLabsRestBase
    SERVER_LOG = "selenium-server.log"
    SERVER_FLV = "video.flv"
    SERVER_IMG = "%04dscreenshot.png"

    def jobs_path(options)
      if(options.has_key? :id)
        "jobs/#{options[:id]}"
      elsif options.has_key? :full
        "jobs?full=#{options[:full]}"
      else
        "jobs"
      end
    end

    def list(full = false)
      if(full)
        get_json "jobs?full=true"
      else
        get_json "jobs"
      end
    end

    def job(id)
      get_json "jobs/#{id}"
    end

    def get_log(id)
      get_result("jobs/#{id}/results/#{SERVER_LOG}" )
    end

    def get_flv(id)
      get_result("jobs/#{id}/results/#{SERVER_FLV}" )
    end

    def get_images(id,max)
      imgs = []
      (0..max).each do |i|
        imgs << get_result("jobs/#{id}/results/#{SERVER_IMG}"%i)
      end
      imgs
    end

    def results(id,dest_dir = FileUtils.pwd )
      log = get_log(id)
      open(dest_dir + "/#{SERVER_LOG}","w") do |f|
        f.puts log
      end

      flv = get_flv(id)
      open(dest_dir + "/#{SERVER_FLV}","wb") do |f|
        f.write flv
      end

      pngs = log.scan(/(\d+)\.png/).flatten.map do |a| a.to_i end
      imgs = get_images(id,pngs.max)
      pngs.each do |i|
        open(dest_dir + "/#{SERVER_IMG}" % i,"wb") do |f|
          f.write imgs[i]
        end
      end
    end
  end
end
