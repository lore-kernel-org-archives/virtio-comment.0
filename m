Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792734020;
	b=LDE6+otW/Da8b/gWlBbOL/HXOSoI/N2ALas+vqNycBVbZNXl0OfG76KJp1KBaAy5lcdY
	 hvyLVXrGDOirUuCQh/0rLhugpfQlsAxWJSSbYWJfWd+aThf5IPedWr6tFE9jDqe686FEQ
	 q1W57iRlVFqKnuqMhXWspWYICC05c934ZhbtGvKb6eSbaofYBo215+Fw52vryIpU4s5pT
	 zFCjQ2lC8Yf4i/Dknf735Nhql1D/9EWj6S8djzJluT6r4SvrKc0s74VWU0nLQV2Jx7t9k
	 72/hj/1dnmM1xiBVh0hsM+H3rz1bGrWzucI49Skf3UIpQPJeoViZQ9DuOTVeYt+yTFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792734020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=tXPNZ366ZXiBAMI9Hb2osw4YjfyLabt6ML3sNzfNn/c=;
	b=GgoY5KEgaljsMiTSH3qaVaJRCfe6kn1t/LDHNBG7CjPTHElzi6RvE7rAijl7AP6ZyV6T
	 ESU+oExbGJ8nSVLoN8JTeOsiFgrvq9ViBlZD1bv8S3uUC0vLrqn4HYOSsVFrIm5Y519d2
	 dn6CMx1PdIOyOCmBc+13M9FoqI4Xo40F56JFStvxpRMfoWWvIvhT/8jIuvD6/7W2nc+ah
	 9wIZANU213NurakLpbCLoL59MJ99FUCnJ0Hc9Oy3AWS7zuY9jyQr+yIrGVk9Vsjqy+CA2
	 r+rAccF15AM6rCZbJhRR9wdsBCmIzhGW1TJcVoaB59QV7YjhlNXdtH1vpIxI7VlS4pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="dWjbvwl/";
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687A3606A31A
	for <virtio-comment@lists.linux.dev>; Fri, 23 Oct 2026 05:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 687A3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dWjbvwl/
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b0a28a720aso5322557b3.2
        for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 22:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792734019; x=1793338819; darn=lists.linux.dev;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tXPNZ366ZXiBAMI9Hb2osw4YjfyLabt6ML3sNzfNn/c=;
        b=dWjbvwl/q9cvxLEZ+Bv+BMq0vzrcb8UN+h6cPuUH+T/+c6vJaPikw7tI45fckNx2Pf
         xyv4XxU2E42Br8XI/GEbKlMJS5JBk4xb7rtrLF4cKR5e57aFNPZhKHsxG79pvkjJo8Ss
         c7vTZBT1zplPcKjAlCYp7dWRHcYYaz73gUcSPK7rjOd7rHUXVkLnKBosmmUtm2hBkh+8
         Ec6bKFY+n6nSyr+BSFcIBJUsYxqzkxBnCFljiPix9PEozUwsBsZrBR8PUPWHcYqv2DdB
         6n+98Lf6kmPs5tswoz1/hHY7hvtJ/oG+8BhjdLSrTLsTfQMCtAZSRkqSytodtX2TNNmh
         Eraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792734019; x=1793338819;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tXPNZ366ZXiBAMI9Hb2osw4YjfyLabt6ML3sNzfNn/c=;
        b=DZBA8rU8sgl6zn4LoblwSa4DJR65dV15Z7KFLexxr5XNT52XrsvXKd5AcXNwrLS4Uc
         Hj/rcXsfEJUr21Z6rX+SuXqhD48lRGzcWmZLixl5jgUs7LvGrSOz4KXcpZeZV0mX50H8
         3cktBa0AEdO3Dy0fytPbvmkUIeFttPQMuau7790aP2g44acHJQS78+14g8iLClgtdpw7
         NdyjWGmJMR1t8CEx873QidIenueEQlOgzUeQekM7cv8+EdRGaPoHeVL+xXvvf2pl6k5A
         SpnjAE19T6D3LFlqzgD8gypuviz768lUcpzgXe554wphqxHk1a4HyxHOQysNFUiXOgdE
         ruRQ==
