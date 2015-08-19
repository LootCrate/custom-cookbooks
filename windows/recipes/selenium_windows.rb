selenium_node 'selenium_node' do
  username 'Administrator' if platform?('windows')
  password 'iGyq$WYcu@i' if platform?('windows')
  capabilities [
    {
      browserName: 'chrome',
      maxInstances: 5,
      seleniumProtocol: 'WebDriver'
    },
    {
      browserName: 'internet explorer',
      maxInstances: 1,
      seleniumProtocol: 'WebDriver'
    }
  ]
  action :install
end