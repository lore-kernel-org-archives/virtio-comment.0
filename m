Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F1D14F9E5
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 10:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693144; cv=none; b=eCjaHf/YnVWPYk95W0CLV7JaGcpWY87SoIgax8GEejnUaSjI8PZFB/HZLVZFH+FD2VLA6ywrDFI+zU2jAu78NutJBQXPSzPquaSG9i/jEur5gh6kBJS0/Z1Xpo4/n3rIeMkYmXOG2x8yRzjsYd7yXLsQuWkNUDY7fipCQxUQa0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693144; c=relaxed/simple;
	bh=iZusO7LnM5bvT3lcn5rvHMryOPXmZKPky+JXzQiVnbg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l5pjQaJslLp/0ac3BGDCfaa2zqBWPmcO/wBEulVygyh8gEnTMV2NIJWK6nrBgLeU0ALZ2D/SKC4QnV+XtQOenZ43NgUa8gro0GVwXBC3phhalxN49wlr0DRMSyei0+n9Ttjc9yqLjNskN34pKaaHXzCFZhIT5q1I4JzF5/4mwH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PracWKKA; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PracWKKA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gVaWV76mzF4bnlyA1rbhDC4wKFoJv9mdrmrMkr/WjO8=; b=PracWKKA2CNQzuHV0Oo9EzABqB
	rht1lbQbxx2LiWA39cxZ0DhFz1PtplnG/arjgKlc2ijEZTJEsN3BYYTu6vByvz0oWu4Bbctmc4X54
	xxgGMKa0L7xrml5+/ZkMAjIPuiQ8a8pYnyOGGi3h9a8KIDHtP+9vBEWQ/nw8M0GZMysPKV8c5dGW7
	7Va24jsHjpDQnv0Ef4Fxq+XDkH8RSe8EWPJBANCyRgexebzwKQcxz5S5rGBnIaGiuM95C8RgAPhRw
	xzXs61YnZp/JUP232ABfoM0M4Xn0cmbFR6HJ8l3CyIEMDfdnbGTCqKXW4Kl8k/Me87BSCT6+bOizP
	p5zMwafA==;
