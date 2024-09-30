Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB28213D8A4
	for <virtio-comment@lists.linux.dev>; Mon, 30 Sep 2024 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727681781; cv=none; b=FstPIuLHCA79YsBakKkgUZnMvY/9NXSPJtfXKZ/OMrTp+f3GWsZf3h71pVU1OW3xtHVttvsFtKT4TEZicwEszwfGAtCi0xHUVpCQKnfG87mLeFFojzOZm1tD+gXqGJQk4q7cy8AX3q6Zy+T79Otxg8NsE3ds9nqkkRe71qe9iHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727681781; c=relaxed/simple;
	bh=eB+ywz5S5415IhIZV35wYwaxwbJvI8k5awIyvwR4Ot8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=eiF83l6bKHClv/8qAuK5xnLS2xAdnF2wUaDhCAIkDqbXyo+uIAhec24pHe4P2cyJ9OX9xF1KbITQcVr898ViMyJPfk56iEnxz1/4Sg7m5+f2Qpku72QikITo0K384nv5vIc4MpyMR51ToXp3ujYPMbPnXu3O1n8tEQWmYiRKM3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WqLbkiFf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WqLbkiFf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727681777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7oEolGgj4QQCGoecaqjWCQdzcL62UazW9JHDPeWZGxQ=;
	b=WqLbkiFf7RBM5cmVL3ZcTMLkgLnZM6FA2VYXgPoFS4W2pMZH9Z2xR7oVfyBKfN678PUqh3
	8eLYxtqnmr+P3Om7llX+xel2f5qBE5+fh/5cvGQ+bPXHbosYZ/QscTROvZYKYp7WldzFZP
	EuXy/tVdMCVtgNiXrcd2Aw4XonYHIfs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-AUBFeZLKMy6f3VywBMjgPg-1; Mon, 30 Sep 2024 03:36:16 -0400
X-MC-Unique: AUBFeZLKMy6f3VywBMjgPg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42cb857fc7dso31279945e9.0
        for <virtio-comment@lists.linux.dev>; Mon, 30 Sep 2024 00:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681775; x=1728286575;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7oEolGgj4QQCGoecaqjWCQdzcL62UazW9JHDPeWZGxQ=;
        b=StYr8Oj1EZidEHAzuguLUMiXn3dDkbxjDivBgIaac8JhYkfS6kX/Vp4TKWqmRrjjhR
         6iwooeaUnhgW8XDgsAjrJPfpA4YaaJicjw35bYD0QOr34BFjeBz0eq1y/SYnRXrL1zb7
         XwsyNKM61GVhSZr/4wTgdAsACyAE5LrPPqs51cq4Yo2eZlMbS0oGvnJW2ayxHLvs5z+9
         IhkJWVaJdwXMb9ZpENdgz4GTj4ce0vruRmUoq/nyqhYLnitpdPBYdV7eFQePOKxS4k0F
         nCuHtneXJhx6Wvmx78C3yB04p1xxgkCUdoHkzhp6mKWYC6LmleMhuFH0ZSVl/0UaxeI7
         fHfg==
X-Gm-Message-State: AOJu0Yx6Y39IBF74ahBpjFyGUWLp+Gs5ag3KE5qpvjKgVLQk4xcOxl2X
	SrhgXN1mC8CgDS89e7A0zRP5SJwHLS9+4fsEHSf/BMS19GwyXa4GtMpC6rP2j4hJjCijJrH+RCT
	z8Jg/m+pXM9BEHuueoFl8/slBshbpnk9tS4RNXbOMJk8qhF2y3ilRHhhNa8qqOLV6
X-Received: by 2002:a05:600c:a4b:b0:42c:de6f:6ab3 with SMTP id 5b1f17b1804b1-42f5840e0eamr78822765e9.6.1727681775068;
        Mon, 30 Sep 2024 00:36:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFG10WLU67UujvFa0XL7k7Nq4+joTA9NEove9gBN4XUhHqnU7RUuC3+imkPAEd2x2oqyQx3ew==
