Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73D520C472
	for <virtio-comment@lists.linux.dev>; Wed, 30 Apr 2025 10:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746007955; cv=none; b=gpcgK6Jh3DXhNidX/sW/Z84+1VxvxGbC55ANHMa5f4VtrRwgMjb+FKdj+HoBpN04XAfI8OFFTh0GVqUAbphH2PPsdrARfRi19QqB4Sgo7fd/fBsoFbMvK6TbYSEoRjP1eWT5y/zxl7YrkE3Vos/lB5dMMO6pIkDeF35HVRM0umo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746007955; c=relaxed/simple;
	bh=bd7ozlB/QeVxDJSJIZx6rWgOh6YE3vraCDLFcCUQAmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VDJdfK7MGRZAobP3ierOoLteYYjVUMWauHJ7XisyCxif7HapyAy0f+DmO9V2ZMI2/Hc6XHgx7OJBCLWeoUjnfJXNHy2mIUtS+zZhD9abWQQg4BILN3LPF4a2NEmoUnjbFFrFNyL9CRfy5PPgXoGU5bl5CIHO27Bq/5nXKLqIyZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ai+720oV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ai+720oV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746007952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2DMCOPIi4VzN8HPrjP12PzOMIvX9VWmLACYiJszRyYg=;
	b=Ai+720oVo/Y9Dz3hDIjdVex/xuz9v32SzltWfrI5JQkwoCMPfAtHjHmGhwWxdeXLM7fHjM
	YIe3sGMry3FCk/yeALzA+vowVZrn4wDH8nrzs5uMS0q0kQ2Qe7Lihc+9gduS+iEiydYBmb
	iyz1to4/GKe4kwRM2K/zXgD5pv6iNg4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-z_YI7TDqOpGmOEajLpb8fA-1; Wed, 30 Apr 2025 06:12:31 -0400
X-MC-Unique: z_YI7TDqOpGmOEajLpb8fA-1
X-Mimecast-MFC-AGG-ID: z_YI7TDqOpGmOEajLpb8fA_1746007951
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-440a4e2bad7so3334695e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 30 Apr 2025 03:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746007950; x=1746612750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2DMCOPIi4VzN8HPrjP12PzOMIvX9VWmLACYiJszRyYg=;
        b=guPrwe4HZ8KcTUWlwUUo2hmIfBchgoQR+I4SDEqyrnslJCWYeX7OiiMW6JaD8Bsh18
         GbWlpLUhW74Sizmtr1mFLbx+ALMTNLzE6U42OE2iwMSygpBstCRNjEpr2IDFTAQ58MGV
         43QDzDGBIe1POctlXxLaeg9Wgov/figjBL2dQ3jTdQl1b+rFJ7/984Ftat6lCZcg2GQU
         21NuMrJPuzLSo8PC+uKfOVlMXxnLjFRuQ1UzWwkXI637x/4fiEiDx7nJc/cQHsD7XoKo
         SfbjzGIao6T8FZbQc7y68c4fov0OVVFECoirpz4fbiE6cMM2co1dLxasR5FxgS9I2wOL
         dZAg==
X-Gm-Message-State: AOJu0Yx9EtQVbM0lNz3Ja3Dcoeo1BA4Cpoq4rX6XkFAuDTqQyvjQSkHb
	w2mTllDktgceH1ueCnd4fzGtCk6zcO0naXlXw6y1IjcS1wyUpPptyxnZ2eIbupGBKOHtKbrTlCj
	dPg+BTwIi82DFK3WGTatFZIC9rqRncfoeFzkvKoKdspAe5rR2NnJidCd3JY43cDA2
X-Gm-Gg: ASbGncvifYay4Ap9Z9t+o5IoCdzeIb1RKe2AzbPX4N7q8oeb/PzbR9W+8U+xx4nS1Zf
	Kqh4o9QCNtKn7TZfurBkn2d++7Na93W3TpxWyrgfR6pxUz99EHnoja5gWkFWxZwCUux+emSWff9
	h7CXFQJstoBRswimO9SHJBWvHyxM727GnEZfbc/RxoHqakTUr9RfSLqVxRbeCkW1MZOa23aO16M
	IKQGOumv3luNZNv+LLIFPmJPUYmK5PL/jN9tVoatlpaNYPJ+OZ9cF+tSRlce7Wd5USQCqCUEeNl
	p9292QIy8izKyhZQBUfGKprxs3gegbvyOI8ooDpfaEXmnA/zzdufSsxWkQc=
X-Received: by 2002:a05:600c:154a:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-441b23c2259mr24973415e9.3.1746007950143;
        Wed, 30 Apr 2025 03:12:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELP49taRQcmyh0IwjlTEbP1P/raK0YIw+82XnFgwM7nK794fcYzSmw7XH/fkEQD3FXiW/sAg==
