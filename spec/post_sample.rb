require 'net/http'

id = 'development'
imagedata = open('/Users/ktakahashi/Dev/r_gyazo/spec/factories/dummy-image.png',"rb").read
boundary = '----BOUNDARYBOUNDARY----'

data = <<EOF
--#{boundary}\r
content-disposition: form-data; name="id"\r
\r
#{id}\r
--#{boundary}\r
content-disposition: form-data; name="imagedata"; filename="gyazo.com"\r
\r
#{imagedata}\r
--#{boundary}--\r
EOF

header ={
  'Content-Length' => data.length.to_s,
  'Content-type' => "multipart/form-data; boundary=#{boundary}"
}

Net::HTTP.start('localhost',3000) do |http|
  res = http.post('/create',data, header)
end
