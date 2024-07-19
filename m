Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166FD6EB7D
	for <virtio-comment@lists.linux.dev>; Fri, 19 Jul 2024 08:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721378475; cv=none; b=jH/AmrKKqGk8mux5K/QOl83LElCKC+mtwRU2chgoTtTRvwThWKkDSAxg7LfkH/x1EXJlvirWZ7n4uLHWZ0QhcfSlplq6eWKGD/dmWWPDJxearSgpyVA5+pUuD+ku82z1tb076EOxHgobQS089pUzT24BfvziG0QtcxcBxHFuZz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721378475; c=relaxed/simple;
	bh=6ga1XfsciETDlyrKa1E/iiGa9ITddCOTMPo0DeF0uG0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h5SQDifbcg7TmUrJKIxCIelGuXfqdNhXzQj84nQ2ASSFfQG4UmXF7n3PZvY/us9CX8mL22TLSv1/YeezOBnEBq5rlJd6BZff9jFkk+F5qFfcTxWrT3E3ijGx9yw8HNfrT0GNpOOv8zfiqw0Oi7frKtSbXsJT0vBjOr9wjd1znyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NTDVP8Tr; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NTDVP8Tr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6ga1XfsciETDlyrKa1E/iiGa9ITddCOTMPo0DeF0uG0=; b=NTDVP8TrgQusVUw6+6f5vRBbum
	siIc5Bww18kWd2E0jwhslYUyZzT4w94wX+ci7F25ONKwfAbTGKJWYMrQdnPUsLtAAglsQCN7j6Vfl
	CycebvruqGXJXx5Wyo5/o30LEMwjbjI4zGPbOCgHPj6MKFWXkNagOtoPIqD3h7fWwc69fpphG322l
	WjBkz5fcdEidtZ/xKDQi2Vqvs5DWvz/Dq9WnM5xx+uxltEdEMgdcjXhs1EBK4AxjMJJGLYh/I/6ez
	yh3d5x9dAzLjoVay604Add4F5aadLF4vUA6/chHcNmRjHJmP+KtTTLdqFo64Wo3BatS0XkFHIuVmw
	S1g9hWkA==;
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=freeip.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjAi-00000002qJa-1atQ;
	Fri, 19 Jul 2024 08:41:00 +0000
Message-ID: <b9ee8fadb55b4124a34bb9e6736390c470661ac5.camel@infradead.org>
Subject: Re: [RFC PATCH v4 5/5] virtio-rtc: Indicate leap seconds and clock
 performance
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Hilber <peter.hilber@opensynergy.com>, 
	virtio-comment@lists.linux.dev
Cc: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>, 
 Jason Wang <jasowang@redhat.com>, "Ridoux, Julien" <ridouxj@amazon.com>,
 "Luu, Ryan" <rluu@amazon.com>,  "Chashper, David" <chashper@amazon.com>
