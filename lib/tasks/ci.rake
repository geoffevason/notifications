task :ci do
  system 'spring rspec'
  system 'spring cucumber'
end
