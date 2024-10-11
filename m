Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C4920A5E7
	for <virtio-comment@lists.linux.dev>; Fri, 11 Oct 2024 07:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728633033; cv=none; b=THo2RKFt/gywNYw0k4pc6YoIdtCF3yjE0ai7f7UYEGvMPMwQmErrud1Bc2x+W+P+8gpWRsWXYlBFQHqCIw8Rp/PNaKMXUEh+EXBmc/IJQtmCnoey1KbF3f5cU2IPUtwBKUb7uTEfO+h/+83uhj/gD8MAn0awX6sFbSsKkRhDRGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728633033; c=relaxed/simple;
	bh=KpmZpbN+qw/We19Qs8xY69uHXplObCw+j5wVOPq7XyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ky8RnYiKGWZANlVMfJIYRPn5Z3ukVyIbGBFUapgROFWIMwfLzFjMRrC876kfGn0ONfc/hSMAiBmlH2jPsaNLMd2pP07IJiqAfsEQl4OnDvXcDEIUvFsOr9aOdX2Iyy3XZ46T9R9HgqE8MAXdI4Y9gxqqVQH5DkRPFGWBYDQogHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GwFIFU6r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GwFIFU6r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728633030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0dwhHk8awsMSRavxKZubeQ8xdbmaW7gJbZUpETQNjUg=;
	b=GwFIFU6rufiOhAxe+C3YAo5oNGbaPPnUdbAiP6OM5nydb/NVk010sjFH0Dd+sA58s0yHui
	Hus36yg7ELjd3TxqC8E5hTKAAkxznL1HSycUcIV0sL1OywT5eJjjFHdD/p4gmojTkFpo3Q
	9/4vDkoTCOSgEgYAfr7IceTaiKPmtco=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-JD8XazO_OhaYC4LgVrvtSA-1; Fri, 11 Oct 2024 03:50:29 -0400
X-MC-Unique: JD8XazO_OhaYC4LgVrvtSA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42cb374f0cdso9652375e9.0
        for <virtio-comment@lists.linux.dev>; Fri, 11 Oct 2024 00:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728633028; x=1729237828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0dwhHk8awsMSRavxKZubeQ8xdbmaW7gJbZUpETQNjUg=;
        b=jzm1XjBVWn0DleCP6H3nrI5oQxlUDHIl5dETf2HqBAmEvUDfD9hwAnpjBbABGhsim+
         2kXemTg+dNDwuuADDwRLUB6jYU4BPEtpOZOj0oen11fgp63oXjXEkyleJO8kUJRQmlWJ
         +yNlkVkVkNV8pQhevcxaTK3yq4FIc2rN5wbYbbgJEd0syfPd6gfAZQZpbx+AVlMIxkfj
         PntKvKi6eQ1VahyZ//GSeXbQxQia2WgLiRZiyfeXtJmHdi+pyR6SvLR/ARR3RURpox9T
         Qo2RFJWw/zegdYKmImcsSS3u4vQSMdiDbtqKzV2+tMsYQi97ahgFWakHrdPL4a3CNtT1
         8hOw==
X-Gm-Message-State: AOJu0Yyq+yHKWqtqOOrVBb/rA/m5spcVZroM+Ov7/90er/mQAtYdYFhl
	bCP3FZQZMQ56yq4aQVqvHAjJPFfLC11CMIEf8tzThnb//oS5pNpPPi3yZLRwNay3PXWFFJMnlxI
	LKMnefUlx+dtYiRKCP2vVIbUdbi0Mt1CmSbToRCxjPFjppR+nJazeGTDH7ocGVNPwz8gVeMhKlP
	U=
X-Received: by 2002:a05:600c:45cd:b0:42c:b377:3f55 with SMTP id 5b1f17b1804b1-43115a96e9fmr53328425e9.3.1728633028050;
        Fri, 11 Oct 2024 00:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELynXJwl/kboAQOgwNTbu5Ppx6qhGmRv9BIpTX6XAXyanfAZkxJo/6+HtCkYwpRQn7FaBrzg==