Received: from [2001:8b0:10b:5:bac6:9a6f:ee75:2e7b] (helo=u3832b3a9db3152.ant.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRqt8-0000000ArLC-12jn;
	Thu, 11 Jul 2024 10:18:58 +0000
Message-ID: <b1645fa81d693b899430f7210ae1cab7d28dbc1e.camel@infradead.org>
Subject: Re: [RFC PATCH v4 5/5] virtio-rtc: Indicate leap seconds and clock
 performance
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Hilber <peter.hilber@opensynergy.com>, 
	virtio-comment@lists.linux.dev
Cc: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>, 
 Jason Wang <jasowang@redhat.com>, "Ridoux, Julien" <ridouxj@amazon.com>,
 "Luu, Ryan" <rluu@amazon.com>,  "Chashper, David" <chashper@amazon.com>
Date: Thu, 11 Jul 2024 11:18:57 +0100
In-Reply-To: <20483787-62df-4ca6-868f-71b4d4898323@opensynergy.com>
References: <20240522170003.52565-1-peter.hilber@opensynergy.com>
	 <20240522170003.52565-6-peter.hilber@opensynergy.com>
	 <3935e6c2b4b73968d0c4728a3c1f429f121609e7.camel@infradead.org>
	 <668b681a-8025-49eb-a75a-7dac4fff8b56@opensynergy.com>
	 <41c09f2bd37bd476ce9e1582cfca1d2ba16a1a59.camel@infradead.org>
	 <20483787-62df-4ca6-868f-71b4d4898323@opensynergy.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-zPfyNXoN15N3FpZ0ciep"
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-zPfyNXoN15N3FpZ0ciep
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the continuing feedback, Peter. Since it's only changes to
comments, I won't post a whole new version; I've pushed the following
changes to the git tree.

I believe I understood correctly that you're amenable to adding the
VIRTIO_RTC_POST_ values? And I think the other part of the discussion
about exposing ongoing smearing via this field does not affect its
usage in SHM?=20

With this, I think we're at a point where I can seriously propose this
be adopted into your virtio-rtc specification? Do you have that in a
public git tree that I can work from to provide an actual patch?

We need it to be explicitly little-endian, of course, but I consider
that an implementation detail. Likewise the signedness of the
tai_offset field, which *can* be expressed (albeit creatively) within
the constraints of the existing virtio definitions.

It's versioned anyway, so as long as it looks *reasonable* I'd like to
go ahead and submit the ACPI version of it to QEMU and the kernel (and
obviously also ship it in the hypervisor that pays my bills), in the
expectation that *if* it did need further revision before the final
publication of the virtio-rtc specification, that should be feasible.
But the *intent* is that it doesn't need to change, of course.

Are you happy with that in concept?

diff --git a/include/uapi/linux/vmclock-abi.h b/include/uapi/linux/vmclock-=
abi.h
index 84f0e37a8a06..d7ca44313bf8 100644
--- a/include/uapi/linux/vmclock-abi.h
+++ b/include/uapi/linux/vmclock-abi.h
@@ -106,19 +106,17 @@ struct vmclock_abi {
 #define VMCLOCK_FLAG_TIME_ESTERROR_VALID	(1 << 5)
 #define VMCLOCK_FLAG_TIME_MAXERROR_VALID	(1 << 6)
 	/*
-	 * Even regardless of leap seconds, the time presented through this
-	 * mechanism may not be strictly monotonic. If the counter slows down
-	 * and the host adapts to this discovery, the time calculated from
-	 * the value of the counter immediately after an update to this
-	 * structure, may appear to be *earlier* than a calculation just
-	 * before the update (while the counter was believed to be running
-	 * faster than it now is). A guest operating system will typically
-	 * *skew* its own system clock back towards the reference clock
-	 * exposed here, rather than following this clock directly. If,
-	 * however, this structure is being populated from such a system
-	 * clock which is already handled in such a fashion and the results
-	 * *are* guaranteed to be monotonic, such monotonicity can be
-	 * advertised by setting this bit.
+	 * If the MONOTONIC flag is set then (other than leap seconds) it is
+	 * guaranteed that the time calculated according this structure at
+	 * any given moment shall never appear to be later than the time
+	 * calculated via the structure at any *later* moment.
+	 *
+	 * In particular, a timestamp based on a counter reading taken
+	 * immediately after setting the low bit of seq_count (and the
+	 * associated memory barrier), using the previously-valid time and
+	 * period fields, shall never be later than a timestamp based on
+	 * a counter reading taken immediately before *clearing* the low
+	 * bit again after the update, using the about-to-be-valid fields.
 	 */
 #define VMCLOCK_FLAG_TIME_MONOTONIC		(1 << 7)
=20
@@ -136,28 +134,31 @@ struct vmclock_abi {
 	 * the smearing method. However in this case it provides a *hint* to
 	 * the guest operating system, such that *if* the guest OS wants to
 	 * provide its users with an alternative clock which does not follow
-	 * the POSIX CLOCK_REALTIME standard, it may do so in a fashion
-	 * consistent with the other systems in the nearby environment.
+	 * UTC, it may do so in a fashion consistent with the other systems
+	 * in the nearby environment.
 	 */
 	uint8_t leap_second_smearing_hint; /* Matches VIRTIO_RTC_SUBTYPE_xxx */
 #define VMCLOCK_SMEARING_STRICT		0
 #define VMCLOCK_SMEARING_NOON_LINEAR	1
 #define VMCLOCK_SMEARING_UTC_SLS	2
 	int16_t tai_offset_sec;
-	uint8_t leap_indicator; /* Based on VIRTIO_RTC_LEAP_xxx */
+	uint8_t leap_indicator;
+	/*
+	 * This field is based on the the VIRTIO_RTC_LEAP_xxx values as
+	 * defined in the current draft of virtio-rtc, but since smearing
+	 * cannot be used with the shared memory device, some values (_NEG)
+	 * are not used.
+	 *
+	 * The _POST_POS and _POST_NEG values are added in order to allow the
+	 * guest to perform its own smearing during the day or so after a
+	 * leap second when such smearing may need to continue being applied.
+	 * It is hoped that these will be incorporated into virtio-rtc too.
+	 */
 #define VMCLOCK_LEAP_NONE	0	/* No known nearby leap second */
-#define VMCLOCK_LEAP_PRE_POS	1	/* Leap second + at end of month */
-#define VMCLOCK_LEAP_PRE_NEG	2	/* Leap second - at end of month */
+#define VMCLOCK_LEAP_PRE_POS	1	/* Positive leap second at EOM */
+#define VMCLOCK_LEAP_PRE_NEG	2	/* Negative leap second at EOM */
 #define VMCLOCK_LEAP_POS	3	/* Set during 23:59:60 second */
 #define VMCLOCK_LEAP_NEG	4	/* Not used in VMCLOCK */
-	/*
-	 * These values are not (yet) in virtio-rtc. They indicate that a
-	 * leap second *has* occurred at the start of the month. This allows
-	 * a guest to generate a smeared clock from the accurate clock which
-	 * this device provides, as smearing may need to continue for up to a
-	 * period of time *after* the point of the leap second itself. Must
-	 * be cleared by the 15th day of the month.
-	 */
 #define VMCLOCK_LEAP_POST_POS	5
 #define VMCLOCK_LEAP_POST_NEG	6
=20


--=-zPfyNXoN15N3FpZ0ciep
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQwNzExMTAxODU3WjAvBgkqhkiG9w0BCQQxIgQgllXmNoir
JA7AgHkVSImWItcciVHamZUZhj7duVK8Tx8wgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgABt1P4/Rxao/6N8o6pN3ytvmQ6yAMkywvU
opFQdvApsfBPrjXJ9waJt0ccQXGdO/2EtjxMewrIOxJJt4i0KbtfFNp/WuBdeHhUQGpd5SWzswcx
gEyxCwEa0e3WIvj+j0ykhr1janXLmaJTkjeY5j/VMCgBIzOOUwVaiOC1+TgGJ2TAWW03qKzVfW19
pc9UGBThtcj/tgX8g6Layv48M2kFU23XhRm7MIQeCmAsP8cn1CYtEJHSVpwSTAwasD9xLysbLvxE
brM9miNMTT0Qf8j3mK43HiE22RvE1P1m3CLhXMTiaCpadW/sDiEAWeLadVO3YnEdcZ62HfYR9lc2
Xytq5LI/fppkyc10E4Pxqo7UCgMDvpJhac5CnuKyaj42qYTlq6l6EpAsZV713TAssyqk8Wx8bvtQ
rXePpu+EqP2lXcTC+yt/iEjD5Yc5yEAjbGoVogEXgWuCoe+nWMb8t81P/Up8EPDi9p6dJ083o/gF
wZlWFSAznz2A2PITZ91WkW0wix0Rioi+UOosrE9gJcAYqFHxPnb7HzuIK7RGpbW5Ze9jva8Cqsja
EVfKRzR5sWLujQvAC/9QvC4JSl4oPbitUQI7efx8yE9A261ctrXtilsYsIqAb9NHlccR889hFazK
Ofl1h9IcgcRRFrYk+Cfrqm5F5fZ50lh7BjOtoum7OwAAAAAAAA==


--=-zPfyNXoN15N3FpZ0ciep--
