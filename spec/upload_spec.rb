describe 'Upload', :upload do
    
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/upload'
        @arquivo=Dir.pwd + '/spec/fixtures/treino.txt'
        @imagem = Dir.pwd + '/spec/fixtures/vegeta.jpeg'
    end
    it 'upload com arquivo texto' do
        attach_file('file-upload',  @arquivo)
        click_button 'Upload'

        div_arquivo = find('#uploaded-file')
        expect(div_arquivo.text).to eql 'treino.txt'
    end
    after(:each) do
        sleep 3
    end
    it 'upload de imagem', :uploadimage do
       attach_file('file-upload', @imagem)
       click_button 'Upload'

       div_arquivo = find('#uploaded-file')
       expect(div_arquivo.text).to eql 'vegeta.jpeg'
    end
end