Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BFA214239
	for <virtio-comment@lists.linux.dev>; Wed, 22 Jan 2025 14:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737557004; cv=none; b=lNnHhh2czmGZQYd139S/0syPgWoiES87SroVyiaKKiuQdClStPRp/T/LsapV6yqB6etp2pkboDHXivES8NBQXeg/dDD2hilIs6Eea5ir5AJ9+Zn2Mwrsqm6ZqGlEnIOQFm2Lew+m8AP90bBJi4OZp4PJJGwXNA3QPx1dGQDA5h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737557004; c=relaxed/simple;
	bh=GISNomLRP7dvFl6+Gu77UMXgVbTTbkrrOqIPG0u4BpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCsnO1QCMob5SOML0Qun9/gi8j9HpR5vnHpe6R10iq9h8IY/hcDp8SX80PI4Q76AEtpz+n79hJrDb4LoC++s7mBteZ+gctCTZDw1Bu1sMsFEu/Z4pbatb7J3jL/DQfC0l3S/uuRqLzlhM2l3KIZoSV76Q1fzQ3TAYpb8z3Y1RQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=isZApYst; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="isZApYst"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737557001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VMsjemzald9xxl2W9yIkTbZRxi4Pd5HnzlQhaWK/Fxg=;
	b=isZApYstVTB3d+fUpmv9XMB2A+SpK40O4lREgB0a3MYCoCO8zUFU/Cv6/TpeSaMNaMI+Gr
	TE1dkzZD/px7+KaMH24fVgeqLxOuN1MfEF2Cs6R742DPkRWZxdCB3pBOwBi3JpGj+Lvysu
	MauAwQjnJSu8C+ecw53zjSpuKKNsFRU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-LOY25wpKMhSyRiUGuqJjjg-1; Wed, 22 Jan 2025 09:43:20 -0500
X-MC-Unique: LOY25wpKMhSyRiUGuqJjjg-1
X-Mimecast-MFC-AGG-ID: LOY25wpKMhSyRiUGuqJjjg
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385d52591d6so437714f8f.1
        for <virtio-comment@lists.linux.dev>; Wed, 22 Jan 2025 06:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737556999; x=1738161799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMsjemzald9xxl2W9yIkTbZRxi4Pd5HnzlQhaWK/Fxg=;
        b=MC5fcCmLFyrfbQ9qvEI/j7JWAwuLZG2grcJKHkBULW60otQKkdGgvwJlnX4hmyvmRM
         Q5OVhtJQ+EcNQLi4KvPbrT4mnVseyF7jZphJ1dKVgwrFa7TT4jr3DIqpkAuqnBGLHE4B
         I30216iFW3/nThvOPv1k1rWU1nk/H12+ioe6QwlriyL4M1+Oflhq4mPuotgeogHDq+sd
         zErd1Rw10qzZ2IXcxi2bY1STj+WU8pgU/q5NVOu/7t4cWrBghTB0aUmxpsM495S5oCRc
         jwScA1kfw9tPw9d9+57ip1zJ9jfa/1mjjPwJeONr5TscQDvwvcboGqutz704R7s52bFq
         rJww==
X-Forwarded-Encrypted: i=1; AJvYcCUgY6oPY96Y7V/xxvNjGdYlsZGlsljI1ZOC7chbk3g6F/odcfDTVbhMjrezrLzt4Blma5lUXc6UE9C3lGcAxw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxF0/kXxwNY3fy+TX3wF4op/I2iZDBSxru+FTg3dmkA57Eu3JN+
	2PmHsxkqotADHOcdlvrR+yu/HM9obfPVyZ9CTKBlyp98rXZ7bUDffGR+CVyNDyHYbCcw1fHE4fL
	XY2H9tte/m3bU31yDCqNAECOvGztSU6FMV7U7JI0k+dWv/dkTMZZaHpI1XBQVg2dp
