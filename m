Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C224279345
	for <virtio-comment@lists.linux.dev>; Wed, 23 Apr 2025 16:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745424351; cv=none; b=fy85b/EqC/DOB18C/opMrdEq2rWAMze89H/nbU0p+NcbNmhdDj0LxjDiRAJrBEf3V9V1ExtJZVruP7APHkbt9wLnjCCqRc8nkg4stBTN4UX1NSuFl4Dx0NFEmhJxCy2cmMr4ldJ1Z0xDXTnTXtBqvxGcuxsgUtWEZowF6CeZvCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745424351; c=relaxed/simple;
	bh=me0MyvbrqyLmJ+lAb626u4AA1YpqooAR4dY0rtwbWAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g4wvavRCyiE/sHjPz9MKfSkDQsfKBX/UqsNYAFhR2vc50nlrPHKQpfTXSZKS9siYzp0wqqNrhJMAWzwyFqUuyb+fn4R53+VedH/J2gCTk4NkGS7azZJqfa8Go+QsjCsC59zdo0GEvxOYs4Wbsn/IGKD88cgINRJrm0gEHokdJg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gwkkltLx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gwkkltLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745424348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9hcGEvTZfmHAqBJpIOEh9dIKChzzP+UK+LjfdrDMU9c=;
	b=gwkkltLx8MTcJF1h37YgdJt5uBjfEP89Vl9ut0YnKAWKUkSt9NavgVHu5rwrHT2uvF+cgD
	wscET5zrPf2FUmDtC8/jOtfQWzf18YZ3LyNAVZvYm6E9cGNoZ8UTEmIv+8ZRi/io5jCA+C
	vKtugAsud/ipjU6SjIuXuCKU+20zRIE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-ObCX2AbpNgiW_uf8zXy2Ow-1; Wed, 23 Apr 2025 12:05:47 -0400
X-MC-Unique: ObCX2AbpNgiW_uf8zXy2Ow-1
X-Mimecast-MFC-AGG-ID: ObCX2AbpNgiW_uf8zXy2Ow_1745424346
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so39458975e9.3
        for <virtio-comment@lists.linux.dev>; Wed, 23 Apr 2025 09:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745424345; x=1746029145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9hcGEvTZfmHAqBJpIOEh9dIKChzzP+UK+LjfdrDMU9c=;
        b=sKQqFUUK6ou38C9yQkj0AiAzRHFCfbdVFoDvQFVL98B4jkc5M9LLxrFzWGs5eZpRHV
         sHAzg9Veo+hdyr4NlBeJpn28L1cGS4kuriqYm3LWpiuhPhHJrjV+Ka9DFe1cawzU9iXG
         7ZIirRHJPnhXLXiBRzd/QKgVR8rqII0chfG09JQwbmZCgD+ujDLR6N7QubrJISmJN18y
         tbBDd0P452NqNc8WiTSbcIc/4JYUAIRnXufJOqjFR7HCk8E2y9AIJQpFj+OPZuCAgRJq
         0Tu2w2/K8J8sU95AfmjuzjOjXaaWUYQObf1Q7mQg5VAjt3ja2nGOg0DXs3ASqyFejOMQ
         uZwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAsq4GAuELJC48U/4aPsSpJRaF8FsUJp6yNXhotCc/JWwSsrvo82eP9+3ZoZeY9GBAivmPz19jR4fU/eCsVw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywzt0R8nVW1wMT58ZUVVNxV/oCF+4sYCk1lNwdUZoLPFqgpmF6w
	Cf9RMqUQuuy9WX4AEMJ1nmOnJRqymoLSFJXsOuOypgmiXUwEzaLFEcpx8HpckMrZp62e0pShLfu
	k/xKEzg41Cfh+SI6uw4kFqtRxdXTzih0uTEel913Jn0PEDrnlZTMI7XaXc4qp0mKJ
X-Gm-Gg: ASbGnct8NLQoJe2XLpt1WCrkjTKLcucfcJcPybo26j7jnU/PQ5uZ6mXvpH3h8Gaq6JL
	MfmKlWMW94Xaf/+Ue8EF2UBvHRKra6rxRBzJSY30b2eF2wx++aoX0a0S27/c72Dn3+d2XkqB07Z
	gnwH70dv5uf+uWsWYfNXmpI4hC1itazDKYEdIfoUadbZEKIaGMgagSjASGndmri3mbQCnV9NTp/
	7vy/5/ntCFPEwGL7btP5akUIv84cZPJ3+sdiPQ17iMYtXUd74GV664uD/oHGl2FqCdHGVo+xQ0c
	0E8jp44oY3ppkF1VC8F2t9ndE464hEOh8PRk
