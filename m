Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86236354AC2
	for <virtio-comment@lists.linux.dev>; Wed, 14 Jan 2026 20:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768422571; cv=pass; b=eD9C7naeYHjei9ABH6TOeUWUuoa/dMs0ZxmmBELmEk+ud797deYrU6z5cuyuePVr5qLPUH4q6v+616t5AwTRTFpxtJDowi+tgoUsP6V45D9zcTFjCstF9BI2MsW5b5uTpqaHcuNJicQ8YboM1zJtBa9Y5SKS73V55+15ogH9RLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768422571; c=relaxed/simple;
	bh=RoutCftA4kehw3ttH26zJ0NMdymose07X+JqPBQ81zw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=VF3Gg4v0hCEFOmpXOxEYJmAgcMagU98iTlzEn7h3/aELWYWhhg6VITCFV5CWmSqx59Gmmf4D1Mh1uxNH+vPjWp3YfQi4YuiavsMskGf5dSrSOPZckw/5yRrbkzjwop15Xv6uM8CNINQdrpt+jG6/Mc7c4RqEbcvaMeKYV2Imi+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oasis-open.org; spf=pass smtp.mailfrom=oasis-open.org; dkim=pass (2048-bit key) header.d=oasis-open-org.20230601.gappssmtp.com header.i=@oasis-open-org.20230601.gappssmtp.com header.b=y62kIWbV; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oasis-open.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oasis-open.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oasis-open-org.20230601.gappssmtp.com header.i=@oasis-open-org.20230601.gappssmtp.com header.b="y62kIWbV"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88a288811a4so1507036d6.3
        for <virtio-comment@lists.linux.dev>; Wed, 14 Jan 2026 12:29:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768422568; cv=none;
        d=google.com; s=arc-20240605;
        b=Mwa3rjilq8XEVGt5SdRfA8W/P4WP2TsnAr72G/FEAhERku0YXtd9rFAB0UHlOLFOcS
         ktmAE8nYepUu1oU0yk657XjqU84Ai06BD3/XLta0p6DWtgdJY4LeVEEN7xBdaMzNdB/t
         0GE+4ye1R0TjbkZ+dvegOBSwIhzdnKb9ITue7r6ZAp3xJ3LdQp7a2BleHe+UPwI7RrwO
         KHzdPKhwlFkL3Ovegxb0vQHWDa/9mKozAwkONc8PvHmHflJ/R1gKUM1I1THI/BVU6X8x
         ueGQL5raJ540FigDVwJpJg0dSBTetQl+fFV9XYopsIqnIYnY8SuqWa1+oD4Hq5kaXBGM
         ciLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=RoutCftA4kehw3ttH26zJ0NMdymose07X+JqPBQ81zw=;
        fh=n1qlzoQMogmjY4cxOl+X25Y3Ved54nO5+jEmqUGTs3w=;
        b=APclvc7osqx9aUALMd+hhQhEx4r+p2FAiZpc5MjTdQpCTlW8MnOCbKeUYHIyl8o9TU
         pq+inRWsXsdd96JyDlaPyyg3n03Ggygku4wsCJ98jkzdX2iTVu+4R2Vvx73dqDzXoEnC
         PIte0VLZ2K34OUVpKlYTBEX3PdCKLBYCJS+LnQsm4uYGRcHLSjkzolFMPXLB/JUZu8zT
         LY3EtbT8MpNttJR1AY3S1lww5FHQwsupekFw3KqG/DZHodzsL4ZXiNICuuwtgCA/KxWe
         Ay7pp5k/jJX/0yBZuNRLBgIARl/SGNheBxy8zEKx+d/SYDHp8CfdXZ8Uusg0ztzIC/Xj
         2VAw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oasis-open-org.20230601.gappssmtp.com; s=20230601; t=1768422568; x=1769027368; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RoutCftA4kehw3ttH26zJ0NMdymose07X+JqPBQ81zw=;
        b=y62kIWbVDxcvC1uyKk8IywmZT+VWcqeRShV9yaVucVE+56IlQMWKDGY5ay++RYXBr+
         t2365azvfkL3RoW1kXxqkXShd5Qea8Y9JAH0Kr0KymW13N22KRZzObWw8+PXOqWS1Bnz
         8uR7rOjQYEE8IhcQUTl4XBNnIL3Y6W8XijySfhy+pB4sYknHWBxW06uhFVL7J8OkR+MZ
         VAOiiI0/ZK17m80Mg4QX4chi8Hu41ll4Mh6PAvm81ov3y+CrSMQGi4AIW04yBnpkIfCC
         yMH2j0YIOng1ckht6/BkZ/KM9b798psJKaL0HCA2P5dOQNikRLghwH7LzCqnoQKhdkxK
         sZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768422568; x=1769027368;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RoutCftA4kehw3ttH26zJ0NMdymose07X+JqPBQ81zw=;
        b=YUE4MJFPl+JH1VhhR0Tph949PV+6cIKMPkyahgmrrr6ufGm9hmM8X4nCe0oqp5hRzA
         4JzdHYjbNz9zKI+fiaFZIpkeyWH9WCVncgPf/G3OZpzptMIxz+h51K35dgqQ39vCW013
         3ht6Ivhcd+zIZLa3Y2E8ZcsmIWKPOm6icQIsj4N1cgB+DCh6jhwdGd0S47wvkmpDXfMt
         gEcZ/pqJruc7cxIj9kLpLOfguXTZ+UkfLCL/cDAZ7+U4CzFuzll8Ft9RtjBBJKbZhjJs
         HCYTzRLctSUKzPRCy2wdrq8q5wjwAlCEo0Z9IOThHAq7lxZGBmT0BDr4rta2iDYXJvyo
         /13w==
