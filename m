Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3AB3126A9
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 13:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772025005; cv=none; b=SxhJN3dw1lTkN9nzAihRfZpGV9zGxENlak2jWOJNNzpa7lErE/G216UXyAk/290YTMXxUZYsnbOY8XfIeEtZ3cUOwWcI1q7w3/aXZUK/TXlDUuiC46SJ6u+OecV41LEsxLvE51tNHbtJfDWQ3wnP1Slcut54rEc3a9BaZYaChvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772025005; c=relaxed/simple;
	bh=ajqiW7DBCEaEYKWpKm8cCJFcEopto9faxcgP6BEpcVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HzkjUOxtKMEAJ0xBvifKzzkZS1fUbKJOGoolrTWiBlygx+TTZSjHPUKedjJFgDjvgxlaEbsj6+W4CFN5m/3cR8UJy6cH1KRc8vj43ztq+NDBodsaE4ocsPpgSuT1OWiR/mTuqRJTMI9v2sxRN/b2ZHDjMcKtZOE0PoQf113BM0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWegGqio; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWegGqio"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79628fb5c05so53052687b3.2
        for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 05:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772025003; x=1772629803; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FjC3Ytl1Gw3UJcW82lpgqzx+0pAfNSjaSJeskinyHBs=;
        b=mWegGqioXaEYt+UUmDh0uPAM1KcMkUuR/fD7jYnQvMIcbObxCxH5wWxbWOuIJ2b9cE
         5D9FeqW73+4TScoJWwn0B+KDbauXXh9LpQDr4roeM+65fkCrrZZbZo1sOIc9jiRhTPEa
         R1NVbjCpK26Gejr027nrl6fdd85Ewwh2vMboCBo1OSmuXP4v8O+iV+ZyeTy4K1UY4qKT
         hVmsl4nwqJRrStYv5NnTDyUkQj720nxxLkNs/m8mZiP+RgBHrL4KZ4kpxQn+Uq3ugmDA
         ZyO8jje1xgWgiywzMQACCluSJqBhVZNDDwn0CamYwdwbADZ2A08Hr6SSeQDYZHulw0QD
         uBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772025003; x=1772629803;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FjC3Ytl1Gw3UJcW82lpgqzx+0pAfNSjaSJeskinyHBs=;
        b=JKx/pWid9by+JCbLEmzDKM/oONrp+dRhkoOh5ZjNCQJD4o0Sf6Ot54lOz6/rPwPmL+
         lbtjjqZV7S0a9uYfhexjiHx/Mpskiy2qLBFfHrvaNxPm1fJdGtTwrEqF0dWdSof3RW+j
         xuJyo0oWlMuXBvtJ3BdN09vp1tMRfhtwuC97MMlT+a9TovhVkvjDytDgrGt316RVJ5VP
         3p0LN3bXSp+Z3oOOkyNjMTphunTuHL0MZES/KkLJ+MDlfuj2XNUEyHusFlqivACLllB+
         EZWbz4UUU8z52tzQYZ6JBsEUBtJUchHRn89UmYABImtYFVjuGimDBwWQM+qxAVueuX/5
         yUaA==
X-Forwarded-Encrypted: i=1; AJvYcCWOGIEtnYgbQt5bj+5h2Kw52fW630s6AWwmnBTAmAn0s/n8fHrhhpA9/d25dhFRiOHpHBMU6y/ZZTE0c0VVMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHT8nvW6T2STmPgtDmfnGUF5X2UZ1SNuI/OUTg+FwQjgkQvtze
	nwimnFB+ZtVIeXiv1pZdcsfsZEmVzRjIxI+hgCvhO5sSFJ2UUkXaPrP4
X-Gm-Gg: ATEYQzwCgl2Q8k4Y+4+/KbZSxmQiOt2KPs8dhR6aX9U048DiVw2QvJsszQMILnvQzbf
	WLMl4TK2ga3Rz2TuAGkgdLEYrJvyNIi/Kz/wnoDKT2jalqkPVJ6E8vwXYWXvph+4F/amBhL0uBQ
	L0sMdex+XH8a+l+cj5v2sHZ41NYg3XkdTAKzllWkNkdOF7DL5+CWhWD8UquE5D4ffn6dvSVziu1
	kLaTnXFpudcSOrQuJS3JsQKJXLbAauOlodnrnkJqu+OCaD11tjjJC78UPGZGn6g2jhlItU2Ye6O
	IMdYcz6o39/RxCUm7QypFNBgf7BGutvGqfhK5ZwTrCaDx9b8I+WbHsP8iQHIRG/0uoifl0HI7W3
	OfZwkVwruBvpZ/IiFkgMfoFXse+VfBiqnEV4P402c9KdZ8ovHjOeF5Bf8o3w88oNCKBi/RG4gLq
	LiDYf5Z419+0NpEkv0LRfe9h04L+Wl+0J114zRK45VP1QirYGhRtewEV1lgr2xTrsLm1ioTnofJ
	T+oN0HNkEwP2E+JTmeZbzZUCsBRt2nuQ/ydU+GWJQ==
