namespace :deploy do
    desc 'Create Database'
    task :db_create do
      on roles(:db) do |host|
        with rails_env: fetch(:rails_env) do
          within release_path do
            execute :bundle, :exec, :rake, 'db:create'
          end
        end
      end
    end
end

before 'deploy:migrate', 'deploy:db_create'