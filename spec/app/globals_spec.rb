describe App do
  it 'should properly link to root' do
    root = Pathname.new(File.expand_path('../../../', __FILE__))
    expect(App.root).to eq(root)
  end

  it 'should give the current environment' do
    expect(App.env).to eq(:test)
  end
end
