Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792652868;
	b=tgvgx7Hl4YVF1Dk6b+ADwsXr4mDE7HuhzuHnH9IHFzgRtoSzlDhncWzglg9pgCKQkRQa
	 QGm0G+tVn4WDYm90fxF8CYJb6LEVYG2m0o7eA2Kp/KB26TT6rBcfKv9WArQiHCtnhe+nQ
	 V5ayItGTWQi5DQdcMWgsJj2TavLRnCumMRxrAcLdVDwDMlMfy+lmvlmK6URVHbvdYNkti
	 FVEuQ0bSUuE9fao/oL6rcyqHO/Vkx9rwUPgzC4FTzhpoztws8bLuI4h6v/gqz0vvdvWCp
	 NrPk1JM/V8TBH68M+5YFoWQzm9tvYHG31GBTQ10DWNATXFI6hG8NDuJ+i/KGkAPTlQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792652868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=6aPDk7J3MEkbGraFJP0g1LEVOgcttgZaX8CKrmbNGLo=;
	b=oqUqAOoU0pl5/5Xy/6/GKPYEZPUxiRpC8QGq7GZQcjF+rQoJJSkGGs4cHZsZNXRnhJ5G
	 Q27iS9gcs7DHZ8S7UjpdFLvH1djYnCWmBpK3pFQd7FSajR+IMSHGLKsH3/DmltTeb8Ga/
	 3H//3UcigsBe/9A55P1O14M+wWXV9UJNuWHqYftCDcB4QgXfCihVelQDkUOtrjSaTQIzF
	 VWVc+ydfrzvgICAn83pG1rNoOBZ8R9sf47U0cm9rrg4W1/g3KBY1po698aGlmO7Q6PFFV
	 u5YO8YCFxtblh12okr77bulL6ir+G082rRIGIJmDpiOv7d4e5hhFUHqSVq7EaH5MOPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q20UWjr4;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B734606A319
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 07:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B734606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q20UWjr4
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0d63f60bcso13392797b3.3
        for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 00:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792652867; x=1793257667; darn=lists.linux.dev;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6aPDk7J3MEkbGraFJP0g1LEVOgcttgZaX8CKrmbNGLo=;
        b=q20UWjr4BOhejldyrEDsOPhKef322nQCE54slWM3gueXQWOl9BvlmT/yk+1u4YMl5z
         iqjEooAvSeXc+7Buo2QUQ4zyTRtKvKeJBPYkxgt6DPK486wsf3MJpUQdMd4PvubZ5Z3e
         xTtqIBGQVCNWyXEO3BMvMVQbxap/s7INIgw7ABub3UlR/M5ut1Wn15eFXCOFpAGMGvuZ
         Y6GIH63vP7mtw3SBqIcyWqVje/HpMYi263N636kjZNppw7OEB4VRrbgsV9Jzg4FH3LfT
         +CkYiAX3vc6BUmu2R+ycVibyzyVVFZ8FGiJWV0jB7L5iJI6ytVZE6qUjB8cNikN1n9NK
         HMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792652867; x=1793257667;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aPDk7J3MEkbGraFJP0g1LEVOgcttgZaX8CKrmbNGLo=;
        b=gq+1GlccwB2jkKrpFghovYk7b+ROkWGxO5nAbec3dfE/bPY8zboy2oapd0tH9zCo0R
         lFwMcfkFD8SJoiMEsQNhB/8VfunYdoV1m1BYhRIA8rx59K8ok+sSs69w7Dl4sNDS4gev
         UvaI/edd1SdfB4iDf48a1Xz+Q8FJgPh52NaYgD4mwUGE2ft+JJQ4FYaKh1+LEhC3FuU2
         D+7mp3NMjR5k4wjWUv14JlchNM5IYnpzAOHxPrjxmvzDcOgjnzVo+TjDGyAEDS1Ivql0
         TZeIEvOdCqFGnJPvmQBnytDY8ozus6QalFpPJ9GIZ4lL1oe81RvkXB7da4mge3A9gUvm
         k3hA==
X-Forwarded-Encrypted: i=1; AKwUvBxyqRpYOHGwdjY1zFDCdEc7zLv0BGBRtY/Ya6IxwQTUMU/ZhmO29QJMsgnxBgeBPkNeczN97UUm583CaeBEmQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKHs6H0KLWXJ30bf43PLzm2RuFTm/FcT5DZ1naGjkMtUWP9nG7D
	Q3MNCFE8/nRr8hB/+fKsKSXX2il7z+8UspfdHtsy0RvhFjwg2huPLI6T
