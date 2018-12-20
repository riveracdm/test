control "apache-installed" do
  impact 1.0
  title "Verificar que Apache instalado"
  desc "Primer requisito del rol, debe instalar Apache"
  describe package('httpd') do
   it { should be_installed }
  end
end

control "apache-started-enabled" do
  impact 1.0                                
  title "Verificar que apache está arrancado y que se arrancará al inicio del sistema"
  desc "Apache arrancado y en enabled"
  describe service('httpd') do
   it { should be_enabled }
   it { should be_running }
  end
end

control "apache-listens-80" do
  impact 1.0
  title "Verificar que Apache está escuchando en el puerto 80"
  desc "Apache debe escuchar en el puerto 80 en este test"
  describe port(80) do
   it { should be_listening }
  end
end

control "httpd-listen-80" do
  impact 1.0
  title "Verificar que en body, aparezxa hello world"
  desc "En el body del index, debe aparecer hello world"
  describe http('http://34.241.181.21:80') do
   its('body') { should match 'hello world' }
  end
end