X-Gm-Gg: ASbGncskzJsxGWwgbW3Aljdn5CGFxVxnqEzSV1Vfm5oc6I/fYtGzXHbApdsj+7+juIQ
	dDvIYyn6DQwsi7vOJ/9/n48VV09LL4CE6ueLQmBohyR/VuMzNssRribHGJbYcigrK9zQiOkvjLw
	dx/QiJgrdcKMf4WAhoMM3s+howYE2H98carHtSxyZzWvGdm5xFYQX+3BS1fW1tsI8XHSb2jv90t
	y9EhqPXsFbRReMcoh6QQgqBlzrUdW9g+GdhthA5rA/y+4JgBMh0WThu8Tac+4q/2wB8f0n+f2G/
	s7INy72y5CQViV+720dJ8FD1
X-Received: by 2002:adf:b64c:0:b0:388:cacf:24b0 with SMTP id ffacd0b85a97d-38bec4f5f76mr17582764f8f.2.1737556997578;
        Wed, 22 Jan 2025 06:43:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8aXVBN8TFpPAUSfh1Mxpw8uPvdtFscqp3wqv0xFPlkboj+MPvJJ/5IPfY42AgxDK9v43/yQ==
X-Received: by 2002:adf:b64c:0:b0:388:cacf:24b0 with SMTP id ffacd0b85a97d-38bec4f5f76mr17582688f8f.2.1737556995710;
        Wed, 22 Jan 2025 06:43:15 -0800 (PST)
