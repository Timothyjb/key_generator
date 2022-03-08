class CsrCreater
  attr_accessor :private_key,
                :csr,
                :country,
                :state,
                :city,
                :organization,
                :department,
                :common_name,
                :email

  def call()
    request = OpenSSL::X509::Request.new
    request.version = 0
    request.subject = OpenSSL::X509::Name.new([
      ['C',             country,      OpenSSL::ASN1::PRINTABLESTRING],
      ['ST',            state,        OpenSSL::ASN1::PRINTABLESTRING],
      ['L',             city,         OpenSSL::ASN1::PRINTABLESTRING],
      ['O',             organization, OpenSSL::ASN1::UTF8STRING],
      ['OU',            department,   OpenSSL::ASN1::UTF8STRING],
      ['CN',            common_name,  OpenSSL::ASN1::UTF8STRING],
      ['emailAddress',  email,        OpenSSL::ASN1::UTF8STRING]
    ])
    request.public_key = key.public_key
    request.sign(key, OpenSSL::Digest::SHA1.new)

    @private_key = key.to_s
    @csr = request.to_s
    self
  end

  private

  def key
    @key ||= OpenSSL::PKey::RSA.new 2048
  end


end