X-Received: by 2002:a05:600c:a4b:b0:42c:de6f:6ab3 with SMTP id 5b1f17b1804b1-42f5840e0eamr78822615e9.6.1727681774636;
        Mon, 30 Sep 2024 00:36:14 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:b088:b810::f71? ([2a0d:3341:b088:b810::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57e13a1dsm96433355e9.32.2024.09.30.00.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 00:36:14 -0700 (PDT)
Message-ID: <1ca3a523-87d1-4450-a0bb-980b1c8109c4@redhat.com>
Date: Mon, 30 Sep 2024 09:36:11 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/2] virtio-net: define UDP tunnel offload
From: Paolo Abeni <pabeni@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1725463935.git.pabeni@redhat.com>
 <CACGkMEsXhsTpZg2DP5BqUOodjR1HOTc-a-FuaCbxffZhpPj2aQ@mail.gmail.com>
 <45c88725-bacd-4999-919c-4191ea0cbdfc@redhat.com>
In-Reply-To: <45c88725-bacd-4999-919c-4191ea0cbdfc@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 9/9/24 10:05, Paolo Abeni wrote:
> On 9/9/24 05:16, Jason Wang wrote:
>> On Wed, Sep 4, 2024 at 11:50 PM Paolo Abeni <pabeni@redhat.com> wrote:
>>>
>>> UDP tunnel usage is ubiquitous in container deployment, and the ability
>>> to offload UDP encapsulated GSO traffic impacts greatly the performances
>>> and the CPU utilization of such use cases.
>>>
>>> This series introduces separate features to handle both UDP tunnel
>>> segmentation offload (patch 1) and UDP tunnel outer checksum offload
>>> (patch 2).
>>
>> Looks good to me.
>>
>> And I wonder if there's a link to the prototype code so I can have a
>> double check.
> 
> I still have to refresh the code from first implementation - that was
> the base for the first draft here some time ago.
> 
> In the next 2 weeks I'll be traveling and/or AFK, I hope I can share the
> code a little after that.

A very early PoC is available here:

https://github.com/pabeni/linux-devel/commits/virtio_tunnel_gso/

It's very lightly tested vs a patched user-space:

https://github.com/pabeni/qemu/commits/virtio_tunnel/

"very lightly" is actually a strong understatement; the thing survived a 
single iperf-over-udp-tunnel run, and that is. However I hope it should 
suffice as showcase.

In the tun/user-space interface I used a separate ioctl to configure the 
tunnel offload instead of re-using the existing ioctl for plain GSO, 
because AFAICS the tun driver is currently unaware of the complete 
virtio net hdr layout (e.g. ignores rx hash and VIRTIO_NET_F_MRG_RXBUF) 
and it is just notified of the total hdr struct size.

With UDP tunnel offload enabled, the tun driver need to know the tunnel 
fields offset inside the virtio net hdr. Piggybacking such info inside 
the the current ioctl(TUNSETOFFLOAD) data (a single long int) is 
feasible but looks hackish. Instead I preferred implementing a separate 
ioctl(TUNSETTNLOFFLOAD) receiving as input from user-space a struct 
containing the mentioned offset and the "csum offload enabled" flag

Any comments/suggestion WRT such interface more than welcome!

The PoC demonstrated that the pending spec changes need some fixlet:

- I wrote the patch on top of the current virtio-spec master branch, I 
need to rebase on top of virtio-1.4, I guess.

- I underlooked to the VIRTIO_NET_HDR_F_DATA_VALID flag. The 
specification change allows GSO over UDP tunnel offload with DATA_VALID, 
but GSO over UDP tunnel needs the inner transport protocol information. 
This point looks more difficult and potentially controversial.

With the proposed change, when DATA_VALID is set, the implementation 
will have to determine the inner transport header location via parsing, 
as currently is doing for plain GSO. Note that the PoC is currently 
bugged WRT this scenario.

I'm wondering if we could revisit the spec change requiring that both 
the driver and the device, for GSO over UDP tunnel packets only, will 
fill the csum_start field when either the NEEDS_CSUM or the DATA_VALID 
bits are set. Equivalently, for GSO over UDP tunnel packets only, the 
driver and the device, to specify CHECKSUM_UNNECESSARY packets, could 
set both the NEEDS_CSUM and DATA_VALID, with the latter flag 'taking 
precedence' WRT the actual checksum type.

Note that the above will made the GSO over UDP tunnel path for 
DATA_VALID slightly different from the current plain GSO handling, but 
the difference should avoid the current rough edges of the plain GSO.

Other options would be resort to the parsing the inner hdr location (as 
in the current plain GSO implementation) or not allowing DATA_VALID for 
GSO over UDP tunnel. WDYT?

Thanks,

Paolo