Received: from [192.168.88.253] (146-241-15-169.dyn.eolo.it. [146.241.15.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327df12sm16701470f8f.92.2025.01.22.06.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 06:43:15 -0800 (PST)
Message-ID: <3f501db8-40fc-414c-adbe-afb0ec2ba412@redhat.com>
Date: Wed, 22 Jan 2025 15:43:12 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
To: Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Cc: "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>,
 "kshankar@marvell.com" <kshankar@marvell.com>
References: <cover.1732699986.git.pabeni@redhat.com>
 <3e1c45071c8cf4efc7ca0ecc7b52a73c6bf983fe.1732699986.git.pabeni@redhat.com>
 <CY8PR12MB7195D914B9EF00FF62C5E1DFDCE42@CY8PR12MB7195.namprd12.prod.outlook.com>
 <87ldv597rl.fsf@redhat.com>
 <CY8PR12MB719550ABC66CDDF8D71E2F7DDCE72@CY8PR12MB7195.namprd12.prod.outlook.com>
 <87ikq98yod.fsf@redhat.com>
 <PH8PR12MB7208F319B0C0380FAD5DA45DDCE72@PH8PR12MB7208.namprd12.prod.outlook.com>
 <2d27f420-d155-4aad-9626-8b42acc0cc22@redhat.com>
 <CY8PR12MB719551BDC4C7500B346A27F2DCE62@CY8PR12MB7195.namprd12.prod.outlook.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CY8PR12MB719551BDC4C7500B346A27F2DCE62@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Sdxz3IpW_ztugBJII0uR8iabBAQnft2NnvRghsk1NIk_1737556999
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/21/25 8:38 PM, Parav Pandit wrote:
>> From: Paolo Abeni <pabeni@redhat.com>
>> Sent: Wednesday, January 22, 2025 12:10 AM
>>
>> On 1/20/25 3:19 PM, Parav Pandit wrote:
>>>
>>>> From: Cornelia Huck <cohuck@redhat.com>
>>>> Sent: Monday, January 20, 2025 5:50 PM
>>>>
>>>> On Mon, Jan 20 2025, Parav Pandit <parav@nvidia.com> wrote:
>>>>
>>>>>> From: Cornelia Huck <cohuck@redhat.com>
>>>>>> Sent: Monday, January 20, 2025 2:34 PM
>>>>>>
>>>>>> On Sun, Jan 19 2025, Parav Pandit <parav@nvidia.com> wrote:
>>>>>>
>>>>>>> Hi Paolo, Michael,
>>>>>>>
>>>>>>>> From: Paolo Abeni <pabeni@redhat.com>
>>>>>>>> Sent: Wednesday, November 27, 2024 3:07 PM
>>>>>>>>
>>>>>>>>
>>>>>>>> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (46)] Driver can
>>>> receive
>>>>>>>> GSO
>>>>>>>> +packets
>>>>>>>> +  carried by a UDP tunnel.
>>>>>>>> +
>>>>>>>> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (48)] Device can
>>>> receive
>>>>>>>> GSO
>>>>>>>> +packets
>>>>>>>> +  carried by a UDP tunnel.
>>>>>>>
>>>>>>> Feature bits 42 to 49 are not applicable to device specific type.
>>>>>>> They are
>>>>>> reserved.
>>>>>>> Please see the note.
>>>>>>>
>>>>>>> Current spec description is:
>>>>>>>
>>>>>>> 0 to 23, and 50 to 127 Feature bits for the specific device type
>>>>>>> 24 to 41 Feature bits reserved for extensions to the queue and
>>>>>>> feature negotiation mechanisms, see 6
>>>>>>> 42 to 49, and 128 and above Feature bits reserved for future
>> extensions.
>>>>>>>
>>>>>>> So 2 bits of these patch and of patch 4, 46 to 49 to be shifted to
>>>>>>> bits 65 to
>>>>>> 68.
>>>>>>>
>>>>>>> Or an alternative would be to amend,
>>>>>>>
>>>>>>> Bits 46 to 127 for specific device type, And 42 to 45 and 128
>>>>>>> reserved for future extensions.
>>>>>>>
>>>>>>> Michael,
>>>>>>> Please let me know so that I can have the follow up patch to this
>>>>>>> one as
>>>>>> voting is started.
>>>>>>> And the fix is required for it.
>>>>>>>
>>>>>>> Is there any historic reason for 42-49 as reserved, or it can be
>>>>>>> used as
>>>>>> proposed in this patch?
>>>>>>> If it was only kept as elastic buffer for device generic, and
>>>>>>> device type to
>>>>>> grow it is probably ok.
>>>>>>> Using 46 to 49 has small advantage to reuse in the offloads bit as
>> below.
>>>>>>> Please confirm.
>>>>>>
>>>>>> See the reasoning given in 88895f56e642 ("Reserve more feature bits
>>>>>> for device type usage") -- the idea was to push out the point in
>>>>>> time when generic feature bits will have to be in the bit area beyond
>> 63.
>>>>>> Given that we only used one of those generic bits in the meantime,
>>>>>> I assume it will still be some time before we run out of bits, even
>>>>>> if we let the net driver grab some bits there. Still, I'd probably
>>>>>> prefer that the
>>>> net device used different bits.
>>>>>> [And issues like this are easy to miss during review
>>>>>> unfortunately.]
>>>>>>
>>>>> I made assumption that one would have picked the device specific rage.
>>>>> I missed to detect this early enough, my bad. :(
>>>>>
>>>>> Given that we are only left with 4 bits in range 42 to 45, at
>>>>> generic level, it
>>>> seems wise for device-type to consume feature bits in its defined range.
>>>>> For virtio-net, bits 65 and higher are preferred.
>>>>>
>>>>>> However, if the device was to use different bits, the clean
>>>>>> solution would be to withdraw, respin, and revote. If we only
>>>>>> changed the reserved ranges, we'd be fine with a change on top, so
>>>>>> that would be less hassle in the short team. If we decide that we
>>>>>> can live with the smaller feature bit space below 63, I'd be fine with
>> that solution.
>>>>>>
>>>>>
>>>>> I am fine either way to merge this and fix immediately for using
>>>>> bits 65 and
>>>> higher.
>>>>> My preference is to use bits 65 and higher.
>>>>>
>>>>> Or as you suggested to respin and revote right away to forward with bit
>> 65.
>>>>>
>>>>> Please let me know.
>>>>
>>>> Personally, I'd prefer to handle this in an "atomic" manner, i.e.
>>>> making sure that no version ever has the wrong bit numbers... maybe
>>>> if you did a fixup patch that changes the numbers, and commit these
>>>> patches + the fixup all at once? Less churn than doing the respin and
>> revote dance.
>>>>
>>> Here it is.
>>> https://lore.kernel.org/virtio-comment/20250120141052.877355-1-
>> parav@n
>>> vidia.com/T/#u
>>>
>>> Do we need to open a new voting request for it? yes?
>>
>> I'm sorry for the latency.
>>
>> Please be aware that VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
>> VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM values are reported a 2nd
>> time in the "Offloads State Configuration" paragraph. I guess even such chunk
>> will need patching.
>>
>> /P
> Ok. will fix and open github issue so that we can merge both the primary and fixes patches in one go after both the votings are done.

Thanks!

Please consider my reply as a formal ack to such change just in case
it's needed by the process.

/P

