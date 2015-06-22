task :send_entries => :environment do
  desc "Gets users that have been updated, ie are 'real'"
  users = User.where("created_at <> updated_at")
  puts "task called #{users.count}"
  users.each do |a|
    puts "#{a.name}: #{a.email}"
    UserMailer.delay.entries_email(a)
  end
end


task :kill_fake_accts => :environment do
  desc "destroys users that aren't real"
  User.where("updated_at = created_at").where(name: nil).destroy_all
end