X-Gm-Gg: AYBFou2XbqhPMEBk0n3E3+hFDhlYJkcdedjrAwmETYit4H7dUpID0rfskORfIuUqxAX
	akgkeClSBV4cHVimMj9urfGelhD0ZquRaAH3xhImgv73/a1KomtKA1k7Qh+p7P3/8EO6BZ7wlRV
	GdUiH4g/dyshey6WBvBIsux/1FEC8u7GQ/+HAm4eOcxidWbZ9VGMv45dlgjxXv4SFi9V9Yrn7X4
	92zOG7tzovcaNTTCyxItzL3OeJNmNWLrcAlysYI1QV4IUv76KGxg93LW2qQPRPAT4wZIfsTgWh+
	Yv3ziKgaiRNV+QE/OXTijDx5wMQWGZNFqt/WwXMB75eEs3DtYt0PN1VF+TeBqBXp3FWArkZ0mhh
	oS2fpqEEH7Ak2AyqQ8mxZ8gT/VWsPAvuUTIY/4Us8BljYSMjwa5D6n68IVpcgfQZXF4Ym1QN+cL
	PIuy1osQoVqIh13H2AsBDy+xgnuTn4DmlhasPq3UQaM2TBQO5imtSsnDqKfKmxustt0sQBUBBVd
	DpqBpeGhcDFzIH8PhCgvTknixyBHYW9/CREsAlmpykhCnRx2x/TnwBNBMI9
X-Received: by 2002:a05:690c:7283:b0:8a0:76e8:c738 with SMTP id 00721157ae682-8b13394e7f8mr28397987b3.0.1792652867286;
        Thu, 22 Oct 2026 00:07:47 -0700 (PDT)
