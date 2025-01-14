Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDDE15746B
	for <virtio-comment@lists.linux.dev>; Tue, 14 Jan 2025 15:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736870276; cv=none; b=YxQGWB+c87EwpG6kxzamKgzXEBiPrhEY7JHlWMU8mIxgNYk5+2gusON0lc2PZX+dyiBP0Zf+X8ZqbXoZ9lMzA3ZtCh17zR7AsJw+pb91iB+jCzCG1pohY436Z4FnF5/1Mzm/0xXjHxDRmTheqzGevfg1yZBjLqP/HIzkdyKxmo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736870276; c=relaxed/simple;
	bh=Bx1CMz1XcIOtNRipzulwVEeXbW5Yx+JB9j+LFGvbaZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NDEzXADHpc7RIQWj6Pe+Hy4k1hK80mdfPn3pOB84Fs0X2vJFOTqmsUwbOlQqs6pjIuJdqrsV0zPh9woOwXkZK1ldnsKan1gMWV0iTxf0OVZKmVtSIuaN6Tq4bbbHaY54FDYMN/tOI4PkXm8+u+5I50f8E8leF/mIx+XKJ5T9qOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XHGw1ZeW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XHGw1ZeW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736870273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j6TzDwFw8N6XzrETouK7pvLkyCfYvTMdnz9DGsncXyY=;
	b=XHGw1ZeWjKd+X4w8fdADZN8urj3Z6wLwHoxvaCogyJWF1FA6s6vbkpTXWVthKYkos/FwA8
	EqI2mokJLRSPaCaQ640AQliwLwKRGDmCPOigHF/xpD5ogdnaxqwbDAZgfUVWdbW6Dk0Whm
	AkbkAwwJS2Tyoukoa/oO3XmLHkvYEWM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-7laMOfyjN6qO0WO-1oAOQQ-1; Tue, 14 Jan 2025 10:57:51 -0500
X-MC-Unique: 7laMOfyjN6qO0WO-1oAOQQ-1
X-Mimecast-MFC-AGG-ID: 7laMOfyjN6qO0WO-1oAOQQ
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3862be3bfc9so3348791f8f.3
        for <virtio-comment@lists.linux.dev>; Tue, 14 Jan 2025 07:57:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736870270; x=1737475070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j6TzDwFw8N6XzrETouK7pvLkyCfYvTMdnz9DGsncXyY=;
        b=Szqu9i1e2HLwHN6XNXd47fPxlp9GjbCaO014J4OGf4s894s5QrzaaqevGT2f8TakaI
         rAyzDuWnnuuZRh95gi072TMfq88JGam5reXHYGayvvWiLdiEmOX66VfhrTtNpIu8DFWr
         XYFDSfnK1LO2EkpABoIj1wePP7CUiodKZLSstUc+oXjLlXd76j948BHNCUeHuIFwZSKA
         jCRikumF5fcdloFa4LpdB1JDZlN+T4lrabD4tqe7b+ZjRmw+Cniy8IZSaJAkNmnoQIxB
         J/SFhJ2cwEyn5MMXrW/onU4jJRoiJpEHh0fQFGBNTXHvy8PP8fgWfGbxMqaxhVzQ57gI
         wY8Q==
X-Gm-Message-State: AOJu0Yxoh1IpHGN05dPZi+wg0+LzTwlFyJlAQ718T44A+1OkEztju2f3
	pB0lra0myfKnJcLXycaG9Nx5EhBFuEWA7545Fb6HFxRr0J6gyiAP6oUxdRoG9Ei+fujXVHvN6m9
	qJ7Wa8ca7+nMnGmMhUx46EE8CwTkgZf3jM5QaMse1Yi5zBFv6QYLAf8pU6GhgaXdN
X-Gm-Gg: ASbGncvBBSSrob+pulomrrCmHHKcdYh/ydYyZZNFJu19lBYZN2oR3HBKowPKubC5Ogz
	sBcPrJZajTPbAB4F+EovqmqRVF0FvKeu7HxuhIf9pI4S+QuoMsDf0a2J7EKUtniEbux7emidj6O
	xaGPlhRp0W04yqyk0cxfGKoAiBpRjydLKTVnMQ61PPEhORabOf11wcTvo7MBCVhr5Z1SELR5mYp
	fRteWni73MPq3VaoFA5i7jgl10URFud0i7afWVYPa6lZ+oICnwD0WE7YciRdpyYnLzEYHyq/1fu
	0vV2cAzwTGE=
