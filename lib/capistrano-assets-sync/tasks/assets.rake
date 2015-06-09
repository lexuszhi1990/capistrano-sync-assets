namespace :assets do
  desc 'Synchronize your remote assets using local assets'
  namespace :push do
    puts 'push'
  end

  desc 'Synchronize your local assets using remote assets'
  namespace :pull do
    puts 'pull'
  end
end
