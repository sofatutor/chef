chef_client_trusted_certificate "self-signed.badssl.com" do
  certificate <<~CERT
-----BEGIN CERTIFICATE-----
MIIDeTCCAmGgAwIBAgIJAMtEwC/G1C5xMA0GCSqGSIb3DQEBCwUAMGIxCzAJBgNV
BAYTAlVTMRMwEQYDVQQIDApDYWxpZm9ybmlhMRYwFAYDVQQHDA1TYW4gRnJhbmNp
c2NvMQ8wDQYDVQQKDAZCYWRTU0wxFTATBgNVBAMMDCouYmFkc3NsLmNvbTAeFw0y
MjA4MTIxNTU5MTBaFw0yNDA4MTExNTU5MTBaMGIxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIDApDYWxpZm9ybmlhMRYwFAYDVQQHDA1TYW4gRnJhbmNpc2NvMQ8wDQYDVQQK
DAZCYWRTU0wxFTATBgNVBAMMDCouYmFkc3NsLmNvbTCCASIwDQYJKoZIhvcNAQEB
BQADggEPADCCAQoCggEBAMIE7PiM7gTCs9hQ1XBYzJMY61yoaEmwIrX5lZ6xKyx2
PmzAS2BMTOqytMAPgLaw+XLJhgL5XEFdEyt/ccRLvOmULlA3pmccYYz2QULFRtMW
hyefdOsKnRFSJiFzbIRMeVXk0WvoBj1IFVKtsyjbqv9u/2CVSndrOfEk0TG23U3A
xPxTuW1CrbV8/q71FdIzSOciccfCFHpsKOo3St/qbLVytH5aohbcabFXRNsKEqve
ww9HdFxBIuGa+RuT5q0iBikusbpJHAwnnqP7i/dAcgCskgjZjFeEU4EFy+b+a1SY
QCeFxxC7c3DvaRhBB0VVfPlkPz0sw6l865MaTIbRyoUCAwEAAaMyMDAwCQYDVR0T
BAIwADAjBgNVHREEHDAaggwqLmJhZHNzbC5jb22CCmJhZHNzbC5jb20wDQYJKoZI
hvcNAQELBQADggEBAKgnD+Ak7ttVfKvriYAsf4ttTYfOuyLfAr4hTTSXLN2u1ySD
fIpqSyeOkiEwfD5Bt7C/muEXEIyG/y6/C/ozb5JBvdd8c7zicLmaHtZtZbj4+H1b
/gqaBHuvWxiRR91bbgNaKsPMGCWiAvUt4/+y8z6xefUS+aKeFNhYjdwyFIr17j3Q
gxGpgCbYLLIoewP+Oj6xvZgGl6vj0xW9a4144xjFo1o1vqWkj+3IZGmnZ/jyznWd
5XzZCUaM9z6nn7NVxQZEelk885Q3oUxY96rRO+IUA8Vnk3iEtOdZPbNBaZwvgkfz
4vhvM8gKbdeeWoOAJDLzDZiDrUpKtIkBcLuJ7Cw=
-----END CERTIFICATE-----
  CERT
end

# see if we can fetch from our new trusted domain
remote_file ::File.join(Chef::Config[:file_cache_path], "index.html") do
  source "https://self-signed.badssl.com/index.html"
end
