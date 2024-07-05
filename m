Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6683D1E528
	for <virtio-comment@lists.linux.dev>; Fri,  5 Jul 2024 16:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720196259; cv=none; b=QUY2eJOXVyO27d8qHmvF6pXS2P4vrbw9qge2EQ1WCnWmg2gjtO6QsGnPAR0lz49Bw5fBtwFanlkspsylm2XioTReVB9aKa2353Fyl2TzCvU9amubuFSMym1RNbT+CpKsvNOyQWkK4SERbpzXRbTiktQzRrhGsx/J5wB2c7otWx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720196259; c=relaxed/simple;
	bh=/Vr3agW+rrN0oAGjuhXQNJiV1+YXMkSszDjT442U3TQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UKU4likvG9TLao5sGA7BiOc5AHcGvFxCKcGB29ePx1xXM+0Q/Qkar1+R5EEfCFyhVFzFp85eNYmptByAO2s4O2rSLS+nffLWB5bieR8cmKeSYZeKo+krzlL/AkPOSXXEh7uYIC3NZddKnk/0QRBTEgBjj/J63pMknKJLhafMs2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SHWL5ypN; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SHWL5ypN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/Vr3agW+rrN0oAGjuhXQNJiV1+YXMkSszDjT442U3TQ=; b=SHWL5ypNp7zknVsgJ2k6osJf/x
	ytjpQhGXtLLLptW7/YMHkzH5vMnbzjqVeMD3VPyrQKzCxCIJnNV/7hxYgpx5tbdf9ciJS1u16pRn+
	uWrn4Zgr9q1OSVEDgI76FEKMUYrKDbRcQy5UxEKgRlCD5Xhfke8sxO/q6aPbd+In6iP1nHDox6vxW
	0ma+9NowH/WpBaNtZfMCPaLw0SYcPqB40OUnUBWO6mFJ7Tcr4Qwu2l3Y14ehTz/6+T+iXYG0F2b/e
	BGtSFiz9g+emOU75HfBpHPWSkyJ3UniTo4grYfKE39BZhTeX+vk+3bF9nHzY54ukVUKEn/6DGLZ1/
	4yQMf/rg==;
