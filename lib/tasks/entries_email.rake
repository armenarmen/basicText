task :send_entries => :environment do
  desc "Gets users that have been updated, ie are 'real'"
  users = User.where("created_at <> updated_at")
  puts "task called"
  users.each do |a|
    puts "#{a.name}: #{a.email}"
    UserMailer.entries_email(a)
  end
end

task :test_thing => :environment do
  UserMailer.welcome_email(User.first)
end