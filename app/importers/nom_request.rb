require 'open-uri'

class NomRequest
  def self.xlsx_file(url = 'http://www.crt.org.mx/images/marcascertificadasdetequila04112014.xlsx')
    begin
      open(url)
    rescue OpenURI::HTTPError => error
      #ErrorMailer.error_email(error).deliver
      puts error
      raise
    end
  end
end
