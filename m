Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA95B33FE
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 10:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718187848; cv=none; b=YZ3yCo5K00b1jfwkL/cqYgc3IaoALJNMvkM/kd4ExrH5Pm2FJGnVfIbR/G+1V5BB43ZG9ROUKm7S8ckr7rDl1zuFnis7TSIWeNjM1BIwQ9BkYR3v//jdG/3mh2p+kVS2PBm7EUKZAcE7dmFUyhrNo+6gKnMkAgeZAbpjBcgBD6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718187848; c=relaxed/simple;
	bh=7mFODoURLaUAtWcRk40mVy50a14tdwHAjDkSTN6SFeY=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=DLBSScYq6Inlm27LpHlb3wIhAS7nbm310IzZnYPSiSSV1KVMIW7mh3u9NBBzguXMLnczHrj80IW5HUJbE0UojVetywW5iIH2X3uA2HTCVDMpEUUNJTnpYPchVEQzEafSz7LuIybez35DH5ehPCFxvtO9wfVaBHIzCJ2jLiYbEvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAkZIlUS; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAkZIlUS"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-6cdf9a16229so5010540a12.3
        for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 03:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718187846; x=1718792646; darn=lists.linux.dev;
        h=to:cc:date:message-id:subject:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MkmVvV8Fl0cWRkGmXtThbr8HqwVxokm6Df0d4LjIuOA=;
        b=fAkZIlUScS7Ok920OXGIIRFYqZ7EsvQDqAYOGPBEItSaF35yBRcrgiq1OdODnRShIo
         +wJ2vi82AXF/IJfbe7ognCyXHKPdlXk+8RLfYRMAHH34hTOA9PdtvIa2OWig9B/11iWO
         ZGmvKWRpHCYXHGT1qs5k3qSkevraTLq5juyn2Jfd0sXHjJYrbN6pKKib0y1nRG4SffhP
         Qfhe875cjYCVed25e1NEWNMEHBwXk3gDiwCXHUmjE82jQNYFjY0krR4sHv3n5E41ufGN
         R0FNw81o13JlfozTEKzz1XGCapDCemZE0BUBG2ckWGEBlUZ5m57L5i8wfmgwTceox3qi
         0kPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718187846; x=1718792646;
        h=to:cc:date:message-id:subject:mime-version:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MkmVvV8Fl0cWRkGmXtThbr8HqwVxokm6Df0d4LjIuOA=;
        b=Pq1LGTjHj2BjzWmdf09jUgqw5bPD2jk5CwH/fYGUlbIGEm62dz0kaGu12egGy3B+kZ
         Vgx9PVEpENJao1hb1lT8/Erbizkqu2V0Hp4XHfglMDzOP1RgFWy6WNZ42R1vg+d7FiP0
         0bkqb6afY1IIXhIjP+oEigw+NuU7OGHLwStQR0kun8NLuP6HALuiCpOGkEzJ8qUWyy9n
         5PMPnnQ+CoUuLwxedNCcLZXnFKjym0ofgEXqUaUXy2LD8ds+aqOEWXfDrJ20LURGAoDT
         lKWjCiDX6lSa3PjXcfjfq/SRDDIIp4XsXM0AmJztF81vMmP5ztWZ/0HWdROWA+vhbwLl
         uQrA==
X-Forwarded-Encrypted: i=1; AJvYcCW9F8JPBflXbK7okycM0iQ0VTbMJ893B4qZxb3wGSxCbyzIDK+dMO/w1W5qabIBIfyrznMEmB8asAAvg6YIrhBa3PvD9faS1i9Iic5VOnk=
X-Gm-Message-State: AOJu0YxOqZLzahmP+aYJ5uHCJwKMd+XEk+OsBn8COeLUbIKwyzkggJ6L
	QIA7USpCB1ktDEdA1mEvfSJ8FMvCM8nx3zSuajS6OMSkUcCZX+vb
X-Google-Smtp-Source: AGHT+IHeSYXyHgQWvPwhGjs2PhkiWjmNRAKGzhboBaxBRGffzSIvNYfbVRAsF6RFsDe+BMKQ/UhDZA==
X-Received: by 2002:a05:6a20:9146:b0:1b4:5605:dde5 with SMTP id adf61e73a8af0-1b8a9c877bemr1593145637.52.1718187845866;
        Wed, 12 Jun 2024 03:24:05 -0700 (PDT)
