module Capistrano
  class FileNotFound < StandardError
  end
end

namespace :solr do

  desc "start solr sunspot server"
  task :start do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "sunspot:solr:start"
        end
      end
    end
  end

  desc "stop solr sunspot server"
  task :stop do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          begin
            execute :rake, "sunspot:solr:stop"
          rescue Exception => e
            puts "No pid is running"
          end
          execute "rm -rf #{current_path}/solr"
        end
      end
     execute "ps -ef | grep solr | grep -v grep | awk '{print $2}' | xargs kill || echo 'no process with name solr found'"
    end
  end

  desc "reindex the whole database"
  task :reindex do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "sunspot:solr:reindex"
        end
      end
    end
  end

  desc "start & reindex and stop solr and start again  ( for manual use )"
  task :restart do
    on roles(:app), in: :sequence, wait: 3 do
      %w[stop start reindex].each { |task| invoke "solr:#{stop}" }
    end
  end

end