X-Received: by 2002:a05:690c:387:b0:794:ef16:711 with SMTP id 00721157ae682-79828eec799mr116131507b3.7.1772025002105;
        Wed, 25 Feb 2026 05:10:02 -0800 (PST)
Received: from [10.138.34.110] (h69-131-216-128.cncrtn.broadband.dynamic.tds.net. [69.131.216.128])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982ddc5a60sm56187407b3.35.2026.02.25.05.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 05:10:01 -0800 (PST)
Message-ID: <22a5a155-f9be-4565-97bc-eb677363d1de@gmail.com>
Date: Wed, 25 Feb 2026 08:09:56 -0500
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Parav Pandit <parav@nvidia.com>,
 "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee
 <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <478DE38A-8581-4113-9467-227DA3E0D134@arm.com>
 <SJ0PR12MB68067A563A18F69033F32448DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <62E0DF94-3401-42E4-9574-02C557849D44@arm.com>
 <340e37ad-6eb6-45c2-87a5-422f247229c1@gmail.com>
 <1A56B3FE-E529-4FA8-93A8-5DBAD81A72FE@arm.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <1A56B3FE-E529-4FA8-93A8-5DBAD81A72FE@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DeC2sA2Qpbs70K0CEDJWfeSf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DeC2sA2Qpbs70K0CEDJWfeSf
Content-Type: multipart/mixed; boundary="------------tsBl0PY1mpIVfaOhqHAwPSf7";
 protected-headers="v1"
Message-ID: <22a5a155-f9be-4565-97bc-eb677363d1de@gmail.com>
Date: Wed, 25 Feb 2026 08:09:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Parav Pandit <parav@nvidia.com>,
 "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee
 <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <478DE38A-8581-4113-9467-227DA3E0D134@arm.com>
 <SJ0PR12MB68067A563A18F69033F32448DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <62E0DF94-3401-42E4-9574-02C557849D44@arm.com>
 <340e37ad-6eb6-45c2-87a5-422f247229c1@gmail.com>
 <1A56B3FE-E529-4FA8-93A8-5DBAD81A72FE@arm.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <1A56B3FE-E529-4FA8-93A8-5DBAD81A72FE@arm.com>

--------------tsBl0PY1mpIVfaOhqHAwPSf7
Content-Type: multipart/mixed; boundary="------------t4Ct6yVhK4YefJOg1xzWCd2l"

--------------t4Ct6yVhK4YefJOg1xzWCd2l
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2/25/26 08:05, Bertrand Marquis wrote:
> Hi Demi,
>=20
>> On 25 Feb 2026, at 13:46, Demi Marie Obenour <demiobenour@gmail.com> w=
rote:
>>
>> On 2/25/26 02:52, Bertrand Marquis wrote:
>>> Hi Parav,
>>>
>>>> On 25 Feb 2026, at 05:58, Parav Pandit <parav@nvidia.com> wrote:
>>>>
>>>>
>>>>> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
>>>>> Sent: 20 February 2026 02:10 PM
>>>>>
>>>>> Hi Parav,
>>>>>
>>>>>> On 13 Feb 2026, at 14:52, Parav Pandit <parav@nvidia.com> wrote:
>>>>>>
>>>>>> Hi Bill,
>>>>>>
>>>>>>> From: Bill Mills <bill.mills@linaro.org>
>>>>>>> Sent: 26 January 2026 10:02 PM
>>>>>>>
>>>>>>> This series adds the virtio-msg transport layer.
>>>>>>>
>>>>>>> The individuals and organizations involved in this effort have ha=
d difficulty in
>>>>>>> using the existing virtio-transports in various situations and de=
sire to add one
>>>>>>> more transport that performs its transport layer operations by se=
nding and
>>>>>>> receiving messages.
>>>>>>>
>>>>>>> Implementations of virtio-msg will normally be done in multiple l=
ayers:
>>>>>>> * common / device level
>>>>>>> * bus level
>>>>>>>
>>>>>>> The common / device level defines the messages exchanged between =
the driver
>>>>>>> and a device. This common part should lead to a common driver hol=
ding most
>>>>>>> of the virtio specifics and can be shared by all virtio-msg bus i=
mplementations.
>>>>>>> The kernel implementation in [3] shows this separation. As with o=
ther transport
>>>>>>> layers, virtio-msg should not require modifications to existing v=
irtio device
>>>>>>> implementations (virtio-net, virtio-blk etc). The common / device=
 level is the