Received: from [2001:8b0:10b:5:8c:9647:d9e0:cdb8] (helo=u3832b3a9db3152.ant.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPlcs-0000000489l-24Dc;
	Fri, 05 Jul 2024 16:17:34 +0000
Message-ID: <41c09f2bd37bd476ce9e1582cfca1d2ba16a1a59.camel@infradead.org>
Subject: Re: [RFC PATCH v4 5/5] virtio-rtc: Indicate leap seconds and clock
 performance
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Hilber <peter.hilber@opensynergy.com>, 
	virtio-comment@lists.linux.dev
Cc: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>, 
 Jason Wang <jasowang@redhat.com>, "Ridoux, Julien" <ridouxj@amazon.com>,
 "Luu, Ryan" <rluu@amazon.com>,  "Chashper, David" <chashper@amazon.com>
Date: Fri, 05 Jul 2024 17:17:33 +0100
In-Reply-To: <668b681a-8025-49eb-a75a-7dac4fff8b56@opensynergy.com>
References: <20240522170003.52565-1-peter.hilber@opensynergy.com>
	 <20240522170003.52565-6-peter.hilber@opensynergy.com>
	 <3935e6c2b4b73968d0c4728a3c1f429f121609e7.camel@infradead.org>
	 <668b681a-8025-49eb-a75a-7dac4fff8b56@opensynergy.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-FXmz/Fq3BV35F68YW4mw"
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-FXmz/Fq3BV35F68YW4mw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2024-07-05 at 10:12 +0200, Peter Hilber wrote:
> On 03.07.24 12:18, David Woodhouse wrote:
> > On Wed, 2024-05-22 at 19:00 +0200, Peter Hilber wrote:
> > > +VIRTIO_RTC_LEAP_PRE_POS resp.\ VIRTIO_RTC_LEAP_PRE_NEG pre-announce =
a
> > > +positive resp.\ negative leap second. Pre-announcing starts at the
> > > +earliest at the 17th day of the month including the leap second.
> >=20
> > Where does 17th come from? Is there an existing precedent for that?
> >=20
>=20
> It doesn't come from anywhere. I set it to the second half of the month t=
o
> disambiguate pre-announcing, in case a particular smearing algorithm woul=
d
> only start smearing on the day after the leap second (at the start of the
> month).

The day *after* the leap second shouldn't be considered "pre-
announcement", should it? Wouldn't that be another case for the
VIRTIO_RTC_LEAP_POST_{POS,NEG} that I requested? It is notification of
a leap second which occurred in the recent past, for which smearing
activity may still be ongoing.
>=20
> With the correction as per my above response, `leap` can already indicate
> this together with VIRTIO_RTC_FLAG_SMEAR. But as I discussed above, it
> might be better to use dedicated `leap` values for smearing.

Makes sense. At this point I think as long as we have the POST
indications I can align the shared structure with your method of
indicating leap seconds.

The pre-announcement of a leap second at the end of the month is hard
to consume within the PTP driver. At the end of the *day* is easy
enough as it's just a case of dividing by 86400. Months are a lot
harder, and involve knowledge of leap years and other complexity.

But if the complexity all falls in userspace, and we only expose that
"leap at end of month" pre-announcement to userspace and expect
userspace to work out *which* second that is and tell the kernel,
perhaps that's OK? I'm still a bit lost about how this will all work as
a leap second passes.

(The lazy part of me says that it's increasingly less likely that we'll
even *see* any more leap second before they're supposed to be abolished
within the next decade, so should we even bother? But that's probably
not a great approach).

> >=20
> > (I guess maybe a non-integer value of the tai_offset field might be
> > used to infer that, but I have concerns about that too, because surely
> > that can't be atomically read *with* a given clock pairing, and will be
> > constantly changing during the smearing period?)
>=20
> With a message-based clock read, the device should be able to calculate t=
he
> offset.=C2=A0

That's true. Makes me think that perhaps we should insist on only true
UTC being advertised as the "primary" clock, with that delta-to-smeared
value being exposed too, so that a consumer who wants that can add it.

It harmonises the message-based with the shared-memory approaches while
still allowing smeared time, which seems attractive?=20

> For SHM, the vmclock approach appears more suitable.

We do have atomicity of reads with the vmclock approach, by virtue of
the seq_count field. That's needed to ensure that a given TSC read is
*within* the time period where the absence of disruption is guaranteed.

What's hard is that the rate of change of TAI/UTC offset would have to
be indicated *separately*. And it might not be linear.

> >=20
> >=20
> > > +In field \field{flags}, VIRTIO_RTC_FLAG_SMEAR indicates whether a le=
ap
> > > +second would be, or is being, smeared into the clock, rather than be=
ing
> > > +inserted according to the UTC standard.
> >=20
> > "would be"... didn't we already indicate that with the clock type and
> > subtype? Perhaps we use this for "is being" and it resolves my above
> > concern?
>=20
> As discussed above, whether smearing is being done would be signaled by t=
he
> `leap` member.
>=20
> In the case of VIRTIO_RTC_CLOCK_MAYBE_SMEARED, VIRTIO_RTC_FLAG_SMEAR woul=
d
> still add extra information to distinguish smearing from not smearing (bu=
t
> as discussed above, the `leap` values might be extended to distinguish
> not smearing and smearing).

I'm not entirely clear on what the 'MAYBE' is for. It seems like a "I
found a clock lying on the floor and I'm advertising it to you but I
have no real idea if you can trust it when leap seconds happen; I don't
know if it smears or not. Maybe just don't trust it at all for a day or
so around a leap second, eh?"

If the producer doesn't *know* if it's smearing, how would it set the
SMEAR flag? And if the producer *does* know that it'll smear, why say
MAYBE?

The more I think about it, the more I hate that MAYBE case. I think
anyone advertising a precision clock probably ought to *know* how it's
going to behave!


> >=20
> > I think I'd also like to have a 'LEAP_POST_POS' and 'LEAP_POST_NEG'
> > flag which are set for a period of time *after* the occurrence of a
> > leap second. That's helpful for a client to be able to produce a
> > smeared clock when the device is exposing true UTC.
> >=20
>=20
> Ack.
>=20
> > > +A clock of subtype VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED can set
> > > +\field{leap} to VIRTIO_RTC_LEAP_NONE regardless of the clock's actua=
l
> > > +leap second state. For clocks of subtype
> > > +VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED, the VIRTIO_RTC_FLAG_SMEAR flag =
is
> > > +only guaranteed to be correct while \field{leap} is not
> > > +VIRTIO_RTC_LEAP_NONE.
> > > +
> > > +\subparagraph{TAI Offset}
> > > +
> > > +The \field{struct virtio_rtc_data_utc.tai_offset} field indicates th=
e
> > > +offset of the clock from the TAI standard, in the form
> > > +$\mbox{tai_offset} =3D \mbox{TAI} - \mbox{UTC}$. The offset unit is =
ns.
> > > +The offset is an integer multiple of a billion ns, i.e.\ corresponds=
 to
> > > +whole seconds, except while the clock is being smeared.
> >=20
> > There isn't any fundamental reason why this value can't be signed, is
> > there?
> >=20
>=20
> No, it is only that all current Virtio types are unsigned. Introducing a
> signed value might require extending the generic specification.
>=20
> > > +If flag VIRTIO_RTC_FLAG_SMEAR is set, and field \field{leap} equals
> > > +VIRTIO_RTC_LEAP_POS, or VIRTIO_RTC_LEAP_NEG, the offset from TAI doe=
s
> > > +not correspond to whole seconds.\footnote{This keeps the impact of t=
he
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0leap second insertion on t=
he UTC offset from TAI unambiguous for
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0every sample of \field{str=
uct virtio_rtc_data_utc}.}
>=20
> I think the above stipulation should be removed, it causes unnecessary
> limitations.
>=20
> >=20
> > See question above about the atomicity of this w.r.t any given clock
> > reading. Do we have to return this whole struct virtio_rtc_data_utc as
> > part of every clock reading?
> >=20
>=20
> The idea was to return struct virtio_rtc_data_utc with every
> VIRTIO_RTC_REQ_READ_CROSS message response (for UTC or smearing clocks), =
or
> to clear VIRTIO_RTC_FLAG_TAI_OFFSET. Supporting that message is not
> mandatory.

Aha, OK. That makes sense.

Do you have a public git tree with your latest versions of the virtio-
rtc specification as it evolves, and/or the Linux support?


--=-FXmz/Fq3BV35F68YW4mw
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQwNzA1MTYxNzMzWjAvBgkqhkiG9w0BCQQxIgQgCbxQCDRE
Qiotm0lfAGpEpHyFoYLAFLceaNwaanbaZzYwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgB5jwqO1bYQ8E9ajsjnBurq/Lwc5TALnOIa
Af15yZQB9WXkRJF3l2xm+46lvUU3br9rsNa1w7ISoPNOkt4qXRUDx1GeC2scrF2Qo0qplWQIIjnI
qfA4NLeVeTKU2aoykmQuqD5Rg6N3FJI618eVSzIyF1toKqcVLtvujwEkZuGbEFFqTznlScV10Ty0
RmCixHmqqSz77TGjrMMoks3/uKX0mwaeHSF9QJCa7FAyf+djbfmfyA/60hhLlNjKI/I4IVoTyMfT
kGzJxn3ocOIVOz5cbR+I7cnPErxraqD54bbjy3Dfca4YwtFUGEV/LK3cRSrzsKfx5eajRy6/9HLF
oMQZ4+s2Qiay/pth2BMffkU56fCrfay0gqQoM5FlIqWDLHirstbfudDe/9AM0Ls3t7qwSzZKq9CQ
MkrVh7ESVkmI3JMKpmG0m+If/e/0xRHGOCDIfJffJpHUL+gD94a0AUJhhQuFAadupHxhXCE8oYJO
FhK/8XNsl08ZUB1CBJyMn6/yqcpZ66V36UFhO6fOcZRKDkJpDRIVoIB+lGxk+9UmYyomdJG5pSoC
b3anoWzYepFTH4SlDWw4llHePL2ILHAbgo9aAOWvuacv5rufJz8VzJ3ihH+xiZti+m0Lq7ESAcd7
7q1VBYnQ6xpONa0vQ/wBJ1RLji09w36/TGrjjVUh8wAAAAAAAA==


--=-FXmz/Fq3BV35F68YW4mw--