Date: Fri, 19 Jul 2024 09:40:59 +0100
In-Reply-To: <16892c87-c527-4a98-9546-9ddbbfd062ca@opensynergy.com>
References: <20240522170003.52565-1-peter.hilber@opensynergy.com>
	 <20240522170003.52565-6-peter.hilber@opensynergy.com>
	 <3935e6c2b4b73968d0c4728a3c1f429f121609e7.camel@infradead.org>
	 <668b681a-8025-49eb-a75a-7dac4fff8b56@opensynergy.com>
	 <41c09f2bd37bd476ce9e1582cfca1d2ba16a1a59.camel@infradead.org>
	 <20483787-62df-4ca6-868f-71b4d4898323@opensynergy.com>
	 <b1645fa81d693b899430f7210ae1cab7d28dbc1e.camel@infradead.org>
	 <85c93b42-41a2-42c4-a168-55079bbfff71@opensynergy.com>
	 <04b017a0bc97700ad1e6770c2c3d458d2f25708e.camel@infradead.org>
	 <16892c87-c527-4a98-9546-9ddbbfd062ca@opensynergy.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-vxvran81Drg7ns/QNDXf"
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-vxvran81Drg7ns/QNDXf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2024-07-19 at 10:18 +0200, Peter Hilber wrote:
> On 17.07.24 10:32, David Woodhouse wrote:
> > On Tue, 2024-07-16 at 13:55 +0200, Peter Hilber wrote:
> > > On 11.07.24 12:18, David Woodhouse wrote:
> > > > Thanks for the continuing feedback, Peter. Since it's only changes =
to
> > > > comments, I won't post a whole new version; I've pushed the followi=
ng
> > > > changes to the git tree.
> > > >=20
> > > > I believe I understood correctly that you're amenable to adding the
> > > > VIRTIO_RTC_POST_ values? And I think the other part of the discussi=
on
> > > > about exposing ongoing smearing via this field does not affect its
> > > > usage in SHM?=20
> > >=20
> > > I will add the VIRTIO_RTC_POST_ values. But I think for the leap seco=
nd
> > > smearing case I would also add more values, like
> > >=20
> > > #define VIRTIO_RTC_LEAP_NONE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00
> > > #define VIRTIO_RTC_LEAP_PRE_POS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0x01
> > > #define VIRTIO_RTC_LEAP_PRE_NEG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0x02
> > > #define VIRTIO_RTC_LEAP_POS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x03
> > > #define VIRTIO_RTC_LEAP_POST_POS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x04
> > > #define VIRTIO_RTC_LEAP_POST_NEG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x05
> > > #define VIRTIO_RTC_LEAP_SMEAR_PRE_POS=C2=A0=C2=A0 0x06
> > > #define VIRTIO_RTC_LEAP_SMEAR_PRE_NEG=C2=A0=C2=A0 0x07
> > > #define VIRTIO_RTC_LEAP_SMEAR_POS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x08
> > > #define VIRTIO_RTC_LEAP_SMEAR_NEG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x09
> > > #define VIRTIO_RTC_LEAP_SMEAR_POST_POS=C2=A0 0x0A
> > > #define VIRTIO_RTC_LEAP_SMEAR_POST_NEG=C2=A0 0x0B
> > >=20
> > > So maybe the VIRTIO_RTC_LEAP_NEG definition could be removed from vmc=
lock.
> > > The other changes would not be relevant to vmclock.
> >=20
> > Almost makes me want to suggest that the _SMEAR_ values should have
> > constant offset of 0x8 from the corresponding values without the SMEAR,
> > as if we're treating SMEAR as a *flag* bit.
> >=20
> > That could be useful as it would indicate that the time returned by
> > this mechanism is not actually UTC.
> >=20
>=20
> Only VIRTIO_RTC_LEAP_SMEAR_POS and VIRTIO_RTC_LEAP_SMEAR_NEG would indica=
te
> that the time is actually smeared, the rest is just pre-/post-announcemen=
t.
>=20
> But if you think it's useful, I could still have all the
> VIRTIO_RTC_LEAP_SMEAR_ indications have the 0x08 bit and offset.

My thought was that the 0x8 bit would be the simplest indication that
the time is not UTC, so including the pre/post announcements *outside*
the smearing period would be less useful for that? But that's just a
thought; do with it what you feel best.


> > > >=20
> > > > With this, I think we're at a point where I can seriously propose t=
his
> > > > be adopted into your virtio-rtc specification? Do you have that in =
a
> > > > public git tree that I can work from to provide an actual patch?
> > > >=20
> > >=20
> > > I am sorry, but I think I will not be able to publish a specification
> > > update until I go on vacation. I will be back in the week of August 5=
th.
> >=20
> > Have fun! I'm already on vacation this week, but I haven't yet seen any
> > of my colleagues engage with this thread, so I'm having to do it
> > myself.
> >=20
> > > > We need it to be explicitly little-endian, of course, but I conside=
r
> > > > that an implementation detail. Likewise the signedness of the
> > > > tai_offset field, which *can* be expressed (albeit creatively) with=
in
> > > > the constraints of the existing virtio definitions.
> > > >=20
> > > > It's versioned anyway, so as long as it looks *reasonable* I'd like=
 to