Received: from [10.138.10.6] ([149.102.242.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1301b77d0sm22050397b3.45.2026.10.22.00.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:07:45 -0700 (PDT)
Message-ID: <26e6efbe-abc0-452d-a682-611cf91e41b8@gmail.com>
Date: Thu, 22 Oct 2026 03:07:41 -0400
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Hilber <peter.hilber@oss.qualcomm.com>,
 virtio-comment@lists.linux.dev, Jan Kiszka <jan.kiszka@siemens.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Trilok Soni <trilok.soni@oss.qualcomm.com>
References: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
 <d4a11a65-ebed-41c9-8482-cf0ec94dce79@gmail.com>
 <20261021154801-mutt-send-email-mst@kernel.org> <87mrs62vzj.fsf@redhat.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <87mrs62vzj.fsf@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YGrL1tIk0QQJ7c2LrTZGkPJb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YGrL1tIk0QQJ7c2LrTZGkPJb
Content-Type: multipart/mixed; boundary="------------tlldla5YVuAzGJUi13G0R3Lo";
 protected-headers="v1"; hp="clear"
Message-ID: <26e6efbe-abc0-452d-a682-611cf91e41b8@gmail.com>
Date: Thu, 22 Oct 2026 03:07:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Hilber <peter.hilber@oss.qualcomm.com>,
 virtio-comment@lists.linux.dev, Jan Kiszka <jan.kiszka@siemens.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Trilok Soni <trilok.soni@oss.qualcomm.com>
References: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
 <d4a11a65-ebed-41c9-8482-cf0ec94dce79@gmail.com>
 <20261021154801-mutt-send-email-mst@kernel.org> <87mrs62vzj.fsf@redhat.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <87mrs62vzj.fsf@redhat.com>

--------------tlldla5YVuAzGJUi13G0R3Lo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/22/26 00:35, Cornelia Huck wrote:
> On Wed, Oct 21 2026, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>=20
>> On Wed, Oct 21, 2026 at 03:25:31PM -0400, Demi Marie Obenour wrote:
>>> On 10/21/26 14:00, Peter Hilber wrote:
>>>> Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
>>>> Firmware Interface). QPSFI devices expose functionality across SoC
>>>> subsystems through a common Virtio-based protocol. There are no plan=
s to
>>>> standardize the devices.
>>>>
>>>> The Linux DCP display driver series is planned as the first user of =
this
>>>> device ID:
>>>>
>>>> https://lore.kernel.org/all/20261015-jshekhar-drm-msm-dcp-v1-v1-10-4=
8aad0fe4f72@oss.qualcomm.com/
>>>>
>>>> Device ID 51 is already reserved for the Virtio HAB device:
>>>>
>>>> https://lore.kernel.org/virtio-comment/20260702140939.3535968-1-zelo=
ren@qti.qualcomm.com/
>>>>
>>>> Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
>>>> ---
>>>>
>>>>     v2:
>>>>    =20
>>>>     - Rename the device from "Snapdragon device" to "QPSFI device".
>>>>    =20
>>>>     - Refer to DCP Linux driver patch as planned first QPSFI user.
>>>>    =20
>>>>     v1:
>>>>    =20
>>>>     - Was posted as "content: Reserve ID 52 for Snapdragon device":
>>>>    =20
>>>>       https://lore.kernel.org/virtio-comment/20260826115504.1955-1-p=
eter.hilber@oss.qualcomm.com/
>>>>
>>>>  content.tex | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/content.tex b/content.tex
>>>> index 243ce2dde36b..7416939e67d3 100644
>>>> --- a/content.tex
>>>> +++ b/content.tex
>>>> @@ -805,6 +805,8 @@ \chapter{Device Types}\label{sec:Device Types}
>>>>  \hline
>>>>  50         &   Video encoder/decoder device \\
>>>>  \hline
>>>> +52         &   QPSFI device \\
>>>> +\hline
>>>>  \end{longtable}
>>>> =20
>>>>  Some of the devices above are unspecified by this document,
>>>
>>> I think it would be best to have a single ID for vendor-specific devi=
ces.
>>> I believe most of the ID space has already been used, at least for vi=
rtio-PCI.
>>> --=20
>>> Sincerely,
>>> Demi Marie Obenour (she/her/hers)
>>
>> Sounds like a good idea to me. And then qualcomm can do what they
>> want, like check subsystem id for pci or whatever?
>> Only issue is there is no way to distinguish for mmio/ccw.
>> Maybe, add vendor specific id as first e.g. 8 bytes ro in the config s=
pace?
>> Peter?
>=20
> Using some information in the config space looks like the most flexible=

> way to me. Are we still happy with how the device ids are organized in
> general (i.e. when do we want a new one, and when do we want to extend
> an existing device?)

For a platform device like this, I'd prefer to pass the information out
of band.  After all, this device will only ever be found on Qualcomm
SoCs, and presumably the kernel knows exactly which PCI device is
supposed to be the QPSFI device.  This means that the kernel can just
special-case it.

Would it make sense to put this in the ACPI tables or device tree?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------tlldla5YVuAzGJUi13G0R3Lo--

--------------YGrL1tIk0QQJ7c2LrTZGkPJb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmrZtj4ACgkQszaHOrMp
8lNhvRAAkhJjgE6AExXFfX8hgTF35frF1M6MeZdczhoPFCJJ0cBaH+PHG8GFnInf
sM+VHJKrhk6/+vmR+j7Hy19VlCdUcpDBOsbemOxppNB9UGYipeuyeGaxC0nSDOnH
1hPs2YTcK5bnxLr98OBDfu1bEKTb/q1UyqN56t7cqE1Cdi43F9YqmIf7Uq76iA9u
suiYoViJBvcDbGhbEbu2wn48m4qrUwv4N95btHNuqrBnFHytAwtCQvbL5DHldU2A
b8rZbHn5DDiGdSgeFxLFma6/1xv62ukL4ciVFs+svVn+CQAWOhsn6hOUGthTdbLX
usEIF/r1FKfux0BJigcAFPmyQgDZSUWPi2kPCr9lSNZGOCq/Qo8GIR0xPvYioPRH
vaPN6imtHUXROzVoopjaEg9Vs4L/Aom33pbC6W5YA+P3Zt2/hEkbT2ZqYALQ/hEp
8xjg0NvpPCPtdxJLuBB+DivnCvhKv7xqwzcb7cWzwILw9VavgGWGo7/OcqDxuR8e
NUOKmRfyxk6XCLpeWJ7GQM6WY6Y+zOl2mgTZkmjE0T2J2NOgTVr+y1iBmpS7N3vj
vu6otQ6QeMyvZynn+esAW3ozfQxF9x4Q0Y/BdrK6kk65y0pgdUcvtRidQ5FD9tlc
Pm4qMDrHOJVXSSrHenwIA9+bqArRcsW7GDSDi2A8RH+ddD2NMWA=
=QXSa
-----END PGP SIGNATURE-----

--------------YGrL1tIk0QQJ7c2LrTZGkPJb--
