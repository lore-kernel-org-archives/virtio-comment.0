Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A7F13DDC3
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720001922; cv=none; b=rGriWFpH+BetRPO/58sucUiGgHpkgfY6hghacoOk4Odgf9dcxByWFV6ZC+578SJHnkQnYjahLOBIjy5LGkp21LZm5sTnXCm+ENMtvhhj5TqzV/WUSamT8qlgGr37/bdtyVTyvlu7t8zUS9KPSDjzHy6vrvbEz3JEhAwqHQq7Ltw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720001922; c=relaxed/simple;
	bh=CD/mCFIg8ytcTf6v86VuEycNg2PSf/z9JqJmRt2mwmw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kSOarv2y6mJPPgBSf+2maA/efSZZXoJBqmi9tB6S4RIzEh1B27OQaxmSusbfXuBiajdJvNF/VhBY15POpYzpuPBrYx/YNG2eyI1deo+u4Stwj0RZyi14ypkSgNXySdENEZwn42Wa+wkI0HipR9zLbTkNrPnh93sWm0hJV7cQLmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=q8uT+uXM; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="q8uT+uXM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JYYRSGR+mfbCcetosbwmGNbAmq3woHHIOM1XGoyF2H4=; b=q8uT+uXMKcOrIayjqduiTR5FGk
	ywscLvdxul06WykYqZDgSZSWSJBKAYCvZtu/hmFcibULERD+SDQz0hefuSWdNEIxP+rDZHi2Q80ni
	Guaq+qJFdfLwqqTZgNMVtYRdLtXCV7Jfwn1yeyj4O9J7pA5f7CY7mCLcnLamFXvdqHgpEqrRtdaby
	1IHXwnfbcsPoP6+3fNrM9Ua1em7mPwRjQ3s8BE8yzyIu4DXNopbJ4UaJB4rmcdxYcFK+q11PPCKyV
	zE0uJ0Yuq8nzufZadi80dWqYlqIiqs0ZXasForzL1qOROjtIME3mC3fgfuj9EAIKDaIc/wraF2/g2
	OlyGlyxQ==;