X-Forwarded-Encrypted: i=1; AJvYcCVNqFtAhdDKj0ReZghPuciK6h7EwjpL3swz4+e2V6dljElFMzX8pK7Hxu2ZxYItsS8ciVOo0hPGa/U7UPm77A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDUjiQP3hXjiMMAQ6Hw59Rv8YGSZd7IdejA3M/QgBpGD1oae+u
	uKXLnG7LqhoS7jyg0r4HKz5hbRkSoEeOjaD4T03496NpPGgKf8qNHDhQdDtvvw+M6kFTtvChLHX
	NRsxesJAcXv2ImKx8W7kJwTUZB40RTHQclt4qDP8pUQ==
X-Gm-Gg: AY/fxX5400HJi3JqyZNTW4g7boHTl9iVFjdsGBI6oVVj+lfctqhdtBn1KOeAYtazgeo
	xZJcy7jhbq+lwQcmQYFr9Fn+AdjDIBMWkrnj32XPiFZmxgwHC2oi2YKeYaaA59RUVKlc6PVujI1
	9gYd29e42GOh4OEeVj3gOUSFoKOlLQRSSqmpoSpS+keoIM0HjZTGWIAiR0J06ByJTvNNJuf99tr
	wFh0ukTnilXY+Mat2MZeRcHruSM64jgdYp4u02BEu4CFGAJeTR46VHpuaTYXQRSePOrunZJxr0W
	JZs1CkZC3FkTXjUE2uopAOMpHXVRrpyg3Z+56MDwGQiMieU9mWDtBoskjPUg
X-Received: by 2002:a05:6214:622:b0:892:6f12:608d with SMTP id
 6a1803df08f44-8927443289emr52121966d6.57.1768422568365; Wed, 14 Jan 2026
 12:29:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Kelly Cullinane <kelly.cullinane@oasis-open.org>
Date: Wed, 14 Jan 2026 15:28:51 -0500
X-Gm-Features: AZwV_QjM4Z9Iv6AAS69jh5tjsPH7nOQQC0zHKXJFC_4qKNXfKgPLmZXyjFc4_OY
Message-ID: <CAAiF602+5JxVHEfZo-JaQ8rT3_E-ZLOw6unSpCY8Y_Fd3YJWmA@mail.gmail.com>
Subject: Invitation to comment on VIRTIO v1.4 CSD01
To: virtio-dev@lists.linux.dev, OASIS-virtio@connectedcommunity.org, 
	virtio-comment@lists.linux.dev