X-Forwarded-Encrypted: i=1; AKwUvByIuUHVXe/goR/z3LH3t0PVl9TcNI/qnqDM0cRLo/YzwxjkOcWZUZmdMRdd011y4HKjNbqm2PlLDUYT0H3A3g==@lists.linux.dev
X-Gm-Message-State: AFq9FYIhCgdb3TImesNzVOuvTJ+CQdqs6wOtFRSmOFyQScD29/JDL2wk
	iHhGmdJoJZixVx0rPlPSbuKL9MG+k06OU4UuxKDKSGfGc/RIlP/6vNGg
X-Gm-Gg: AYBFou1v/L6buLZewdbeuVBKoS5yer1p4sRXviQkwbHkZ3jqCtNVTg7o+vfWw4apUbB
	KamLNJyQfxZafxi1Hwl/Gwn7tnq9oQVUmAM9rVVU0k3eDI6q1Myvw9gEJZaF7WMRamQX6hrAr3f
	jLkwQ54e/8xXTPa5XX2fqfriILd8QU8BbqPbycr8SOISPWY/Y7D9VpA02rC3wQTVfmolRmhIknh
	xN6SjFEqaqud34j0e0jBy/GIBahqvhaZbAOepyBPlxp6cs1GuzPm5mhacu0EzxVUlhMc4/9AdkL
	72rmnDSLkc7ebxExirK8LdFiwTFGmr9FTOmUnOx/u2po40AWpj9U3OiSqwO/zzKVV55OvF05brv
	VdDKWHXxQFBe3zxvDAek+e8k7AJweAiLFb5iGmsmEV8WZ4KeebOxwPv1RAiju1x26gOdIwxNPds
	hX9uXdHtZpzhHeWZ/Cdx8WPtKJ5bdWv/r/TkOqXmsWiR72dANqBnfJGKrGCGT5PRAuOegoi1MMa
	dyavEkgjUyfvpXUTiRjGUByub0LusSQ/UZD701+H5FmUNesVMrXAwBBx1HG
X-Received: by 2002:a05:690c:6e84:b0:8b0:cfe6:29b2 with SMTP id 00721157ae682-8b157d7dec1mr10724347b3.41.1792734019311;
        Thu, 22 Oct 2026 22:40:19 -0700 (PDT)