X-Received: by 2002:adf:9bca:0:b0:38a:88e2:e6aa with SMTP id ffacd0b85a97d-38a88e2e719mr14331742f8f.29.1736870269084;
        Tue, 14 Jan 2025 07:57:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZWEb5+XM8jV2iNsaycjNxLJrJYvt64pmWAKvZ9h2K2gwC9nU2D7QB9Qo3DQaCx1DOaJogdg==
X-Received: by 2002:adf:9bca:0:b0:38a:88e2:e6aa with SMTP id ffacd0b85a97d-38a88e2e719mr14331663f8f.29.1736870267191;
        Tue, 14 Jan 2025 07:57:47 -0800 (PST)
Received: from [192.168.88.253] (146-241-15-169.dyn.eolo.it. [146.241.15.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da66fcsm216801695e9.6.2025.01.14.07.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 07:57:46 -0800 (PST)
Message-ID: <bf181935-8a71-4bd1-a675-d83258694fe6@redhat.com>
Date: Tue, 14 Jan 2025 16:57:44 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/4] virtio-net: define UDP tunnel offload
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
 maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1732699986.git.pabeni@redhat.com>
 <fe15607a-1431-438d-956b-bfec70e94507@redhat.com>
 <175a0b29-5901-4393-9390-64a018bec260@redhat.com>
 <20250114101553-mutt-send-email-mst@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250114101553-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y1gg_nAXYXqr4l1mZQqbRdKJsUonKm-guiKiNxrghec_1736870271
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/14/25 4:16 PM, Michael S. Tsirkin wrote:
> On Tue, Jan 14, 2025 at 04:04:35PM +0100, Paolo Abeni wrote:
>> On 11/27/24 10:48 AM, Paolo Abeni wrote:
>>> On 11/27/24 10:36, Paolo Abeni wrote:
>>>> UDP tunnel usage is ubiquitous in container deployment, and the ability
>>>> to offload UDP encapsulated GSO traffic impacts greatly the performances
>>>> and the CPU utilization of such use cases.
>>>>
>>>> This series includes:
>>>> - clarifications on the current semantic of NEEDS_CSUM offload
>>>> (patch 1) and DATA_VALID offload (patch 2) to make later changes easier
>>>> to follow,
>>>> - new features definition to handle both UDP tunnel segmentation
>>>> offload (patch 3).
>>>> - new features definition to handle UDP tunnel outer checksum offload
>>>> (patch 4).
>>>>
>>>> A PoC implementation is available here:
>>>>
>>>> https://github.com/pabeni/linux-devel/commits/virtio_tunnel_gso_v10/
>>>> https://github.com/pabeni/qemu/tree/virtio_tunnel_gso_v9
>>>>
>>>> Note that both implementations has not been updated since the previous
>>>> iteration, since there are no additional functional changes in v11.
>>>>
>>>> Changes from v10:
>>>> - added patch 2
>>>> - clarified only a single encapsulation level is supported (patch 3)
>>>> - s/TCP or UDP GSO packets/GSO packets/ (patch 3)
>>>> - 'to the outer UDP pseudo header' -> 'to the outer UDP pseudo header
>>>>   checksum' (patch 4)
>>>> https://lore.kernel.org/virtio-comment/cover.1731084277.git.pabeni@redhat.com/
>>
>> I understand all the points under discussion have been addressed. I'm
>> wondering the next steps are and what I could do to move things forward.
>>
>> Thanks,
>>
>> Paolo
>
> See
> https://github.com/oasis-tcs/virtio-spec?tab=readme-ov-file#use-of-github-issues
> 
> for the process to get a change merged once there is concensus.

Thank you for the prompt reply and useful guidance.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/212

Could please open a voting ballot for these changes?

Thanks,

Paolo