X-Received: by 2002:a05:600c:5491:b0:43c:fbe2:df3c with SMTP id 5b1f17b1804b1-4406abf9a9amr162619045e9.26.1745424345614;
        Wed, 23 Apr 2025 09:05:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVsNJgAzMKBrhz0i7XP1isi8/IbVCcobxxR29ylzAT3bE08zoZKI4emOVPAOwDsxSYSMdmQw==
X-Received: by 2002:a05:600c:5491:b0:43c:fbe2:df3c with SMTP id 5b1f17b1804b1-4406abf9a9amr162618705e9.26.1745424345232;
        Wed, 23 Apr 2025 09:05:45 -0700 (PDT)
Received: from [192.168.88.253] (146-241-86-8.dyn.eolo.it. [146.241.86.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d2f8b9sm30394925e9.24.2025.04.23.09.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 09:05:44 -0700 (PDT)
Message-ID: <20751ef1-b8e6-4e67-94e5-e8736c3a943b@redhat.com>
Date: Wed, 23 Apr 2025 18:05:43 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.linux.dev,
 cohuck@redhat.com, mvaralar@redhat.com, shahafs@nvidia.com,
 Willem de Bruijn <willemb@google.com>, Jason Wang <jasowang@redhat.com>
References: <20250126062058.13695-1-parav@nvidia.com>
 <d76dc63e-8d4b-4a90-8765-0148d9c7b885@redhat.com>
 <20250423014257-mutt-send-email-mst@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250423014257-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dQHy_hvyrPIl-HDAbazCkgZagTh4_xhf3MNa-fENLr8_1745424346
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/23/25 7:46 AM, Michael S. Tsirkin wrote:
> On Tue, Apr 22, 2025 at 07:49:41PM +0200, Paolo Abeni wrote:
>> On 1/26/25 7:20 AM, Parav Pandit wrote:
>>> @@ -136,6 +124,18 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>>>  \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
>>>  
>>>  \item[VIRTIO_NET_F_RSS_CONTEXT(64)] Device supports multiple RSS contexts.
>>> +
>>> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (65)] Driver can receive GSO packets
>>> +  carried by a UDP tunnel.
>>> +
>>> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM (66)] Driver handles packets
>>> +  carried by a UDP tunnel with partial csum for the outer header.
>>> +
>>> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (67)] Device can receive GSO packets
>>> +  carried by a UDP tunnel.
>>> +
>>> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles packets
>>> +  carried by a UDP tunnel with partial csum for the outer header.
>>>  \end{description}
>>
>> I'm finally trying to finalize the implementation and I must admit I
>> underlooked the implication of using features bit >= 64.
>>
>> AFAICS all the virtio drivers in the Linux kernel and qemu assume that
>> the features can be represented with a single u64.
>>
>> Supporting the above requires major reworks in both user-space and
>> kernel space. At least on the kernel side a similar rework (extending
>> the _netdev_ features field) has proven to be complex enough to defeat
>> any implementation attempts for years and in the end it was dismissed in
>> favor of lower bits reuse.
>>
>> I'm wondering if we could reconsider using reserved bits here?
>>
>> Thanks!
>>
>> Paolo
> 
> :(
> 
> It's been there for 2 months now.

Unfortunately I was not able to get back earlier.

> And if you want to avoid using all bits > 63 then it's even more of
> a mess, you need to move VIRTIO_NET_F_RSS_CONTEXT which has been
> there for a year and a half.

I started the 'support [arbitrary] larger features bitmap' exercise and
I think there is a difference between the VIRTIO_NET_F_RSS_CONTEXT bit
and UDP_TUNNEL_GSO related ones: AFAICS the latter go through the
VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET command, which in turn limit the
offload to 64 bit:

"""
The class VIRTIO_NET_CTRL_GUEST_OFFLOADS has one command:
VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET applies the new offloads configuration.

le64 value passed as command data is a bitmask, bits set define
offloads to be enabled, bits cleared - offloads to be disabled.
"""

while I don't see similar constraints for the  VIRTIO_NET_F_RSS_CONTEXT
feature.

The current specification is inconsistent, as it does not allow enabling
the UDP_TUNNEL guest offloads.

AFAICS we have to either add the specification for another
VIRTIO_NET_CTRL_GUEST_OFFLOADS command to allow passing the additional
data or reconsider using reserved bits just for the UDP_TUNNEL offload
(I'm sorry for reiterating on this, it still looks like a very tempting
path).

Thanks,

Paolo