X-Received: by 2002:a05:600c:154a:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-441b23c2259mr24973185e9.3.1746007949726;
        Wed, 30 Apr 2025 03:12:29 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2726:1910:4ca0:1e29:d7a3:b897? ([2a0d:3344:2726:1910:4ca0:1e29:d7a3:b897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ba4a8dsm19209825e9.13.2025.04.30.03.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 03:12:29 -0700 (PDT)
Message-ID: <68c4e73a-fa9e-4e2e-8c38-ed4a322bf47e@redhat.com>
Date: Wed, 30 Apr 2025 12:12:27 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "mvaralar@redhat.com" <mvaralar@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>,
 Willem de Bruijn <willemb@google.com>, Daniel Verkamp <dverkamp@chromium.org>
References: <20250126062058.13695-1-parav@nvidia.com>
 <d76dc63e-8d4b-4a90-8765-0148d9c7b885@redhat.com>
 <20250423014257-mutt-send-email-mst@kernel.org>
 <CABVzXA=Uof+TdU6H+eoiOOVjCZwfXfnLV8wAMP87Gz4G92fncA@mail.gmail.com>
 <20250423140404-mutt-send-email-mst@kernel.org>
 <bb5dd95a-15d5-4785-822c-e2b1e773950c@redhat.com>
 <20250429164256-mutt-send-email-mst@kernel.org>
 <CY8PR12MB7195AB46624A4339A305BE1CDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CY8PR12MB7195AB46624A4339A305BE1CDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gMKAa4kh-qJnLpi4VXdGhIwQ4D3OOfKEEAQFVCW0zPE_1746007951
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/30/25 6:44 AM, Parav Pandit wrote:
>> From: Michael S. Tsirkin <mst@redhat.com>
>> Sent: Wednesday, April 30, 2025 2:14 AM
>>
>> On Mon, Apr 28, 2025 at 10:39:59AM +0200, Paolo Abeni wrote:
>>> On 4/23/25 8:07 PM, Michael S. Tsirkin wrote:
>>>> On Wed, Apr 23, 2025 at 09:29:11AM -0700, Daniel Verkamp wrote:
>>>>> On Tue, Apr 22, 2025 at 10:46 PM Michael S. Tsirkin <mst@redhat.com>
>> wrote:
>>>>>> I'm afraid we'll have to bite the bullet.
>>>>>
>>>>> One other issue with bits > 63 is that the vhost-user protocol
>>>>> VHOST_USER_GET_FEATURES and VHOST_USER_SET_FEATURES
>> messages use
>>>>> u64 to represent the features, so vhost-user-net devices can't
>>>>> query or enable these features. vhost-user is outside the scope of
>>>>> the virtio spec, though, and I think it's reasonable to extend the
>>>>> protocol to enable high feature bits rather than avoiding them forever.
>>>>
>>>> Yes you would use VHOST_USER_SET_PROTOCOL_FEATURES to make
>>>> VHOST_USER_GET_FEATURES return two u64s, or even a new message
>> returning an array.
>>>
>>> I think that additionally the VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET
>>> command will need some clarification, as in the current text looks a
>>> bit
>>> inconsistent:
>>>
>>> """
>>> // in Offloads State Configuration / Setting Offloads State:
>>>
>>> #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
>>>
>>> // ...
>>>
>>> The class VIRTIO_NET_CTRL_GUEST_OFFLOADS has one command:
>>> VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET applies the new offloads
>> configuration.
>>>
>>> le64 value passed as command data is a bitmask, bits set define
>>> offloads to be enabled, bits cleared - offloads to be disabled.
>>>
>>> There is a corresponding device feature for each offload. Upon feature
>>> negotiation corresponding offload gets enabled to preserve backward
>>> compatibility """
>>>
>>> The "corresponding device feature" has the same numerical value of the
>>> selected offloads, except for UDP tunnels related one (which are
>>> mapped to bits corresponding to reserved features).
>>>
>>> It's unclear to me which should be the better way to address this
>>> inconsistency.
>>>
>>> /P
>>
>>
>> Parav, what's your take here? Given your change broke
>> VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET, do you want to revert it?
> 
> I see two options.
> Opt_1: 
> Open source Linux kernel driver and DPDK PMD has not used RSS_CONTEXT yet.
> If Heng from Alibaba acks that they do not have any internal implementation either, it may be safe to shift _all_ feature > 63 to lower position.
> We can get Yuri's feedback, if at all windows driver has used RSS context.
> 
> And once for all we mark it that feature bits are limited to 0-63.
> There is enough infrastructure in place in virtio spec to not try to squeeze things in feature bits.
> And these 4 bits are good example of it already, which could have been negotiated/communicated at later phase of driver at runtime.
> Only bit required was a bit to expand vnet header size at early stage.
> 
> Advantage: brings the good practice to adapt to the modern and efficient driver->device interface.
> Risk: May break RSS_CONTEXT (risk looks low)
> 
> Opt_2. VIRTIO_NET_CTRL_GUEST_OFFLOADS command text to be updated to indicate that,
> 
> Below defines corresponds to respective feature bits 65 to 68. There is still one to one mapping, its just position is different inside the class.
> This is clarification text to be added and sw can adjust for it.
> 
> #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO 46
> #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
> #define VIRTIO_NET_F_GUEST_USO4 54
> #define VIRTIO_NET_F_GUEST_USO6 55
> 
> Advantages of 2nd option are:
> a. featuring bits remain open upto 127.
> b. Does not break RSS_CONTEXT.
> 
> Both options are practical to me.
> I prefer #1, if Heng acks it, but also ok for #2.

I spent quite of bit of time trying to evaluate the scope of features
bit expansion (implied by the option 2 above).

While strictly speaking I haven't hit yet a complete blocker,
implementation-wise it's going to be huge and error prone, as great deal
of both the kernel and the user-space/qemu infrastructure hard-codes the
64 bit limit.

Even exposing the feature extensions only the the virtio-net device
(AFAICS it will "minimize" the code churn) a lot of code and devices
implementations are going to be impacted.

I expect a far away in time timeline for implementations based on option 2.

/P