Received: from [2001:8b0:10b:5:c274:66b2:6bbc:35da] (helo=u3832b3a9db3152.ant.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOx4L-00000001iZd-07hL;
	Wed, 03 Jul 2024 10:18:33 +0000
Message-ID: <3935e6c2b4b73968d0c4728a3c1f429f121609e7.camel@infradead.org>
Subject: Re: [RFC PATCH v4 5/5] virtio-rtc: Indicate leap seconds and clock
 performance
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Hilber <peter.hilber@opensynergy.com>, 
	virtio-comment@lists.linux.dev
Cc: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>, 
 Jason Wang <jasowang@redhat.com>, "Ridoux, Julien" <ridouxj@amazon.com>,
 "Luu, Ryan" <rluu@amazon.com>,  "Chashper, David" <chashper@amazon.com>
Date: Wed, 03 Jul 2024 11:18:32 +0100
In-Reply-To: <20240522170003.52565-6-peter.hilber@opensynergy.com>
References: <20240522170003.52565-1-peter.hilber@opensynergy.com>
	 <20240522170003.52565-6-peter.hilber@opensynergy.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-S7QBFxFJH9h8D4nsQU0o"
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-S7QBFxFJH9h8D4nsQU0o
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2024-05-22 at 19:00 +0200, Peter Hilber wrote:

> +This section describes reusable data structures.

I would like to reuse them! Or at least the VIRTIO_RTC_LEAP_xxx values.


> +
> +\paragraph{UTC Specific Data}\label{sec:Device Types / RTC Device / Devi=
ce Operation / Data Structures / UTC Specific Data}
> +
> +For clocks of type VIRTIO_RTC_CLOCK_UTC, the device reports information
> +about impending and ongoing UTC leap seconds, and about the current UTC
> +offset from TAI, through \field{struct virtio_rtc_data_utc}. This
> +information applies to the clock reading to which the struct is
> +associated to.
> +
> +\begin{lstlisting}
> +struct virtio_rtc_data_utc {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0le64 tai_offset;
> +#define VIRTIO_RTC_LEAP_NONE 0
> +#define VIRTIO_RTC_LEAP_PRE_POS 1
> +#define VIRTIO_RTC_LEAP_PRE_NEG 2
> +#define VIRTIO_RTC_LEAP_POS 3
> +#define VIRTIO_RTC_LEAP_NEG 4
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 leap;
> +#define VIRTIO_RTC_FLAG_SMEAR (1 << 0)
> +#define VIRTIO_RTC_FLAG_TAI_OFFSET (1 << 1)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 flags;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 reserved[6];
> +};
> +\end{lstlisting}
> +
> +\subparagraph{Leap Second Indication}
> +
> +For subtype VIRTIO_RTC_SUBTYPE_STRICT, the \field{struct
> +virtio_rtc_data_utc.leap} field indicates whether a positive or negative
> +leap second will be introduced at the end of the month resp.\ whether a
> +leap second is currently in progress.
> +
> +For a leap smearing clock, the \field{leap} field indicates whether a
> +leap smear will start around the next turn of the month resp.\ whether
> +the leap second is currently being smeared into the clock.
> +
> +VIRTIO_RTC_LEAP_NONE indicates that the clock is currently not
> +performing leap second related processing, and also not pre-announcing
> +an impending leap second.
> +
> +VIRTIO_RTC_LEAP_PRE_POS resp.\ VIRTIO_RTC_LEAP_PRE_NEG pre-announce a
> +positive resp.\ negative leap second. Pre-announcing starts at the
> +earliest at the 17th day of the month including the leap second.

Where does 17th come from? Is there an existing precedent for that?

> +For VIRTIO_RTC_SUBTYPE_STRICT, VIRTIO_RTC_LEAP_POS indicates that a
> +positive leap second is in progress.

The term "in progress" confused me for a while, as a leap second is an
instantaneous jump. Do I understand this correctly... a UTC clock might
progress as follows (100ms intervals):

 1483228798.8 LEAP_PRE_POS
 1483228798.9 LEAP_PRE_POS
 1483228799.0 LEAP_POS
 1483228799.1 LEAP_POS
 1483228799.2 LEAP_POS
 1483228799.3 LEAP_POS
 1483228799.4 LEAP_POS
 1483228799.5 LEAP_POS
 1483228799.6 LEAP_POS
 1483228799.7 LEAP_POS
 1483228799.8 LEAP_POS
 1483228799.9 LEAP_POS
 1483228799.0             =E2=86=90 jumps back by 1s
 1483228799.1

So if the second 1483228799 repeats itself due to a positive leap
second, your VIRTIO_RTC_LEAP_POS "in progress" flag is set during the
1st occurrence of that second, and not the 2nd occurrence?


> +For a leap smearing clock, VIRTIO_RTC_LEAP_PRE_POS resp.\
> +VIRTIO_RTC_LEAP_PRE_NEG indicate that the clock is currently slowed down
> +resp.\ sped up in order to smear the leap second into the clock.

Hm, is this consistent with your earlier statement that PRE_POS/PRE_NEG
can be set from the 17th day of the month? Because it isn't true that
the clock "is currently slowed down" for all of that time, right?

I think we might want a separate flag to indicate that smearing *is*
currently in progress, and that the time reported is not UTC.

(I guess maybe a non-integer value of the tai_offset field might be
used to infer that, but I have concerns about that too, because surely
that can't be atomically read *with* a given clock pairing, and will be
constantly changing during the smearing period?)


> +In field \field{flags}, VIRTIO_RTC_FLAG_SMEAR indicates whether a leap
> +second would be, or is being, smeared into the clock, rather than being
> +inserted according to the UTC standard.

"would be"... didn't we already indicate that with the clock type and
subtype? Perhaps we use this for "is being" and it resolves my above
concern?

I think I'd also like to have a 'LEAP_POST_POS' and 'LEAP_POST_NEG'
flag which are set for a period of time *after* the occurrence of a
leap second. That's helpful for a client to be able to produce a
smeared clock when the device is exposing true UTC.

> +A clock of subtype VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED can set
> +\field{leap} to VIRTIO_RTC_LEAP_NONE regardless of the clock's actual
> +leap second state. For clocks of subtype
> +VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED, the VIRTIO_RTC_FLAG_SMEAR flag is
> +only guaranteed to be correct while \field{leap} is not
> +VIRTIO_RTC_LEAP_NONE.
> +
> +\subparagraph{TAI Offset}
> +
> +The \field{struct virtio_rtc_data_utc.tai_offset} field indicates the
> +offset of the clock from the TAI standard, in the form
> +$\mbox{tai_offset} =3D \mbox{TAI} - \mbox{UTC}$. The offset unit is ns.
> +The offset is an integer multiple of a billion ns, i.e.\ corresponds to
> +whole seconds, except while the clock is being smeared.

There isn't any fundamental reason why this value can't be signed, is
there?

> +If flag VIRTIO_RTC_FLAG_SMEAR is set, and field \field{leap} equals
> +VIRTIO_RTC_LEAP_POS, or VIRTIO_RTC_LEAP_NEG, the offset from TAI does
> +not correspond to whole seconds.\footnote{This keeps the impact of the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0leap second insertion on the U=
TC offset from TAI unambiguous for
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0every sample of \field{struct =
virtio_rtc_data_utc}.}

See question above about the atomicity of this w.r.t any given clock
reading. Do we have to return this whole struct virtio_rtc_data_utc as
part of every clock reading?

I wonder if we'd do better to keep the UTC=E2=86=90=E2=86=92TAI offset as a=
n integer,
and also expose a fractional offset of a given clock reading from UTC,
if that's the intent?

> +The \field{tai_offset} field is interpreted as a signed integer in
> +little-endian, two's complement, representation.
> +
> +In field \field{flags}, VIRTIO_RTC_FLAG_TAI_OFFSET indicates that the
> +TAI offset is valid. The device may only clear this flag for clocks of
> +subtype VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED.
> +
> +\paragraph{Clock Performance Information}\label{sec:Device Types / RTC D=
evice / Device Operation / Data Structures / Clock Performance Information}
> +
> +The \emph{clock performance} describes the difference between clock
> +readings obtained by the driver from the device, and clock readings
> +obtained from an ideal clock. Through \field{struct virtio_rtc_perf},
> +the device reports the clock performance. \field{struct virtio_rtc_perf}
> +describes the performance of a particular clock reading obtained by the
> +driver.
> +
> +\begin{lstlisting}
> +struct virtio_rtc_perf {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0le64 freq_max_error;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0le64 freq_est_error;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0le64 phase_max_error;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0le64 phase_est_error;
> +#define VIRTIO_RTC_FLAG_SYNCHRONIZED (1 << 0)
> +#define VIRTIO_RTC_FLAG_FREQ_MAX_VALID (1 << 1)
> +#define VIRTIO_RTC_FLAG_FREQ_EST_VALID (1 << 2)
> +#define VIRTIO_RTC_FLAG_PHASE_MAX_VALID (1 << 3)
> +#define VIRTIO_RTC_FLAG_PHASE_EST_VALID (1 << 4)

Hm, the VMCLOCK structure doesn't have estimated error, only max error.
Should we add them? Julien? Ryan?

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 flags;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8 reserved[7];
> +};
> +\end{lstlisting}
> +
> +Flag VIRTIO_RTC_FLAG_SYNCHRONIZED in field \field{flags} indicates that
> +the device considers the clock synchronized as per the clock type and
> +clock subtype requirements. In case of VIRTIO_RTC_CLOCK_UTC, flag
> +VIRTIO_RTC_FLAG_SYNCHRONIZED also indicates that the clock is
> +synchronized w.r.t.\ the information in \field{struct
> +virtio_rtc_data_utc}, as per the clock subtype requirements.
> +

I ended up with status values as follows:

#define VMCLOCK_STATUS_UNKNOWN		0
#define VMCLOCK_STATUS_INITIALIZING	1
#define VMCLOCK_STATUS_SYNCHRONIZED	2
#define VMCLOCK_STATUS_FREERUNNING	3
#define VMCLOCK_STATUS_UNRELIABLE	4

I don't know if they came from an existing precedent or were just put
in as placeholders. Julien? Ryan?

--=-S7QBFxFJH9h8D4nsQU0o
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQwNzAzMTAxODMyWjAvBgkqhkiG9w0BCQQxIgQgX7SuOTM1
6dea9M7TcnzMAqYM7kSl7dhsZ6U8GNdTjTIwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgB6abiuZ8O2wubFaKelmgoGQIv9vS8RhLm4
4tQbrYg3R97R96481rxjctqsGrxJ1a+2v9yYqBDBMEQDNDxeU28ibMyoyyW936DpRIvNgcO/mO9v
va+VH1rANIYMfZz1ceA2iYtypAMUxHJYCY4LP4Lq2cjt/N3vIU6jW6FAvfsDqzE7LmfXY5vDJJmv
6bfZKYdlcwBe3+Cy/e6HOkUmn1y3IuuV5SfdLbBZ140qo+cJ60Mo/Xkipb4Vf/FIYP4SpEWgIMnC
UFb3DphvIp/gnuWaIiCPcb0QFa9EENWCKk2m/r9iBUnW7aD1pqK2ocduTw8ALfDwMBY47oGLSItE
xxvb+5fiTSMvRlfUCQza4KWueoka1RuyY5nn1D5AsZdtHKzslCma39Kz8ZeCF5lLFZLH91sNdamI
EXJ/Yq0+nP4pp1N3GC8I6aiSs4A8NI5eq/WEFh5rAsKcVzIiJWfN3YPWm8GzcKHKK8u3xpjfdfHK
p6imCkj4k2a9LQjMkBHU+Q26CnSr3ImnCYlvB+81BniQDpwxY2RmfYApUaC4MCwRnLeda1aNrVVC
Qn+fFjVVdBW2fPMxRWL0vT4aGFhkXrex2NSJEeiPyNl0Y2NFPimnFwqWev1ZmNkRLbEvtnDDadOb
q+B+GzldXh2zGpV9EVMLwktOjFSbBLrAWvYFlYsStwAAAAAAAA==


--=-S7QBFxFJH9h8D4nsQU0o--