Content-Type: multipart/alternative; boundary="000000000000001eba06485ef739"

--000000000000001eba06485ef739
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OASIS members and other interested parties,


OASIS and the VIRTIO TC are pleased to announce that VIRTIO v1.4 CSD01 is
now available for public review and comment.


VIRTIO TC aims to enhance the performance of virtual devices by
standardizing key features of the VIRTIO (Virtual I/O) Device Specification=
.


Virtual I/O Device (VIRTIO) Version 1.4

Committee Specification Draft 01 / Public Review Draft 01

09 December 2025


TEX:
https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.=
html
(Authoritative)

HTML:
https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.=
html

PDF:
https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.=
pdf


The ZIP containing the complete files of this release is found in the
directory:

https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.=
zip


How to Provide Feedback


OASIS and the VIRTIO TC value your feedback. We solicit input from
developers, users and

others, whether OASIS members or not, for the sake of improving the
interoperability and quality of its technical work.


The public review is now open and ends Friday, February 13 2026 at 23:59
UTC.


Comments may be submitted to the project=E2=80=99s comment mailing list at
virtio-comment@lists.linux.dev. You can subscribe to the list by sending an
email to

virtio-comment+subscribe@lists.linux.dev.


All comments submitted to OASIS are subject to the OASIS Feedback License,
which ensures that the feedback you provide carries the same obligations at
least as the obligations of the TC members. In connection with this public
review, we call your attention to the OASIS IPR Policy
<https://www.oasis-open.org/policies-guidelines/ipr/> applicable especially
to the work of this technical committee. All members of the TC should be
familiar with this document, which may create obligations regarding the
disclosure and availability of a member's patent, copyright, trademark and
license rights that read on an approved OASIS specification.


OASIS invites any persons who know of any such claims to disclose these if
they may be essential to the implementation of the above specification, so
that notice of them may be posted to the notice page for this TC's work.


Additional information about the specification and the VIRTIO TC can be
found at the TC=E2=80=99s public home page located here.
<https://groups.oasis-open.org/communities/tc-community-home2?CommunityKey=
=3Db3f5efa5-0e12-4320-873b-018dc7d3f25c>