X-Received: by 2002:a05:600c:45cd:b0:42c:b377:3f55 with SMTP id 5b1f17b1804b1-43115a96e9fmr53328285e9.3.1728633027609;
        Fri, 11 Oct 2024 00:50:27 -0700 (PDT)
Received: from [192.168.88.248] (146-241-22-245.dyn.eolo.it. [146.241.22.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4311835d7b2sm35116595e9.42.2024.10.11.00.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 00:50:27 -0700 (PDT)
Message-ID: <582a4bc8-5e90-4e10-9c4a-288abbc088af@redhat.com>
Date: Fri, 11 Oct 2024 09:50:25 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload
 feature
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1728029499.git.pabeni@redhat.com>
 <55306969c73f62bf4d100d15074bfd6cde741417.1728029499.git.pabeni@redhat.com>
 <CACGkMEvV0gtvgpb7z1MqJLKzHm-Be_8hkf0GzqqsFsfDG8oAeA@mail.gmail.com>
 <d34f50af-4042-44c6-90e1-0acbbb899e96@redhat.com>
 <CACGkMEvrowr6CwF+=RiR+f3EagdKB=rzyCPCQcUdXee4a5MaZA@mail.gmail.com>
 <2b90c368-b514-4077-a6bf-43da075af4fc@redhat.com>
 <CACGkMEu5GWZrYVRN==F=vrRQQGnxj_WqX86YZ+diqC3s3m2m_A@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEu5GWZrYVRN==F=vrRQQGnxj_WqX86YZ+diqC3s3m2m_A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/11/24 04:08, Jason Wang wrote:
> On Thu, Oct 10, 2024 at 3:40 PM Paolo Abeni <pabeni@redhat.com> wrote:
>> The above means that an hypervisor with a S/W virtio implementation need
>> to deal with all sort of strange/unexpected combinations.
> 
> Driver and device doesn't trust each other, they must do necessary
> validation no matter what features were negotiated.

The problem is that a non restrictive specification allows for 
conflicting/confusing layout, hard to check hence the bugs. The goal 
here is to try to enforce a restrictive specification for the new feature.

i.e. if we could replace the whole 'else' statement here:

https://elixir.bootlin.com/linux/v6.12-rc2/source/include/linux/virtio_net.h#L113

with a simpler:

	if (gso_type)
		return -EINVAL;

we would have avoid a lot of serious kernel bugs.

Note that the PoC code enforces the above, but just for GSO over UDP 
tunnel packets.

>> Side note: as a consequence, sice we will not have anymore DATA_VALID
>> together with VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV{4,6}, the above will
>> additional avoid the 'DATA_VALID with GSO over UDP tunnel means inner
>> header is valid' strangeness.
> 
> Well, then we will still have the issue with NEEDS_CSUM? For example,
> as I ask in patch 2, if we want to offload outer checksum where do we
> put the out csum_start/csum_offset?

I think we don't have any issue there. For GSO over UDP tunnel packets, 
csum_start/csum_offset always refer to the inner checksum. For GSO 
without UDP tunnel, csum_start/csum_offset refers to the only checksum.

The outer checksum is offloaded with checksum partial only for GSO over 
UDP tunnel packets, when the header carries and set the outer_th_offset 
field:

"""
If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been negotiated,
   and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit is set in \field{flags},
   both the outer UDP checksum and the inner transport checksum
   have been validated, otherwise only one level of checksums (the inner one
   in case of tunnels) has been validated.
"""

Note that i.e. performing USO aggregation on the outer UDP for GSO over 
UDP tunnel packets, will cause data stream corruption, must be avoided 
regardless of virtio.

> Just to make sure we are talking the same thing. Actually, I meant for
> TX you propose the following text:
> 
> """
> +The valid complete checksum of the outer UDP header of individual segments
> +can be computed by the driver prior to segmentation only if the GSO packet
> +size is a multiple of \field{gso_size}, because then all segments
> +have the same size and thus all data included in the outer UDP
> +checksum is the same for every segment. These pre-computed segment
> +length and checksum fields are different from those of the GSO
> +packet.
> """
> 
> If I understand correctly, you are talking about the precomputed
> checksum by the driver which should be TX. If no checksum offload, I
> don't get how such pre-computing can help.

The above refers to GSO over UDP tunnel, so by the spec change requires 
that there is csum offload for the inner transport. Precomputing the 
outer csum basically leads to checksum partial, and allows a 
device/driver pair not supporting outer header csum offload to handle 
GSO over UDP tunnel with outer csum enabled.

>>>> The idea is that GSO over UDP tunnel specs are new, so we can be more
>>>> strict and we try to mandate only 'sane' flag/features/layout combinations.
>>>
>>> But I don't see how mandating device to set csum stuffs can help.
>>>
>>> 1) There's no way for the driver to know if device sets csum stuffs or not
>>> 2) Driver should not trust the device, malicious device can set
>>> arbitrary value, so driver needs its own validation
>>
>> We are discussing only about csum validy, right?
> 
> Kind of, actually the context is whether mandating the device to set
> csum_start/offset for DATA_VALID can help.
> 
> So I meant there's no difference in the following two cases:
> 
> 1) Device doesn't set csum_start/offset, driver need to probe and
> validate the packet
> 2) Device set the  csum_start/offset, driver still need to probe and
> validate the packet