Received: from smtpclient.apple ([45.62.172.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a75f0053sm1355544a91.13.2024.06.12.03.24.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2024 03:24:05 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_1FFE21CD-9BF5-423F-AD08-9DF23756D57B"
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [RFC PATCH v2 0/2] virtio-vsock: Add support for multi devices
 feature
Message-Id: <EFDCCA2C-57D6-4DAB-AF6E-E4F1E497FC84@gmail.com>
Date: Wed, 12 Jun 2024 18:23:52 +0800
Cc: fupan.lfp@antgroup.com,
 mst@redhat.com,
 niuxuewei.nxw@antgroup.com,
 sgarzare@redhat.com,
 virtio-comment@lists.linux.dev
To: Xuewei Niu <niuxuewei97@gmail.com>
X-Mailer: Apple Mail (2.3774.600.62)


--Apple-Mail=_1FFE21CD-9BF5-423F-AD08-9DF23756D57B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

> Hi,
>
> I am writing this email to request adding a new field for virtio-vsock =
spec
> for supporting multi devices feature.
>
> The multi devices feature allows the guest to have multiple vsock =
devices. I've pushed
> the first version of the patches to the lkml[1].
>
> v1 -> v2:
> - Remove implementation details from the document.
> - Rename the feature to "VIRTIO_VSOCK_F_MULTI_DEVICES" from =
"VIRTIO_VSOCK_F_MULTI_DEVICE".
> - Rename the field to "index" from "order".
>
> Thanks,
> Xuewei
>
> [1] =
https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.=
nxw@antgroup.com
>
> Xuewei Niu (2):
>   virtio-vsock: Introduce "VIRTIO_VSOCK_F_MULTI_DEVICES" feature
>   virtio-vsock: Add an "index" field to the config
>
>  device-types/vsock/description.tex | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> --
> 2.34.1

Please ignore this version. As discussion on [1], an introduction about =
multi devices will be added in the v3.

[1] =
https://lore.kernel.org/virtio-comment/oxfm5jjjim3tv6q22o4mr2oidz4yljjs4lm=
adcccfbkdlrudrp@fo7wkwb2p3up/#t

Thanks,
Xuewei=

--Apple-Mail=_1FFE21CD-9BF5-423F-AD08-9DF23756D57B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;"><div>&gt; =
Hi,</div><div>&gt;</div><div>&gt; I am writing this email to request =
adding a new field for virtio-vsock spec</div><div>&gt; for supporting =
multi devices feature.</div><div>&gt;</div><div>&gt; The multi devices =
feature allows the guest to have multiple vsock devices. I've =
pushed</div><div>&gt; the first version of the patches to the =
lkml[1].</div><div>&gt;</div><div>&gt; v1 -&gt; v2:</div><div>&gt; - =
Remove implementation details from the document.</div><div>&gt; - Rename =
the feature to "VIRTIO_VSOCK_F_MULTI_DEVICES" from =
"VIRTIO_VSOCK_F_MULTI_DEVICE".</div><div>&gt; - Rename the field to =
"index" from "order".</div><div>&gt;</div><div>&gt; =
Thanks,</div><div>&gt; Xuewei</div><div>&gt;</div><div>&gt; [1] =
https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.=
nxw@antgroup.com</div><div>&gt;</div><div>&gt; Xuewei Niu =
(2):</div><div>&gt; &nbsp; virtio-vsock: Introduce =
"VIRTIO_VSOCK_F_MULTI_DEVICES" feature</div><div>&gt; &nbsp; =
virtio-vsock: Add an "index" field to the =
config</div><div>&gt;</div><div>&gt; =
&nbsp;device-types/vsock/description.tex | 28 =
++++++++++++++++++++++++++++</div><div>&gt; &nbsp;1 file changed, 28 =
insertions(+)</div><div>&gt;</div><div>&gt; --</div><div>&gt; =
2.34.1</div><div><br></div><div>Please ignore this version. As =
discussion on [1], an introduction about multi devices will be added in =
the v3.</div><div><br></div><div>[1]&nbsp;<a =
href=3D"https://lore.kernel.org/virtio-comment/oxfm5jjjim3tv6q22o4mr2oidz4=
yljjs4lmadcccfbkdlrudrp@fo7wkwb2p3up/#t">https://lore.kernel.org/virtio-co=
mment/oxfm5jjjim3tv6q22o4mr2oidz4yljjs4lmadcccfbkdlrudrp@fo7wkwb2p3up/#t</=
a></div><div><br></div><div>Thanks,</div><div>Xuewei</div></body></html>=

--Apple-Mail=_1FFE21CD-9BF5-423F-AD08-9DF23756D57B--