--000000000000001eba06485ef739
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-f6a972b0-7fff-ad21-49=
fe-70c594d02e18"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre-wrap">OASIS members and other interested parties,=C2=A0</span><=
/p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t"><b style=3D"font-weight:normal" id=3D"gmail-docs-internal-guid-525989c3-=
7fff-0844-0483-60dd1626f22d"><br></b></p><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font=
-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font=
-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vert=
ical-align:baseline;white-space:pre-wrap">OASIS and the VIRTIO TC are pleas=
ed to announce that VIRTIO v1.4 CSD01 is now available for public review an=
d comment.=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt"><b style=3D"font-weight:normal"><br></b></p><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">VIR=
TIO TC aims to </span><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;color:rgb(41,41,41);background-color:transparent;font-weight:400;font=
-style:normal;font-variant:normal;text-decoration:none;vertical-align:basel=
ine;white-space:pre-wrap">enhance the performance of virtual devices by sta=
ndardizing key features of the VIRTIO (Virtual I/O) Device Specification.</=
span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><b style=3D"font-weight:normal"><br></b></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(34,34,34);background-color=
:rgb(255,255,255);font-weight:700;font-style:normal;font-variant:normal;tex=
t-decoration:none;vertical-align:baseline;white-space:pre-wrap">Virtual I/O=
 Device (VIRTIO) Version 1.4</span></p><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial,sans-serif;color:rgb(34,34,34);background-color:rgb(255,255,255=
);font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre-wrap">Committee Specification Dra=
ft 01 / Public Review Draft 01</span></p><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font=
-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font=
-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vert=
ical-align:baseline;white-space:pre-wrap">09 December 2025</span></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><b sty=
le=3D"font-weight:normal"><br></b></p><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-we=
ight:400;font-style:normal;font-variant:normal;text-decoration:none;vertica=
l-align:baseline;white-space:pre-wrap">TEX: </span><a href=3D"https://docs.=
oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.html" style=
=3D"text-decoration:none"><span style=3D"font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(17,85,204);background-color:transparent;font-weight:400=
;font-style:normal;font-variant:normal;text-decoration:underline;vertical-a=
lign:baseline;white-space:pre-wrap">https://docs.oasis-open.org/virtio/virt=
io/v1.4/csprd01/virtio-v1.4-csprd01.html</span></a><span style=3D"font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-weight:400;font-style:normal;font-variant:normal;text-decoration=
:none;vertical-align:baseline;white-space:pre-wrap"> (Authoritative)</span>=
</p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,=
0,0);background-color:transparent;font-weight:400;font-style:normal;font-va=
riant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-w=
rap">HTML: </span><a href=3D"https://docs.oasis-open.org/virtio/virtio/v1.4=
/csprd01/virtio-v1.4-csprd01.html" style=3D"text-decoration:none"><span sty=
le=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(17,85,204);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:underline;vertical-align:baseline;white-space:pre-wrap"=
>https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01=
.html</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-styl=
e:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;w=
hite-space:pre-wrap">PDF: </span><a href=3D"https://docs.oasis-open.org/vir=
tio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.pdf" style=3D"text-decoration:n=
one"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(1=
7,85,204);background-color:transparent;font-weight:400;font-style:normal;fo=
nt-variant:normal;text-decoration:underline;vertical-align:baseline;white-s=
pace:pre-wrap">https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virti=
o-v1.4-csprd01.pdf</span></a></p><p dir=3D"ltr" style=3D"line-height:1.2;ba=
ckground-color:rgb(255,255,255);margin-top:0pt;margin-bottom:0pt"><br></p><=
p dir=3D"ltr" style=3D"line-height:1.2;background-color:rgb(255,255,255);ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:A=
rial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:4=
00;font-style:normal;font-variant:normal;text-decoration:none;vertical-alig=
n:baseline;white-space:pre-wrap">The ZIP containing the complete files of t=
his release is found in the directory:</span></p><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://docs.oa=
sis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.zip" style=3D"t=
ext-decoration:none"><span style=3D"font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(17,85,204);background-color:transparent;font-weight:400;font=
-style:normal;font-variant:normal;text-decoration:underline;vertical-align:=
baseline;white-space:pre-wrap">https://docs.oasis-open.org/virtio/virtio/v1=
.4/csprd01/virtio-v1.4-csprd01.zip</span></a></p><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><b style=3D"font-weight:no=
rmal"><br></b></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-seri=
f;color:rgb(0,0,0);background-color:transparent;font-weight:700;font-style:=
normal;font-variant:normal;text-decoration:none;vertical-align:baseline;whi=
te-space:pre-wrap">How to Provide Feedback</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><b style=3D"font-wei=
ght:normal"><br></b></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-=
style:normal;font-variant:normal;text-decoration:none;vertical-align:baseli=
ne;white-space:pre-wrap">OASIS and the VIRTIO TC value your feedback. We so=
licit input from developers, users and=C2=A0</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:none;vertical-align:baseline;white-space:pre-wrap">others, whether OAS=
IS members or not, for the sake of improving the interoperability and quali=
ty of its technical work.</span></p><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt"><b style=3D"font-weight:normal"><br></b=
></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0=
,0,0);background-color:transparent;font-weight:400;font-style:normal;font-v=
ariant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-=
wrap">The public review is now open</span><span style=3D"font-size:11pt;fon=
t-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fon=
t-weight:700;font-style:normal;font-variant:normal;text-decoration:none;ver=
tical-align:baseline;white-space:pre-wrap"> </span><span style=3D"font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-weight:400;font-style:normal;font-variant:normal;text-decoration=
:none;vertical-align:baseline;white-space:pre-wrap">and ends </span><span s=
tyle=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgr=
ound-color:transparent;font-weight:700;font-style:normal;font-variant:norma=
l;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">Friday=
, February 13 2026 at 23:59 UTC.</span></p><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><b style=3D"font-weight:normal">=
<br></b></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal=
;font-variant:normal;text-decoration:none;vertical-align:baseline;white-spa=
ce:pre-wrap">Comments may be submitted to the project=E2=80=99s comment mai=
ling list at </span><a href=3D"mailto:virtio-comment@lists.linux.dev" style=
=3D"text-decoration:none"><span style=3D"font-size:11pt;font-family:Arial,s=
ans-serif;color:rgb(17,85,204);background-color:rgb(255,255,255);font-weigh=
t:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-a=
lign:baseline;white-space:pre-wrap">virtio-comment@lists.linux.dev</span></=
a><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(34,3=
4,34);background-color:rgb(255,255,255);font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre-wrap">. You can subscribe to the list by sending an email to</span></p=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(17,85=
,204);background-color:rgb(255,255,255);font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre-wrap"><a href=3D"mailto:virtio-comment%2Bsubscribe@lists.linux.dev">vi=
rtio-comment+subscribe@lists.linux.dev</a>.</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><b style=3D"font-wei=
ght:normal"><br></b></p><p dir=3D"ltr" style=3D"line-height:1.656;backgroun=
d-color:rgb(255,255,255);margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-weight:400;font-style:normal;font-variant:normal;text-de=
coration:none;vertical-align:baseline;white-space:pre-wrap">All comments su=
bmitted to OASIS are subject to the OASIS Feedback License, which ensures t=
hat the feedback you provide carries the same obligations at least as the o=
bligations of the TC members. In connection with this public review, we cal=
l your attention to the </span><a href=3D"https://www.oasis-open.org/polici=
es-guidelines/ipr/" style=3D"text-decoration:none"><span style=3D"font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(17,85,204);background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:underline;vertical-align:baseline;white-space:pre-wrap">OASIS IPR Poli=
cy</span></a><span style=3D"font-size:11pt;font-family:Arial,sans-serif;col=
or:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:norma=
l;font-variant:normal;text-decoration:none;vertical-align:baseline;white-sp=
ace:pre-wrap"> applicable especially to the work of this technical committe=
e. All members of the TC should be familiar with this document, which may c=
reate obligations regarding the disclosure and availability of a member&#39=
;s patent, copyright, trademark and license rights that read on an approved=
 OASIS specification.=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt"><b style=3D"font-weight:normal"><br><=