The current implementation is not doing (rightful) any probing when 
csum_start/offset are available, just sanity checks, which are way 
simpler and safer.

> And as replied before, there's no way for the driver to know if device
> set csum_start/offset or not.

I don't understand this statement. According the the spec, if the device 
has set NEEDS_CSUM it also must have set csum_start/offset. If a broken 
or malicious device set random/bad values, sanity checks should catch it.

Note that the real problems are actually in the opposite direction: the 
driver sends bad/malicious data to the device and potentially crashing 
the host. Strict sanity checks should avoid that.

>> I hope and believe that this part should have been clarified by a
>> previously discussed point: no DATA_VALID for GSO over UDP tunnel, no
>> more differentiate/confusing meaning for the DATA VALID bit.
> 
> Rethink of the design, the root cause is that we're trying to re-use
> existing fields for inner which works for outer before:
> 
> For example. consider the case for non GSO tunneling, all
> csum_start/offset/hdr_flags etc were for the outer, and we change the
> semantic when GSO tunnel is supported. Such asymmetry might end up of
> a lot of complexity in both the spec and the implementation.

Have you looked at the actual PoC implementation? the proposed 
specification allows re-using the existing code to process the inner 
headers seamlessly:

https://github.com/pabeni/linux-devel/blob/virtio_tunnel_gso_v9/include/linux/virtio_net.h#L302
https://github.com/pabeni/linux-devel/blob/virtio_tunnel_gso_v9/include/linux/virtio_net.h#L359

For non tunneling GSO, the fields refer to the _only_ transport header 
available. You can call it 'outer' but it's just an arbitrary choice.

I must admit all this discussion is quite confusing to me, as keep 
touching consolidated and agreed stuff. My understanding was you were ok 
with V8:

https://lore.kernel.org/virtio-comment/CA+FuTSf8274uQVEiJ-R5nnqAzDR9+N3WA0YoSbC-Q7MF5+O7Mw@mail.gmail.com/T/#mb455dd5f07ac98f1ccf79ba6edbd17a75f72df0b

and the only significant delta between v8 and v9 is a more restrictive 
and defined usage of the DATA_VALID flag with GSO over UDP tunnel 
packets (as also reported in the changelog).

I think we should restrict the discussion to that point. I agree the 
conflicting definition of DATA_VALID GSO over tunnel and GSO without 
tunnel could be confusing.

AFAICS there are 2 options to make the DATA_VALID usage with GSO over 
UDP tunnel not contradictory with the non tunnel GSO:

1) forbid DATA_VALID with GSO over UDP tunnel

or

2) forbid DATA_VALID with GSO over UDP tunnel without UDP tunnel 
checksum offload. That means that DATA_VALID for GSO over UDP tunnel 
packets could only be set when both the inner and outher header are 
offloaded.

I hope opt 1) would be simpler to define in details, opt 2 would still 
allow for GSO over UDP tunnel HW GRO with DATA_VALID.

Paolo

