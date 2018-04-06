RSpec.describe MultibancoIfthenpay do
  it "has a version number" do
    expect(MultibancoIfthenpay::VERSION).not_to be nil
  end

  context 'successfully generating new references' do
    it 'creates a new instance' do
      mb_instance = MultibancoIfthenpay::Multibanco.new '99999', '999', '1', 15
      expect(mb_instance.entity).to eq('99999')
    end

    it 'generates a new reference' do
      mb_instance = MultibancoIfthenpay::Multibanco.new '99999', '999', '1', 15
      expect(mb_instance.print_multibanco_reference).to eq('999000139')
      expect(mb_instance.print_multibanco_reference(prettify: true)).to eq('999 000 139')
    end

    it 'returns correct data' do
      mb_instance = MultibancoIfthenpay::Multibanco.new '99999', '999', '1', 15.4
      expect(mb_instance.entity).to eq('99999')
      expect(mb_instance.print_multibanco_reference).to eq('999000116')
      expect(mb_instance.order_value).to eq(15.4)
    end
  end

  context 'error generating new references' do
    it 'has invalid entity' do
      expect {
        MultibancoIfthenpay::Multibanco.new '9999', '999', '1', 15
      }.to raise_error ArgumentError
    end

    it 'has invalid sub-entity' do
      expect {
        MultibancoIfthenpay::Multibanco.new '99999', '', '1', 15
      }.to raise_error ArgumentError
    end

    it 'has invalid value' do
      expect {
        MultibancoIfthenpay::Multibanco.new '99999', '999', '1', 0.4
      }.to raise_error ArgumentError
    end
  end
end
