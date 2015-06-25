modules = ['shiritori',
           'network']

modules.each do |directory|
  path = "./#{directory}"
  Dir[File.expand_path(path, __FILE__) << '/*.rb'].each do |file|
    require file
  end
end