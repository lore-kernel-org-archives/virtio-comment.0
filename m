Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D811EB44
	for <virtio-comment@lists.linux.dev>; Wed,  4 Sep 2024 14:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461600; cv=none; b=pU/bFaw4oCzm7AtbT5zYMZZTQzdKKftXsvE8Fd91xrpb8ekqzKQumYp0h3kaMeINRvVEai8pvrUT4M1pusXuSW1xDkyT0XdwznW0bzXeeLRWvO42S9HH0WwU49picrx40Lh79mPVpC5OQhX2P9GhVijm/SOayQ3hp6NWF/ZYTaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461600; c=relaxed/simple;
	bh=qePj7Jmbyz9YQz8KGrn01NiDCDskD7QOj1IuJSqBaYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xh73CgyjRhTiEreYe/Ne1haAenjyneNLB8yftI4M9zxoewL4S7sAy2qfpwuEFedVhufhVjPqL5bjRBwilZ77i/ix+b6I+zkFsmE/ozSUNoFGqIh0bsgmBWZ5Q6LCUaYKU6gd6ZHJ7Y7NCptGWYYs7zbJmZeOq/7Ap9+i54ltMwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=brvPnSx9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="brvPnSx9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725461597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dkZcMPomH95iifqn7mpmTxsUVB5u3CH+XLmy7C5QxsA=;
	b=brvPnSx9RI35vpMAiql3XHvNm7O04J0R7pUWL2rEcrDEWh4KnAgn0u66T8gvrAXdobC1g4
	AojBMixUZ6th/onROCrbL8btYHMq/jYRiHWBeHUbhQL3OjuanpVy5qqUKHNctxOjJQffEV
	7ZLQwPdBPf+heMw1K+dO2ba4Y5xXnN8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-hZT2PtY_NUmdGnL-57U7TA-1; Wed, 04 Sep 2024 10:53:14 -0400
X-MC-Unique: hZT2PtY_NUmdGnL-57U7TA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-374bb2f100fso586129f8f.0
        for <virtio-comment@lists.linux.dev>; Wed, 04 Sep 2024 07:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461593; x=1726066393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkZcMPomH95iifqn7mpmTxsUVB5u3CH+XLmy7C5QxsA=;
        b=R3nmrRAObL+GX9IZQo4KUOhhU8X6bT+M/w2iqwZZb1PV+66fMTcAjlsv3hXJC0V3c6
         okL53zD8aW2XeMkmTKVTa1OcWrISreDCi0ucG2yHE9x/Tl1J/srX4hWgym4BskY9Gml+
         Z1W3aeGpirSRSm0vK/4Kre6kMOI6s0QZakBzy0ttVDAfQfMaRT6Gvj0StyQXJLMXe73f
         aDaShpmrXJZs3mtbgN7NZ3C+hezT9mrtas0v7NshlraFsIzXzP6bflr6/f/TjNxAn7xC
         sAdDK7QDi4AqC4Eqavp1e8hsasTnBFCWA4+3f63hMdI0GReas/LzcRJvwYFcECdIr9bu
         8lLA==
X-Gm-Message-State: AOJu0Yw/M7gj3JQlMV+VRS+dskkfatrlFcd94J/b9v8oXlwvlsV3U2+M
	KMYRcKKu5n0TYI5pdIa3uH0VacBr6E+dm2ti4KfHR/rOBSTL00kq7nXdo67QgZolzGd3gH0ZxUq
	kc0os2RTN7oNbn0IPPPTDjwaADGOaN78zwayZzQXuk3gWmpT8TSDv85BNgEJfbRIr
X-Received: by 2002:adf:f192:0:b0:374:bb25:658e with SMTP id ffacd0b85a97d-3776f9298f4mr1849823f8f.26.1725461593270;
        Wed, 04 Sep 2024 07:53:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCibp/odSTZs/NwUyV31GyZJl2sFpnT/yyLVKkQDMAKtABR0lhoYTopbbYZRVXlEudjKWPBw==
X-Received: by 2002:adf:f192:0:b0:374:bb25:658e with SMTP id ffacd0b85a97d-3776f9298f4mr1849803f8f.26.1725461592726;
        Wed, 04 Sep 2024 07:53:12 -0700 (PDT)
Received: from [192.168.88.27] (146-241-55-250.dyn.eolo.it. [146.241.55.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c231e907sm11497099f8f.86.2024.09.04.07.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 07:53:12 -0700 (PDT)
Message-ID: <85226c41-5633-4035-9f40-911cb3c484b4@redhat.com>
Date: Wed, 4 Sep 2024 16:53:10 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v7 1/2] virtio-net: define UDP tunnel
 segmentation offload feature
To: Shiva Shankar Kommula <kshankar@marvell.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>,
 Willem de Bruijn <willemb@google.com>
References: <cover.1724234131.git.pabeni@redhat.com>
 <04089a87ff34aa518345ba5b50aecf737fb03f40.1724234131.git.pabeni@redhat.com>
 <CA+FuTScjheR1htWujZ5=adBRB3+_z5KrCyHKoRGVapGq-MGtJQ@mail.gmail.com>
 <70256c1c-f5dd-4ccd-a414-434bb56612fd@redhat.com>
 <DM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2@DM4PR18MB4269.namprd18.prod.outlook.com>
 <5b555612-dcac-46d9-acb2-f712a40a4ede@redhat.com>
 <DM4PR18MB4269B8AE69F8B56F0188D598DF922@DM4PR18MB4269.namprd18.prod.outlook.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <DM4PR18MB4269B8AE69F8B56F0188D598DF922@DM4PR18MB4269.namprd18.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/2/24 14:31, Shiva Shankar Kommula wrote> On Thursday, August 29, 
2024 at 9:20 PM Paolo Abeni wrote:
>> On 8/26/24 14: 23, Shiva Shankar Kommula wrote: >> -----Original Message----
>>> We are using VDPA-based device along with DPDK in our environment and
>>> have noticed a significant performance drop (~8-10%) when reading
>>> packet data to determine the [outer]network header type in segment
>>> offloading cases as segmentation offload needs to know the start of
>>> network header.
>>
>> I'm unsure I parse the above correctly. DPDK is reading packets from the VDPA
>> device, when does segmentation offload come into place? I guess the DPDK
>> application is forwarding the packets towards another (VDPA?) device?.
>>
>> There is no encapsulation protocol at all right?
>>
>> The idea of adding additional virtio net header fields for plain GSO packets
>> sounds a bit strange to me.
>>
>> I guess a more detailed description of your scenario would help.
> We are targeting vDPA offloading as our use case. This involves
> configuring vDPA based application on the host to directly transmit
> packets to a virtual ring(vring) with specific offload requests, such as
> IP checksum offloading or TCP segmentation offloading.
> 
> On the other end,  we have firmware running on ARM cores, which
> processes the incoming packets with hardware assistance and
> forwards them to the network.  In scenarios, where the L3 network
> header start is not provided,  firmware must parse the packet to identify
> the beginning of L3 layer, which introduces additional overhead.

It looks like such use-case is quite unrelated from what is under 
discussion here. I think we don't want to add additional fields for 
plain GSO packets.

Perhaps you could consider resurrecting/reusing hdr_len? Possibly under 
some additional feature negotiation.

In any case this discussion looks orthogonal to the UDP tunnel changes.

Cheers,

Paolo


