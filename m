Received: from mail-out-2a.itc.rwth-aachen.de (mail-out-2a.itc.rwth-aachen.de [134.130.5.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE6B195FC6
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.130.5.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679263; cv=none; b=KRu2Oukx9wyVbEMLSEZZsMufncYjMFEgHw3wxWkLEx4Q51HLD6vFiNE9nGmz8irInXbdJWk//irvdAzDOc7O1TKR8kZTGSx9A3UqfXRr+3cVy72acTMV2tZrSiW+ukfDJltAHOgdp+VxrIjqwYdDSzdIuMwd/2baSEMi0CUp6k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679263; c=relaxed/simple;
	bh=9b7niQHNuQ22LHiJJ1GgS/xQdEkXz+Qg9OvLjAV00Ow=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sL8TXy+88QgBSr/OeoHJoKuzsCwDHheMju+o8a2gYzmKfJ5oMxGJojSgiZbt56ZHmLmTNTNBS7vVNd6L7P3YHvwEeNX/Jm2DsWe7l6EK8uO7zjsVDMDyYYaThCfuZacgoW03fcxpdsgSJCUm/ijYZp33DoW+Sp8gYMbd6efH/1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eonerc.rwth-aachen.de; spf=pass smtp.mailfrom=eonerc.rwth-aachen.de; dkim=pass (2048-bit key) header.d=rwth-aachen.de header.i=@rwth-aachen.de header.b=no8EHDAy; arc=none smtp.client-ip=134.130.5.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eonerc.rwth-aachen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eonerc.rwth-aachen.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rwth-aachen.de header.i=@rwth-aachen.de header.b="no8EHDAy"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=rwth-aachen.de; i=@rwth-aachen.de; q=dns/txt;
  s=20240516-RWTH; t=1717679254; x=1749215254;
  h=from:to:subject:date:message-id:mime-version;
  bh=9b7niQHNuQ22LHiJJ1GgS/xQdEkXz+Qg9OvLjAV00Ow=;
  b=no8EHDAyYujqb63wwcTrZVNepyA8zrjVSKJfKgCwMGkvKyR+Xpatgpky
   Fdw9SqnDsCk17MBzwia9YqCuyg41hFlBoqdmpqR66Dt1yMn77QNPB3rem
   UpONFRTpxi2/mPhmasxa2EZMIkFcQtGIgCngl6RWElGOz90hRIi06XgKU
   /G1jQ9pNymWRbSMwjSVvucDeLM7SerKyZMp7WVNRXosm+4npcwmb2K1GK
   DAkVJwleFb1iBPzE1+DxBQkGTmpS3uTRTTvryWk2REy9zmevJNsjAE7hn
   6XIIey7RCcjZIAtYEYKLOGcl3SXqljZuOUCgcV86dh0Zhrqt6XberpQHS
   w==;
X-CSE-ConnectionGUID: cpcdenz5R0eKEAEjdCBD7A==
X-CSE-MsgGUID: mHZKhebgQXambQCDywWFDw==
X-IPAS-Result: =?us-ascii?q?A2DkBgAbtGFm/58agoZaHgEBCxIMhU0wgTaEVZwPjg6HW?=
 =?us-ascii?q?Q8BAQEBAQEBAQEEBAFEBAEBjWooOBMBAgQBAQEBAwIDAQEBAQEBAQEGAQEGA?=
 =?us-ascii?q?QEBAQEBBgWBHYUvRgyHA2gBSgIELycEEw6CcgGCUxGxNIEygQGEetl5gRoQg?=
 =?us-ascii?q?UiBV4ZaAYFTBoJ8gSSGT0OBPA4NgyaIHjqCLwSlfSYLiieCSSETAVUTFws+C?=
 =?us-ascii?q?RYCFgMbFAQwDwkLJioGOQISDAYGBlk0CQQjAwgEAxAyAyBxEQMEGgQLB3WDJ?=
 =?us-ascii?q?QQTR4E3iXGCB4E0gh2EG0uEcYFrDGGIEYFzgUGBZlCBIoFsWWMdQAMLbT01F?=
 =?us-ascii?q?Bulfy+BFoQyT4EOcsdyB4I2XYEDhlaDLpdHBC+XSJJwAS6HWJBfIKhAAgQCB?=
 =?us-ascii?q?AUCF4F8gX5xeQGCPFIXAg/cWHgCOQIHAQoBAQMJgjmILwEB?=
IronPort-Data: A9a23:LsE1waNybhQ/PmbvrR30lsFynXyQoLVcMsEvi/4bfWQNrUolhTJWm
 GEZD2qAMvyOMWWnc48nPIi+oBlX6MTTztRlSHM5pCpnJ55oRWspJvzEdBuqb3PKRiHnZBg6h
 ynLQoCYdKjYdleF+1H1dOGn9SIkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRWmthg
 vus5ZWPULOZ82QsaD5Mtfrd8UgHUMna4Vv0gHRvPZing3eDzxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDS4pZiYJVOtzAZzsAE+vthaKBMOR8/ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFLLveRCCXcKvI0LueGPnz/hoHhwMZYA7189aA21l3
 9BHAWVYBvyDr7reLLOTUPZwhskzadaxeYlZoG58zXTQAbAqTPgvQY2TvoMehWxowJoQW6+DN
 qL1ahI2BPjESxhGIEsWDtQ9huClgHj5fBVVr1SYv6Fx+XfPzEl42bPtPdyTdtHiqcB9zhfH9
 z6cojqR7hcyMfyt6jqI+H2VtubKlxrQdJMNK5OU6as/6LGU7ilJYPEMbnOloOOli0n7UNVaL
 kES5gIqrLMu7wqvT9/gT1u0rWDsg/IHc8BPD+03+ESSkO/epRyGGmhBRzIHZNFOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:+SCmLaMGTq9R8cBcTj+jsMiBIKoaSvp037BL7SBMoX48SKalfq
 WV8cjzuiWE7Ar5NEtNpTnjAse9qBrnnPYf3WB7B9aftWfd11eAHcVL9ovoy3nMBzb3/etQ+a
 Npc607Ncb5B1p3lub2iTPIduoI8Z2u66CijaP51HdiTQZjdqFm4UNQEx+fEkd/WQlBAvMCZf
 ihz/sCjyGhcnxSSN+6CHkDV/XCoNOOr57vZBpuPW9F1DWz
X-Talos-CUID: 9a23:iDwGgGN1pF2sau5DUzFs+EMSCJ0fKnD+4V79IUOTI0o2YejA
X-Talos-MUID: 9a23:TGZAkgSFwfPAK5UYRXTppANBNMpi7J2eAUUHqL4qqta7GwBvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.08,219,1712613600"; 
   d="p7s'346?scan'346,208,346";a="89794256"
Received: from rwthex-w2-b.rwth-ad.de ([134.130.26.159])
  by mail-in-2a.itc.rwth-aachen.de with ESMTP; 06 Jun 2024 15:07:30 +0200
Received: from rwthex-s2-a.rwth-ad.de (134.130.26.154) by
 rwthex-w2-b.rwth-ad.de (134.130.26.159) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 6 Jun 2024 15:07:30 +0200
Received: from rwthex-s2-a.rwth-ad.de ([fe80::9e0:8e94:8a31:2f0b]) by
 rwthex-s2-a.rwth-ad.de ([fe80::9e0:8e94:8a31:2f0b%4]) with mapi id
 15.02.1544.011; Thu, 6 Jun 2024 15:07:30 +0200
From: =?utf-8?B?S3LDtm5pbmcsIE1hcnRpbg==?=
	<martin.kroening@eonerc.rwth-aachen.de>
To: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: [PATCH] virtio_pci_cap64: specify offset_hi, length_hi endianness
Thread-Topic: [PATCH] virtio_pci_cap64: specify offset_hi, length_hi
 endianness
Thread-Index: AQHauBJ8+HRQ74qmmEeQIJSslq1JZQ==
Date: Thu, 6 Jun 2024 13:07:30 +0000
Message-ID: <DF89BB0F-6BA4-4DAB-AEC3-03AAF858EC8E@eonerc.rwth-aachen.de>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
user-agent: Microsoft-MacOutlook/16.85.24052614
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha256; boundary="B_3800531249_2162978725"
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

--B_3800531249_2162978725
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable

While the capability introduction says "This virtio structure capability us=
es little-endian format,"
it might be preferrable to be explicit about the endianness of offset_hi an=
d length_hi.

Signed-off-by: Martin Kr=C3=B6ning <martin.kroening@eonerc.rwth-aachen.de>
---
 transport-pci.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/transport-pci.tex b/transport-pci.tex
index a5c6719..95b08b8 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -252,8 +252,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{se=
c:Virtio Transport Option
 \begin{lstlisting}
 struct virtio_pci_cap64 {
         struct virtio_pci_cap cap;
-        u32 offset_hi;
-        u32 length_hi;
+        le32 offset_hi;
+        le32 length_hi;
 };
 \end{lstlisting}
=20
--=20
2.39.3 (Apple Git-146)


--B_3800531249_2162978725
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIIXdQYJKoZIhvcNAQcCoIIXZjCCF2ICAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghRIMIIHeDCCBWCgAwIBAgIRAIF5Ijq8WuKG47yCsN2S2CkwDQYJKoZIhvcNAQEMBQAw
RjELMAkGA1UEBhMCTkwxGTAXBgNVBAoTEEdFQU5UIFZlcmVuaWdpbmcxHDAaBgNVBAMTE0dF
QU5UIFBlcnNvbmFsIENBIDQwHhcNMjMxMTE1MDAwMDAwWhcNMjUxMTE0MjM1OTU5WjCB4TEL
MAkGA1UEBhMCREUxHDAaBgNVBAgTE05vcmRyaGVpbi1XZXN0ZmFsZW4xHzAdBgNVBAoTFlJX
VEggQWFjaGVuIFVuaXZlcnNpdHkxETAPBgNVBGETCEdPVkRFK05XMTQwMgYJKoZIhvcNAQkB
FiVtYXJ0aW4ua3JvZW5pbmdAZW9uZXJjLnJ3dGgtYWFjaGVuLmRlMREwDwYDVQQEDAhLcsO2
bmluZzEWMBQGA1UEKhMNTWFydGluIFdlcm5lcjEfMB0GA1UEAwwWTWFydGluIFdlcm5lciBL
csO2bmluZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBANZET80kiiEa9VAQuDRn
mXGvDvTyjf57f+GuAXYL3KYE7gNKZobO8WYDOwK4yc5biBhiH0i6EwfXuiOAnU/Gtl5kxn8O
IDTaHpwN10m+WebFdFbgzDGpwG9nFteq8AED+6R9O3TXF0PWHa9XzgtD5IUTE3XhSNUPQFj3
+dT/O7p4lBksKVUNMDwD8xI/S4tYnJobUNoOkIUhtDiY6hFECNR7cOAD0vxy6yPOP/XVR67u
PZL/ar44fwBwiXoAxkpJS2RKPE7FB5FYnVppBWmzYNnpsBnBSBmPzffOQwUwLbjLrViTxr5i
vhIv5kJ2Qcaxy5Prt97Li8w52Zb7VIPGFl5/FNFjqjDYsAnHMCkk2ukluQz7TE52xRoRn95D
1YfzHlnHEhT7qbQLC5SXOLp5LspUh0kIELF+QHZEujgwwJPPAXSLBJTJipgBCLZbQ81IoVvn
Tb0JCAq26ol0tstwqLx1TYeVRvmRf7XEPfJUJ4dTXnbYKpe6efGyWfSV3PLscSS28bwKUyGk
cA+8LNAO5paMNoXRO4ALyUI2IjgOD5L09o+BXJtDH6DR+nHZpIVwzdXctRZyV6XgQjppxrA7
TPbKjLY5G+myqeCmcEFWZwl9OrzKKR5B3odeykPDQYPWpJP/gJHz9uAz4Ayw4Ehygx8dws38
/UNtIoIgrmhz7sgBAgMBAAGjggHDMIIBvzAfBgNVHSMEGDAWgBRpAKHHIVj44MUbILAK3adR
vxPZ5DAdBgNVHQ4EFgQUpTjdAZQwdPva9wwVyQKkMgE0htowDgYDVR0PAQH/BAQDAgWgMAwG
A1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMFAGA1UdIARJMEcw
OgYMKwYBBAGyMQECAQoEMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vc2VjdGlnby5jb20vU01J
TUVDUFMwCQYHZ4EMAQUDAjBCBgNVHR8EOzA5MDegNaAzhjFodHRwOi8vR0VBTlQuY3JsLnNl
Y3RpZ28uY29tL0dFQU5UUGVyc29uYWxDQTQuY3JsMHgGCCsGAQUFBwEBBGwwajA9BggrBgEF
BQcwAoYxaHR0cDovL0dFQU5ULmNydC5zZWN0aWdvLmNvbS9HRUFOVFBlcnNvbmFsQ0E0LmNy
dDApBggrBgEFBQcwAYYdaHR0cDovL0dFQU5ULm9jc3Auc2VjdGlnby5jb20wMAYDVR0RBCkw
J4ElbWFydGluLmtyb2VuaW5nQGVvbmVyYy5yd3RoLWFhY2hlbi5kZTANBgkqhkiG9w0BAQwF
AAOCAgEAGGZSOjAsZR27uupzz4Lb/9DDX4PkF7wIWvwPNSAJTIuEOcapIP5pYV9r0kOCq87D
e++N9X3FeoPzy9chRO09c6Nafw8X3lLV8nRVJPAJZxP9Om4+iPHk+QgwWAMgkt+JZJqlQYn6
+mJU8apsjNC1MJSiGR/L/jsliNkRFwvP7Npt+HmJwtj8WQExUpH485xmcjlTsk5HQkMQZr1Z
Ay4dAEw0iJCO0vccCYLtzxNsfl0EIeaz2RzgZH8zmSVp3MzSEFMPm6H39OUciXgr9YcqXv4e
W+LPsf9zILOYV4cvZdfvRnOcTjV7mj2SNygoqvDxCUe0cwozM1pw9uyaInFLrn6g+O/sTlZX
EnaYl+N5b0YKSTqGmWPt0eY+l0w2z5y3rRaADg7XzQcJCDbFCiWHgeBAXk5BsYvhoLayuOyF
l7pXAUSYCJv3/M3wARGcM0lyO13wGcykSS4ZZk/8fVnVU6aTMamMM9BLSmTAFnwbCEMQdiyM
DrVkgwK9S8F8QntpPhYoJpo1WLoV+zPiNq0eHAP9C1DeCRH9vjK4tJBQ1uNSGb3FviuPvbTC
oRc1yyf5Bg/mqRKzVE99n2chfrZHY7Lm82GAE7QEkpHcSa+B0ml3WNLln6tipLpP0SSI3mjT
GKV5DcxBrEIgRaxWIlCa8sbaiRKLcxkNxYM/BaWLxtgwggbmMIIEzqADAgECAhAxAnDUNb6b
JJr4VtDh4oVJMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKTmV3
IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1Qg
TmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0
eTAeFw0yMDAyMTgwMDAwMDBaFw0zMzA1MDEyMzU5NTlaMEYxCzAJBgNVBAYTAk5MMRkwFwYD
VQQKExBHRUFOVCBWZXJlbmlnaW5nMRwwGgYDVQQDExNHRUFOVCBQZXJzb25hbCBDQSA0MIIC
IjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAs0riIl4nW+kEWxQENTIgFK600jFAxs1Q
wB6hRMqvnkphfy2Q3mKbM2otpELKlgE8/3AQPYBo7p7yeORuPMnAuA+oMGRb2wbeSaLcZbpw
XgfCvnKxmq97/kQkOFX706F9O7/h0yehHhDjUdyMyT0zMs4AMBDRrAFn/b2vR3j0BSYgoQs1
6oSqadM3p+d0vvH/YrRMtOhkvGpLuzL8m+LTAQWvQJ92NwCyKiHspoP4mLPJvVpEpDMnpDbR
UQdftSpZzVKTNORvPrGPRLnJ0EEVCHR82LL6oz915WkrgeCY9ImuulBn4uVsd9ZpubCgM/EX
vVBlViKqusChSsZEn7juIsGIiDyaIhhLsd3amm8BS3bgK6AxdSMROND6hiHT182Lmf8C+gRH
xQG9McvG35uUvRu8v7bPZiJRaT7ZC2f50P4lTlnbLvWpXv5yv7hheO8bMXltiyLweLB+VNvg
+GnfL6TW3Aq1yF1yrZAZzR4MbpjTWdEdSLKvz8+0wCwscQ81nbDOwDt9vyZ+0eJXbRkWZiqS
cnwAg5/B1NUD4TrYlrI4n6zFp2pyYUOiuzP+as/AZnz63GvjFK69WODR2W/TK4D7VikEMhg1
8vhuRf4hxnWZOy0vhfDR/g3aJbdsGac+diahjEwzyB+UKJOCyzvecG8bZ/u/U8PsEMZg07iI
Pi8CAwEAAaOCAYswggGHMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1Ud
DgQWBBRpAKHHIVj44MUbILAK3adRvxPZ5DAOBgNVHQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgw
BgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwOAYDVR0gBDEwLzAtBgRV
HSAAMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFAGA1UdHwRJMEcw
RaBDoEGGP2h0dHA6Ly9jcmwudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0
aW9uQXV0aG9yaXR5LmNybDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9j
cnQudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcw
AYYZaHR0cDovL29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEACgVOew2P
HxM5AP1v7GLGw+3tF6rjAcx43D9Hl110Q+BABABglkrPkES/VyMZsfuds8fcDGvGE3o5UfjS
no4sij0xdKut8zMazv8/4VMKPCA3EUS0tDUoL01ugDdqwlyXuYizeXyH2ICAQfXMtS+raz7m
f741CZvO50OxMUMxqljeRfVPDJQJNHOYi2pxuxgjKDYx4hdZ9G2o+oLlHhu5+anMDkE8g0tf
fjRKn8I1D1BmrDdWR/IdbBOj6870abYvqys1qYlPotv5N5dm+XxQ8vlrvY7+kfQaAYeO3rP1
DM8BGdpEqyFVa+I0rpJPhaZkeWW7cImDQFerHW9bKzBrCC815a3WrEhNpxh72ZJZNs1HYJ+2
9NTB6uu4NJjaMxpk+g2puNSm4b9uVjBbPO9V6sFSG+IBqE9ckX/1XjzJtY8Grqoo4SiRb6zc
Hhp3mxj3oqWi8SKNohAOKnUc7RIP6ss1hqIFyv0xXZor4N9tnzD0Fo0JDIURjDPEgo5WTdti
/MdGTmKFQNqxyZuT9uSI2Xvhz8p+4pCYkiZqpahZlHqMFxdw9XRZQgrP+cgtOkWEaiNkRBbv
tvLdp7MCL2OsQhQEdEbUvDM9slzZXdI7NjJokVBq3O4pls3VD2z3L/bHVBe0rBERjyM2C/HS
Ih84rfmAqBgklzIOqXhd+4RzadUwggXeMIIDxqADAgECAhAB/W0w/KPKUagbvGQONQMtMA0G
CSqGSIb3DQEBDAUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIG
A1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwG
A1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTAeFw0xMDAyMDEw
MDAwMDBaFw0zODAxMTgyMzU5NTlaMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKTmV3IEpl
cnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0
d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTCC
AiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAIASZRc2DsPbCLPQrFcNdu3NJ9NMrVCD
YeKqIE0JLWQJ3M6Jn8w9qez2z8Hc8dOx1ns3KBErR9o5xrw6GbRfpr19naNjQrZ28qk7K5H4
4m/Q7BYgkAk+4uh0yRi0kdRiZNt/owbxiBhqkCI8vP4T8IcUe/bkH47U5FHGEWdGCFHLhhRU
P7wz/n5snP8WnRi9UY41pqdmyHJn2yFmsdSbeAPAUDrozPDcvJ5M/q8FljUfV1q3/875Pbcs
tvZU3cjnEjpNrkyKt1yatLcgPcp/IjSufjtoZgFE5wFORlObM2D3lL5TN5BzQ/Myw1Pv26r+
dE5px2uMYJPexMcM3+EyrsyTO1F4lWeL7j1W/gzQaQ8bD/MlJmszbfduR/pzQ+V+DqVmsSl8
MoRjVYnEDcGTVDAZE6zTfTen6106bDVc20HXEtqpSQvf2ICKCZNijrVmzyWIzYS4sT+kOQ/Z
Ap7rEkyVfPNrBaleFoPMuGfi6BOdzFuC00yz7Vv/3uVzrCM7LQC/NVV0CUnYSVgaf5I25lGS
DvMmfRxNF7zJ7EMm0L9BX0CpRET0medXh55QH1dUqD79dGMvsVBlCeZYQi5DGky08CVHWfoE
HpPUJkZKUIGy3r54t/xnFeHJV4QeD2PW6WK61l9VLupcxigIBCU5uA4rqfJMlxwHPw1S9e3v
L4IPAgMBAAGjQjBAMB0GA1UdDgQWBBRTeb9aqitKz1SA4dibwJ3ysgNmyzAOBgNVHQ8BAf8E
BAMCAQYwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQwFAAOCAgEAXNR8Dc/3AX1BmWUM
c8VSn8v4z5kGfxvaQxWfngJVV5YU8VI8J4eUKO0fOgE3onb8U1DAhJvGa066jCFPoo5VYpHz
aRXYvIjjxKoL/e+o6UtVKgYgbVV4KRnuXzBcSyQRVf8kmm5eKivuC02ff/cBOJQUlUMHCftg
qe4cqxKMoJpep5hqWW2LPwj7yNFFrxgVZJASD3MoLsXiJE78WOzw9EX+IrPrL47S2UVhBcGX
b6h2co+LjDavvw0FznGN5qZvH2ymcWLF2NCDcgzxZxGJDJwTTHI037zVcd+qcd3huWyMPBJd
Zdq9VxK2Q2v/5d5NZhFRz5mu7Be26HGRjN5J/t01caIVJ5Qcz2HjJrtvo2clIV3m3R0LLmgb
O4Kv7INnhdSYUXSxuZmAif9/eBlceUpgLpJArkw3KizJx2LIDl33NlvK4CUlAbTdGgecdwA/
0NzV7D3U+rs/zIXWb3+pLd+5Avf1l5q1NdrDZ7CHSqkoniOO/1wna+GwT/MH7gAu1FmHy1JB
ler0R9fuZEFVfI1ZApXdYp3Cue5aKHSEpZu3kMcMB9/1iTZ0MtYowbCwC+CcTMMc1vzjabVH
RoEvooKr02NEcMSN/y0zuq2Pe7VwiK4+Gc9AKNj8yJC7XZki9VLmWMUfiDFD7ogd18aOPENq
HacY3n09FvFi+cqQqP0xggLxMIIC7QIBATBbMEYxCzAJBgNVBAYTAk5MMRkwFwYDVQQKExBH
RUFOVCBWZXJlbmlnaW5nMRwwGgYDVQQDExNHRUFOVCBQZXJzb25hbCBDQSA0AhEAgXkiOrxa
4objvIKw3ZLYKTANBglghkgBZQMEAgEFAKBpMC8GCSqGSIb3DQEJBDEiBCAbrv/ijq/MTM6U
oWZu55RjYh9tqH3VCYUC6EvgOujiMzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqG
SIb3DQEJBTEPFw0yNDA2MDYxMzA3MjlaMA0GCSqGSIb3DQEBAQUABIICALd0eZ88v0h7tQQx
wV9OrZLg4umUingYGfqgIRCZbhA1JND6sQ7wQrek1ujJwRQZb2FfJTA1zp0/pDjWSs0fpcrI
cmQqrPfCZBs3ly7vlgjTYAzK0a+sVJrOlPwVn8aaXWsxkRKwwBmsHqldCeiiTVVeIkzVF8gN
3R5DbqoRtKAfEWRQxN8cgkHcj+u2FaaTqKRVtPQyhI1avZbP0Ie57eDy8p7v0iwOQ4TJYCSr
abuz63G+jBnhsq/WIsaeDjQmFbp9WlZlGJleh4tUspvsx4gmAtLW/6Eia6SxTPwzewqNMQp0
qSxYvGcK+4T1lHZYVwqSeWwR06nAtNmGCzkqSgC/SVN1AddquLjuL8UVx2euiNbKjuU1cFua
75/xAkNmBKWiSH6GN3acSEVGh3g1NaUOMocRF3E9QjjntsUgZascMAW8US2tq6jkLq4qU/ZS
TJ8ySPltlX4IOipdzClHxL+sgEu/grj26z5IxPZw4AAUnvauRN6NSBprSwpyb7iegKMz6FsV
zHFwaaH2fAxp8oZfcPLV0f7rLf/Cp9ea52pk30NB4nQtLTDn65N0Qo27VW3dotP4Bxp+qkPH
qt457MYMzONWoj23rsSYlqAbGowqt1gbm4xNByYGjtjnYmk0kb2TGSLzLvWmm5hFRHKelBjT
XEelyj4N6/cWzsqvVlca

--B_3800531249_2162978725--