> > > > go ahead and submit the ACPI version of it to QEMU and the kernel (=
and
> > > > obviously also ship it in the hypervisor that pays my bills), in th=
e
> > > > expectation that *if* it did need further revision before the final
> > > > publication of the virtio-rtc specification, that should be feasibl=
e.
> > > > But the *intent* is that it doesn't need to change, of course.
> > > >=20
> > > > Are you happy with that in concept?
> > >=20
> > > Some of the bit widths and defines do not match at the moment. I thin=
k it
> > > might be worth to align those (from vmclock-abi.h):
> > >=20
> > > - counter_id vs u16
> > > - VMCLOCK_COUNTER_INVALID
> > > - time_type vs u16
> >=20
> > Deployment timelines aside (I may or may not have used the current
> > proposed version in an internal-only release for widespread full-stack
> > testing...), I suppose I have no fundamental aversion to expanding
> > those to 16-bit. Although we have about *three* possible values for
> > each of them right now. I can't see how we'll ever get past about a
> > dozen counters, and with smearing in a separate subtype I can't see how
> > we get any more values of time_type either. A single byte really ought
> > to suffice, surely? Can we stick with u8?
>=20
> OK.
>=20
> >=20
> > But we do have a couple of bytes of pad[] so if you feel strongly, we
> > could use the two bytes after version for one of them, and the two
> > bytes of pad[] for the other.
> >=20
> > I quite liked keeping those as constant fields above the seq_count
> > though.
> >=20
> > I'd like to have VMCLOCK_COUNTER_INVALID added please; I meant to point
> > that out explicitly. We need a way to indicate that there is *no* valid
> > time being exposed through this structure and that it is *only* for
> > indicating disruption (which is the most critical thing for now). And
> > even if there's a separate flag for that, putting an explicit counter
> > ID into the field would still seem wrong.
> >=20
> > I'll be happiest if any changes we make do remain compatible, for
> > "disruption only" mode, with an implementation which gives 0xFF and
> > 0x00 in the current counter_id and time_type bytes. Maybe we make that
> > counter_id and use 0x00FF as VMCLOCK_COUNTER_INVALID?
> >=20
> >=20
>=20
> OK.
>=20

Did you just say OK to two different alternatives? Can we take the
first; just stick with u8 for both fields as we'll never need any more?

--=-vxvran81Drg7ns/QNDXf
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQwNzE5MDg0MDU5WjAvBgkqhkiG9w0BCQQxIgQgjUWPPSZd
CTR7Ea2POw5Z8H0luXvUCpjoEQVhwXkFvh0wgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgCylFJ9wc/Cy9OPywb/lKCErUMHH7IUQzLG
Zjcz0ubRw9c1p8tUfqGx39htBqjMz+sqo+UjKnrXUeusSWttwmfDNoGD3LAAEZY0fhha49WL4zKA
1oZvoiFEFMXOsPR9cSa55ebwe4Gxsg+Vmanw62PZ3W262Gv17WBhW1dxg7Nekg6NTKOjHO1qCquL
GAIEd0sQRqZGhzGhE+gxieXhQCIM2N7ucoauGNkabQasqvOSy7rd1dwt9CNEPbzEY/2pHSjJv8oH
AfivLfo79Ued3j7HqTr13RVyJB0fE/lmKfuNnzONJaaMxkfcenEZYRf51sMoaTJjBZq6RbTxETI4
FRXRG4zR5RbgjWkU2wfgata9hwC23ls9/YU0YfmfHlOmGl7vW8/LhaiVkECiqo4z0yjQhzRNEj6N
7B6y29Uf98PG6YhkF1I/V9+jjZejIlsLEZwP1gRUYQt/nnWF4r/2rjt2lb02DSDNXC+11H2oBiR4
oolW354IGgL4gEv20PiqulR+9JtKxd4bnSqmykQuWZtyjRBMEm/CdFk2t7fDYihDbmzUs/wNyJ81
oRb2D7O8dsISVviSfrbZsqq2tnWsrYwBaoKothY/9VH2QcSrquK8brp+Jryd/MMXBmS6d0V/MI9G
0Z1W+tuAwZy+72PKa1tOKL4dtLykztkmkSEA8IiLdwAAAAAAAA==


--=-vxvran81Drg7ns/QNDXf--
