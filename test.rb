require "sqlite3"
DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true

require_relative "task"

# TODO: CRUD some tasks

# Read (One task)
task = Task.find(1)
puts "#{task.title} - #{task.description}"

# Create new task
task = Task.new([... ?]) # Arguments depending on what the students chose
task.save # Performing the CREATE action

puts task.id # The id of this new task, assigned automatically by SQLite

# Update an existing task
task = Task.find(1)
task.done = true
task.save

task = Task.find(1)
puts "#{task.done ? "[x]" : "[ ]"} #{task.title}"

# Read All(Many tasks)
tasks = Task.all
tasks.each do |task|
  puts "#{task.done ? "[x]" : "[ ]"} #{task.title}"
end

# Destroy(One task)
task = Task.find(1)
task.destroy

puts Task.find(1) == nil # Should output `true`