>>>>>>> main focus of this version of the patch series.
>>>>>>>
>>>>>>> The virtio-msg bus level implements the normal things a bus defin=
es
>>>>>>> (enumeration, dma operations, etc) but also implements the messag=
e send and
>>>>>>> receive operations. A number of bus implementations are envisione=
d,
>>>>>>> some of which will be reusable and general purpose. Other bus imp=
lementations
>>>>>>> might be unique to a given situation, for example only used by a =
PCIe card
>>>>>>> and its driver.
>>>>>>>
>>>>>>> The standard bus messages are an effort to avoid different bus im=
plementations
>>>>>>> doing the same thing in different ways for no good reason. Howeve=
r the
>>>>>>> different environments will require different things. Instead of =
trying to
>>>>>>> anticipate all needs and provide something very abstract, we thin=
k
>>>>>>> implementation specific messages will be needed at the bus level.=
 Over time,
>>>>>>> if we see similar messages across multiple bus implementations, w=
e will move to
>>>>>>> standardize a bus level message for that.
>>>>>>>
>>>>>>
>>>>>> I would review more, had first round of sparse review.
>>>>>> Please find few comments/questions below.
>>>>>>
>>>>>> 1. device number should be 32-bit in struct virtio_msg_header.
>>>>>> From SIOV_R2 experiences, we learnt that some uses have use case f=
or more than 64k devices.
>>>>>> Also mapping PCI BDF wont be enough in 16-bits considering domain =
field.
>>>>>
>>>>> That is a very interesting feedback, we will definitely take this i=
nto account.
>>>>> We will have to decide how big and I will answer that in Demi's mai=
l as there might be some drawbacks with
>>>>> having very big sizes for the device ID.
>>>>>
>>>> I am slowly catching up on the thread.
>>>> There are two types of device id needed.
>>>> One is UUID style to uniquely identify the device that may show up u=
sing two transports to the driver.
>>>> With that a driver can create single virtio_device object, which is =
reachable via two different transports.
>>>> This offers performance, resiliency.
>>>> This is likely a bigger string which is not efficient to use during =
every message transaction.
>>>>
>>>> Second one is: within a transport, a device id to identify the commu=
nication.
>>>> I was referring to this device id to be u32, so that transport can s=
upport more than 64K devices.
>>>
>>> We will increase the device number size to support more than 64k devi=
ces.
>>> For the UUID part, I feel it should be something provided as device i=
nformation per device, so
>>> we could add a non-mandatory field (nil-UUID when no ID available) an=
d transfer that information
>>> as part of GET_DEVICE_INFO.
>>
>> When would it not be available?
>=20
> I am not aware of implementations assigned UUIDs per device.
> In any case the field can always be there and the nil-UUID used if some=
thing does not have one.

I expect that the UUID will be set out of band by the management stack.

>>>>>> 7. VIRTIO_MSG_SET_VQUEUE does not have bit field for individual ad=
dresses.
>>>>>
>>>>> Set vqueue has an index to specify the virtqueue index but you have=
 to specific all fields in one go that is true.
>>>>> Do you need a solution where you could set some fields to a specifi=
c value to say "keep current" and only update part of the vqueue
>>>>> configuration ?
>>>>>
>>>> I believe so, otherwise it cannot work with existing drivers without=
 driver side caching them.
>>>
>>> I will investigate that possibility.
>>
>> With the current spec, adding virtqueues one at a time requires time
>> quadratic in the number of virtqueues.  That's not good.
>=20
> Solution i am looking at would still allow to transmit everything in on=
e go but would leave it open
> to only update/modify some specific fields (using an optional field mas=
k to not modify some parts).

Please ignore this comment.  I didn't read the part about the virtqueue i=
ndex.

