# lib/tasks/custom_tasks.rake
namespace :custom do
    desc "This is a custom task"
    task :hello do
      puts 'Hello from a custom task!'
    end
  end
  