/b></p><p dir=3D"ltr" style=3D"line-height:1.656;background-color:rgb(255,2=
55,255);margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fon=
t-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fon=
t-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ver=
tical-align:baseline;white-space:pre-wrap">OASIS invites any persons who kn=
ow of any such claims to disclose these if they may be essential to the imp=
lementation of the above specification, so that notice of them may be poste=
d to the notice page for this TC&#39;s work.</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><b style=3D"font-wei=
ght:normal"><br></b></p><p dir=3D"ltr" style=3D"line-height:1.656;backgroun=
d-color:rgb(255,255,255);margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-colo=
r:transparent;font-weight:400;font-style:normal;font-variant:normal;text-de=
coration:none;vertical-align:baseline;white-space:pre-wrap">Additional info=
rmation about the specification and the VIRTIO TC can be found at the </spa=
n><a href=3D"https://groups.oasis-open.org/communities/tc-community-home2?C=
ommunityKey=3Db3f5efa5-0e12-4320-873b-018dc7d3f25c" style=3D"text-decoratio=
n:none"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rg=
b(17,85,204);background-color:transparent;font-weight:400;font-style:normal=
;font-variant:normal;text-decoration:underline;vertical-align:baseline;whit=
e-space:pre-wrap">TC=E2=80=99s public home page located here.</span></a></p=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><br><br></p></span></div>

--000000000000001eba06485ef739--