Received: from [10.138.10.6] ([149.102.242.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1561c5e46sm8892017b3.43.2026.10.22.22.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 22:40:17 -0700 (PDT)
Message-ID: <fe70886a-b119-4302-b35d-f99dfab4b018@gmail.com>
Date: Fri, 23 Oct 2026 01:40:13 -0400
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
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Hilber <peter.hilber@oss.qualcomm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 Jan Kiszka <jan.kiszka@siemens.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Trilok Soni <trilok.soni@oss.qualcomm.com>
References: <CAAjaMXZgKGWL0dJJSh74Pf20EezY8zPOsSg1aNkp_ssvXuP7BQ@mail.gmail.com>
 <20261022091645-mutt-send-email-mst@kernel.org>
 <oinsf3ecwsrgxuff2m4q3qsjzfg3quldsqv3wjnlzxqbiyzhrz@m4s7bjwc2fsf>
 <87h5id3he3.fsf@redhat.com>
 <SJ0PR12MB6806C8FCEDA2E3D40CA82EB6DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022114028-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806C7432951E2DB6CB3C945DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022115837-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022122727-mutt-send-email-mst@kernel.org>
 <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
 <CAAjaMXbFY8d_H6YJSbb+2ycx-Bh7wBym0UpCy2Z4XsftkhQSzA@mail.gmail.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <CAAjaMXbFY8d_H6YJSbb+2ycx-Bh7wBym0UpCy2Z4XsftkhQSzA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UVV1TY6iYkRdKOeNagf0sK0B"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UVV1TY6iYkRdKOeNagf0sK0B
Content-Type: multipart/mixed; boundary="------------2Un0r7lRRN4gF69oH13jv00h";
 protected-headers="v1"; hp="clear"
Message-ID: <fe70886a-b119-4302-b35d-f99dfab4b018@gmail.com>
Date: Fri, 23 Oct 2026 01:40:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Hilber <peter.hilber@oss.qualcomm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 Jan Kiszka <jan.kiszka@siemens.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Trilok Soni <trilok.soni@oss.qualcomm.com>
References: <CAAjaMXZgKGWL0dJJSh74Pf20EezY8zPOsSg1aNkp_ssvXuP7BQ@mail.gmail.com>
 <20261022091645-mutt-send-email-mst@kernel.org>
 <oinsf3ecwsrgxuff2m4q3qsjzfg3quldsqv3wjnlzxqbiyzhrz@m4s7bjwc2fsf>
 <87h5id3he3.fsf@redhat.com>
 <SJ0PR12MB6806C8FCEDA2E3D40CA82EB6DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022114028-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806C7432951E2DB6CB3C945DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022115837-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022122727-mutt-send-email-mst@kernel.org>
 <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
 <CAAjaMXbFY8d_H6YJSbb+2ycx-Bh7wBym0UpCy2Z4XsftkhQSzA@mail.gmail.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <CAAjaMXbFY8d_H6YJSbb+2ycx-Bh7wBym0UpCy2Z4XsftkhQSzA@mail.gmail.com>

--------------2Un0r7lRRN4gF69oH13jv00h
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/23/26 01:37, Manos Pitsidianakis wrote:
> On Fri, Oct 23, 2026 at 1:39=E2=80=AFAM Peter Hilber
> <peter.hilber@oss.qualcomm.com> wrote:
>>
>> On Thu, Oct 22, 2026 at 12:29:31PM -0400, Michael S. Tsirkin wrote:
>>> On Thu, Oct 22, 2026 at 04:20:51PM +0000, Parav Pandit wrote:
>>>>
>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>> Sent: 22 October 2026 09:32 PM
>>>>>
>>>>> On Thu, Oct 22, 2026 at 03:49:51PM +0000, Parav Pandit wrote:
>>>>>>
>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>> Sent: 22 October 2026 09:12 PM
>>>>>>>
>>>>>>> On Thu, Oct 22, 2026 at 03:35:51PM +0000, Parav Pandit wrote:
>>>>>>>>
>>>>>>>>> From: Cornelia Huck <cohuck@redhat.com>
>>>>>>>>> Sent: 22 October 2026 08:35 PM
>>>>>>>>>
>>>>>>>>> On Thu, Oct 22 2026, Dmitry Baryshkov <dmitry.baryshkov@oss.qua=
lcomm.com> wrote:
>>>>>>>>>
>>>>>>>>>> Let's define some standard way for the vendors to declare that=
 this
>>>>>>>>>> device is "Qualcomm", "NXP" or "hobbyist which doesn't own PCI=
 or USB id
>>>>>>>>>> block".
>>>>>>>>>
>>>>>>>>> Are we able to use the first <n> bytes of config space for that=
? I guess
>>>>>>>>> that is the only way that can possibly work for any transport.
>>>>>>>>>
>>>>>>>>> Then, maybe something like one or two bytes for a vendor id (in=
cluding
>>>>>>>>> one for "testing purposes" or so), and the rest to be used in a=

>>>>>>>>> vendor-specific way.
>>>>>>>>>
>>>>>>>> device ids are independent of the transport.
>>>>>>>>
>>>>>>>> but Peter already announced that:
>>>>>>>> " Reserve a device ID for QPSFI devices (Qualcomm Platform Subsy=
stem
>>>>>>>> Firmware Interface). QPSFI devices expose functionality across S=
oC
>>>>>>>> subsystems through a common Virtio-based protocol. There are no =
plans to
>>>>>>>> standardize the devices."
>>>>>>>>
>>>>>>>> So, I am unable to understand why should it be part of vendor ag=
nostic virtio spec?
>>>>>>>> Why a vendor specific implementation of device and driver is not=
 sufficient?
>>>>>>>
>>>>>>> I don't really think we should vendors burn up device IDs every
>>>>>>> times they want something non standard. Reserving ID 52 as
>>>>>>> "vendor specific" so vendors can go wild sounds good,
>>>>>>> but a bit more needs to be done than just reserving:
>>>>>>> document what is expected, e.g. no auto load based on ID
>>>>>>> alone.
>>>>>>
>>>>>> First, you indicate to open virtio to vendor specific extension. T=
his is huge in itself.
>>>>>
>>>>> Not as such.  It's just reserving an id. People always do things li=
ke
>>>>> implement some crazy spec saying "we will upstream later" and later=
 they
>>>>> do not.
>>>>> And then the ID conflicts with a standard one. Suboptimal.
>>>>>
>>>>> So if we can tell everyone "always use this ID, and use platform
>>>>> specific tool dor discovery, until your device is in the spec"
>>>>> then that's not too bad.
>>>>>
>>>>>
>>>>>
>>>>>> that should be first discussed.
>>>>>> If you suggest this, may be every device type should be able to ex=
tend, and not just demux at device id level.
>>>>>>
>>>>>> Second, one reserved id is not enough, because a given system may =
have multiple such different vendors devices installed.
>>>>>
>>>>> I don't think we should care.
>>>>>
>>>> than all 0xffff as one experimental id once for all is good enough.
>>>> than vendor FOO, BAR, differentiation is not needed.
>>>
>>> I don't think we want 0xffff, a lot of systems treat that value as
>>> special, pci comes to mind.
>>>
>>>> And if it is not for experimental purpose, not sure why would vendor=
 stop at only one device.
>>>
>>> They can reuse that id as many times as they want and differentiate
>>> with a device specific or out of band methods.
>>> First X bytes of config space was mentioned. or whatever.
>>>
>>> We can add a recommentation maybe if vendors desire that.
>>>
>=20
>=20
> Hello Peter,
>=20
>> Thank you to everybody contributing to the discussion and to the conce=
pt
>> of a vendor-specific device.
>=20
> I'd like to echo the sentiment that it unfortunately doesn't seem
> necessary to call vendor devices virtio at all.

It acts like a virtio device, but otherwise I agree.

>  > Just for clarity, Qualcomm intends to
>> upstream Linux kernel drivers for this new device type, so would
>> definitely want to use a registered device ID.
>=20
> But no upstream specification, correct? There's no point without an
> open device specification to being included in a specification. People
> can only implement frontend drivers for this vendor device, and only
> by reading the upstream code - no spec to follow. Similar to a vendor
> SoC in concept.
>=20
>>
>> In case of an in-band approach, I suppose we would then have an explic=
it
>> vendor list in the spec where vendors have to register?
>>
>> Best regards,
>>
>> Peter
>>
>>
>>>>>> So why to bend things so much and re-invent the wheel?
>>>>>> Why for say PCI transport's any vendor and device id are not suffi=
cient to indicate a vendor and device?
>>>>>>
>>>>>> and if so, why to even document it in the virtio spec?
>>>>>>
>>>>>> I guess, I am missing the basic motivation part.
>>>>>
>>>>> For the virtio spec? Above. For Qualcomm since they decided never t=
o
>>>>> upstream - donnu. Don't care much, either...
>>>>
>>>> ok. so yeah, let vendor's platform device be in the vendor's OSS zon=
e.
>>>
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------2Un0r7lRRN4gF69oH13jv00h--

--------------UVV1TY6iYkRdKOeNagf0sK0B
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmra8z4ACgkQszaHOrMp
8lP0gQ/6AwB/bQrI8c+66nKLbpNk6+H9N5u50rSec5yjizwBT6doVl8GZe08MoFI
a7aHXA817qz+h4gES4hkylgw/7x6v62sMS2//hRR6bwtWF5NJOJDqnL941vGtD6B
xnLsnrY6KmtxpugVX1gijKyev5/csGiHWJe6fW1dQsvVfZS1c83xJ3D0DRFaJ8VS
vs8Qmy73uVCriqHXVdiuPkag0SzM5ph2dO7oQod0seNdgT+jne5ATpVYMLRqOZze
Dc+PkqhcrXvon74ly16e7usGCDZcUUkFsBGgypZXmt885lYd0e1yc1LCPHblL6iZ
d+kkpEssNBqZkux5Xoq4+yaFpxZhwAN9IvPVMFY1y2HxRvriS1bXz8OTS69jGDlR
gFhHYI/9QFweHsk2mw9CjSJTdFYJtlIoq/t7i7vGNi0/9N5ZjyHmkc82YnE9c8PR
hllTRbNPP7D+9vlt2XBJOu6p5+FxyXEvcMXQEm72t298DYIWaCFTsUVr5NGZQYnH
pQgw8VirOsljm3DP98Ubmg9x6UHtkhyCqFTZdCL/YnK5eaJT6qLIHlWH4Rz68ggF
wadS9VEdvOQMQohep+gKCXgkLEbpwRc1b84RKG0jM2wCE4jpcbPV3yZXdlw28fXf
BxvUHcSHxqKTebxfpATimqja7rivipSRFyXRN/1mNtMGddTIDYk=
=XxzO
-----END PGP SIGNATURE-----

--------------UVV1TY6iYkRdKOeNagf0sK0B--