>>>>>> This requires caching all the values on the driver side before sen=
ding the transport request.
>>>>>> I think it is time for virtio spec to shift to virt queue create a=
nd destroy model using the admin queue interface.
>>>>>> and no need to bring this VIRTIO_MSG_SET_VQUEUE legacy to new tran=
sport bindings.
>>>>>> It may require more plumbing, but it is cleaner interface when a n=
ew transport binding is created.
>>>>>
>>>>> Admin queue useable with the message transport but I would be inter=
ested to understand exactly
>>>>> the model you are referring to with create/destroy model.
>>>>> Could you elaborate a bit so that i could understand what messages =
you would expect and how this would work ?
>>>>>
>>>> The suggestion is to not use SET_VQUEUE legacy.
>>>> The suggestion is to use admin virtqueue to create queues and destro=
y queues, as they are merely an object.
>>>> And new transport like your proposal can adapt to the modern style.
>>>> So only admin queue configuration would be the only message.
>>>> Rest of the other queues can be created directly using the admin que=
ue.
>>>
>>> In a way, set vqueue message could be seen like that as it is a one t=
ime operation.
>>> In most cases, drivers are configuring a virtqueue in one go which is=
 optimized here
>>> as we need only one message transfer.
>>> If we include the proposal to also have an enable/disable directly in=
 the message this
>>> could allow for even less messages.
>>>
>>> Using the admin solution on top of virtio message is something possib=
le and not prevented
>>> by this solution.
>>>
>>> In my mind we have an object here as you create/destroy queues in one=
 go and the fact
>>> that a bus can transfer those requests asynchronously gives a solutio=
n equivalent to what
>>> would be provided by admin vqueues.
>>
>> Why disadvantages does using admin vqueues have?
>=20
> You need a virtqueue to use admin virtqueues so we need to have a solut=
ion to set this up.
> Once there i agree you can use that instead but it would not change the=
 fact that we need
> a solution to setup a virtqueue.
> Right now nothing is forbidding to use them, but we still need to have =
a way to configure vqueues
> in the transport.

Oh, that makes sense.

>>>> One can say it is orthogonal feature and I agree with that reasoning=
=2E
>>>> The part that bothers me is that the new transport ends up adding so=
me legacy bits like set vqueue.
>>>
>>> We still need to support legacy to have existing implementation worki=
ng and here we can optimize
>>> them a bit by not transferring one message per field.
>>
>> Which existing implementations are you referring to?  It appears
>> that these are mostly in embedded systems.  If they are shipped as
>> a single unit, the drivers and devices could be updated at the same
>> time and there is no need for backwards compatibility.
>=20
> I am a bit lost here, do you mean we should or not have a solution to u=
pdate individual fields ?
> In any case the change i suggest would not remove the solution (preferr=
ed) to do everything
> in one go (plus the possibiity to enable/disable the queue in the same =
message) but would
> also allow ot update independent fields if wanted.

I meant being able to update individual virtqueues, as opposed to
having to setup all virtqueues at once.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------t4Ct6yVhK4YefJOg1xzWCd2l
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49y
B+l2nipdaq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYf
bWpr/si88QKgyGSVZ7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/
UorR+FaSuVwT7rqzGrTlscnTDlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7M
MPCJwI8JpPlBedRpe9tfVyfu3euTPLPxwcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9H
zx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR6h3nBc3eyuZ+q62HS1pJ5EvU
T1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl5FMWo8TCniHynNXs
BtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2Bkg1b//r
6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nS
m9BBff0Nm0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQAB
zTxEZW1pIE9iZW5vdXIgKElUTCBFbWFpbCBLZXkpIDxhdGhlbmFAaW52aXNpYmxl
dGhpbmdzbGFiLmNvbT7CwY4EEwEIADgWIQR2h02fEza6IlkHHHGyiLVf/5wiwQUC
X6YJvQIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCyiLVf/5wiwWRhD/0Y
R+YYC5Kduv/2LBgQJIygMsFiRHbR4+tWXuTFqgrxxFSlMktZ6gQrQCWe38WnOXkB
oY6n/5lSJdfnuGd2UagZ/9dkaGMUkqt+5WshLFly4BnP7pSsWReKgMP7etRTwn3S
zk1OwFx2lzY1EnnconPLfPBc6rWG2moA6l0WX+3WNR1B1ndqpl2hPSjT2jUCBWDV
rGOUSX7r5f1WgtBeNYnEXPBCUUM51pFGESmfHIXQrqFDA7nBNiIVFDJTmQzuEqIy
Jl67pKNgooij5mKzRhFKHfjLRAH4mmWZlB9UjDStAfFBAoDFHwd1HL5VQCNQdqEc
/9lZDApqWuCPadZN+pGouqLysesIYsNxUhJ7dtWOWHl0vs7/3qkWmWun/2uOJMQh
ra2u8nA9g91FbOobWqjrDd6x3ZJoGQf4zLqjmn/P514gb697788e573WN/MpQ5XI
Fl7aM2d6/GJiq6LC9T2gSUW4rbPBiqOCeiUx7Kd/sVm41p9TOA7fEG4bYddCfDsN
xaQJH6VRK3NOuBUGeL+iQEVF5Xs6Yp+U+jwvv2M5Lel3EqAYo5xXTx4ls0xaxDCu
fudcAh8CMMqx3fguSb7Mi31WlnZpk0fDuWQVNKyDP7lYpwc4nCCGNKCj622ZSocH
AcQmX28L8pJdLYacv9pU3jPy4fHcQYvmTavTqowGnM08RGVtaSBNYXJpZSBPYmVu
b3VyIChsb3ZlciBvZiBjb2RpbmcpIDxkZW1pb2Jlbm91ckBnbWFpbC5jb20+wsF4
BBMBAgAiBQJafgNKAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCyiLVf
/5wiwYa/EACv8a2+MMou9cSCNoZBQaU+fTmyzft9hUE+0d5W2UY1RY3OsjFIzm9R
/4SVccfsqOYLEo+S0vQMIIIqFEq3FCpXXwPzyimotps05VA8U3Bd7yseojFygOgK
sAMOAee2RCaDDOnoJue01dfZMzzHPO/TVdp3OvnpWipfv5G1Xg96rwbhMLE3tg6N
xwAHa31Bv4/Xq8CJOoIWvx6fcmZQpz01/lSvsYn0KrfEbTKkuUf0vM9JrCTCP2oz
VNN5BYzqaq2M4r+jmSyeXLim922VOWqGkUEQ85BSEemqrRS06IU6NtEMsF8EWt/b
hWjk/9GDKTcnpdJHTrMxTspExBiNrvpI2t+YPU5B/dJJAUxvmhFrbSIbdB8umBZs
I3AMYrEmpAbh5x7jEjoskUC7uN3o9vpg1oCLS2ePDLtAtyBtbHnkA4xGD7ar8mem
xpH9lY/i+sC6CyyIUWcUDnnagKyJP0m9ks0GLsTeOCA0bft2XA6rD6aaCnMUsndT
ctrab42CV5XypjmC4U1rPJ8JQJUh1/3P48/8sMH+3krxpJ06KNWNFaUbaMTGiltZ
7x9DngklSYrX0T+2G4kVXNmjaljwkoLahwLla2gUWwBSyofXdqyhQdwZsp01KXNQ
UCyT/Pg+aDcm/E7OMV3d4lf7g/CSxiX2GSEe6BlhSz+Lmd7ZJ3g32M1ARGVtaSBN
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
EtJuZYM5blWncBOJCoWMnBEcTEo/viU3GgcVRw=3D=3D
=3Dx94R
-----END PGP PUBLIC KEY BLOCK-----

--------------t4Ct6yVhK4YefJOg1xzWCd2l--

--------------tsBl0PY1mpIVfaOhqHAwPSf7--

--------------DeC2sA2Qpbs70K0CEDJWfeSf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmme9KUACgkQszaHOrMp
8lPOTw/6A5WWK7hccMDlphPi8I0FHCNwJxmoOGLqMUHU3zkf/+tEM8934V9EU0Nk
/YjIRZLnleUV6TPWgTc6TkV20ogi2RTMgbYGqepJPYAQnCjenzKw/pnitVfCvcu+
VhZEfrkum1wHwr5eaKDH5b7xlMMid+RP+LaxksxH4Jb7z6hlhZ97EKuMvs32eB8q
XB69VgxY+Bo+xWg4swenp965I2Znm1COyh0blnd5arImx/Wntl9PtSjc2xlJAulr
yQ9iZUpKlJja2qIOR82HFDD46BK1CRM80mR+9ATSI+V3IqGc9XQgzANGs5v3R02O
45r74mHBdgxmWqbcYjwJXLnlmgzLawTJytt3K4G3o29svI0/kOV/9aDXmAfKubwR
5DJwyxIz2fOqNrek2yB25qHdkafEkLmC/zZWq1GZe1TIwJ545FKi3dxaIbWnCRNn
Wh2lBXLh+LI/cSg90LuY1whlc7q4OmNfN35v/vtliyS870Nw6GQQ5jDXOU+5UMao
ztdExqMTbm2vTZdraH0X5QDOIlYyj1ppKgzOsrXj+hMfMMyju7EMVqLLqd0yaN94
1zVtw3FU+jsdN4SCby2TVeDuUKZbypTESXSgCnG7eec6YammWGrIghdm7fJGn2yc
cEdn9nnJq+8SxjZZEOf/BBuR5g2NbW3plbuBlBb+q+Z5X8Vymwk=
=hLFu
-----END PGP SIGNATURE-----

--------------DeC2sA2Qpbs70K0CEDJWfeSf--
