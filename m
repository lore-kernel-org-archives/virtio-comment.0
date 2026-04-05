Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56E6382290
	for <virtio-comment@lists.linux.dev>; Sun,  5 Apr 2026 20:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775420683; cv=none; b=jvTH0w/zvK0JkpzKyYEprwh7P7vB/KoRUg5Bvjcaaa/JBVWkMiByEhYo4WTP0rLJmn2Rm62PsoTMhcWcSKbmjh8V3u0j1g/mE3y8EjC7xLOU1LgNLkK8obXaqSU31Ls9yRkv2zTsZWkpzWQowensBho5Gcfd3L8aywWLt013GNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775420683; c=relaxed/simple;
	bh=Purjk1OPiQUo5MfpwOshCveqHLMjrZROv/gwS645oO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=C7o0B+w71V6+OAWtgnlmqq164u5TAOew4f9TnzQxjpBBfPRsQ+RzP1EeBaJOPXV5T38BGCmebiW0LYLfk+8gwNLR/PyrPZQKsKILypNM2RSphuEQOje2NHVUs7VuvH3K5/56AGcbtWIc8qErZUDdnNV3A/a+JmACH3Vigt/A5N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E/GkdCTn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E/GkdCTn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775420680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qFMuWIC7mEbuQ1M5D9CBI6l8yIRr2SbMOJfXEK4sswQ=;
	b=E/GkdCTn/MY0eObY+JRmFHIZqIV+7s4FoRtR+6w3RtzNkoC3MqONeIVHAJ8lTl3mPIs5Fg
	gxueI+KTC3txuJLrQWSJaktsVDt6Krhl+OfFT7uyHkDKw1kYx8kH4kIssD3iNtpYaUa124
	75TVe4fGOuU1jKaTrhEfRWF/iNLEYNY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-rRoZdROvNNO29czSRnK1CQ-1; Sun, 05 Apr 2026 16:24:39 -0400
X-MC-Unique: rRoZdROvNNO29czSRnK1CQ-1
X-Mimecast-MFC-AGG-ID: rRoZdROvNNO29czSRnK1CQ_1775420678
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48886f1bbd4so27861745e9.1
        for <virtio-comment@lists.linux.dev>; Sun, 05 Apr 2026 13:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775420678; x=1776025478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFMuWIC7mEbuQ1M5D9CBI6l8yIRr2SbMOJfXEK4sswQ=;
        b=mlClvvkVr0dlqbTI6uLFcFOsyYNbUFR7wMQpfrMOXIWEaqSJoazsVq7dI5CawERyMt
         6zV8LFY2UAqSZBPPqMHfunD2e5LKuItl/6Tqk2ybkJDeOaU54XYlM01dsIM1LhnzRUHI
         N2LTnuzQYjjr+jK949tVjQt0uMbkETqF0IB5i7h8ZAPp+zd3gCFbl8zxiDJXnyRTtF0G
         7+J7BJEBuMy9KPEtkhwBnVzNWCnVqVKCIrDMI51S9nqLh3nEo6JHyP/ZgVeOsopDbdlC
         V9lpy3RGH5HUx0+4aF+abMUjeekA/2r1Eh36Yeby28lv6ZRE79R94ACKq892ntDM9zs7
         jwxg==
X-Gm-Message-State: AOJu0YylE6uwmB1Wgj4fi8f+NFTN78Ka45JqyP44UZqW8eN4q5II6QhU
	8pxiWzxoAGV9a5r/FevmXxbSxbwvyEfLPk4PcIEBCsu3l9xiBfjQuwJ46Ckrvpk9Jcx+clDksB8
	8/7uAQgPYwpPlISNLlU7G3SJ99CmVTrQcmO21bUA6gMDfjANfd/+MhxD269miqMlukwYY7Bp0nl
	+X
X-Gm-Gg: AeBDiev5oP393avE4sqXEiFa0OqkaXd8uVr6Ci/pC6ZgZ9e6fLhcqJmlRdlkMntjV2O
	kwZQYoEYW6eqDT0DeboF/iuaahyqPZmEZ5VGWo2BGhPomDQyfZui0+clsCist+qBxlAJwGpJGxc
	9xJ4dfpYQZbuGWf7TpH/TM3PSOfUEwAVD++k8Tg0OXtPtWX9WkkFkvJYL9/2hS8TIMyBn0RxZlq
	CgYq9jKdvrEQUXt0e2yFySUq10tUlNMVmlY7JgM7U22+W4XuoAFQM0uHLdGSN8naxaIEru85W1e
	W/3v6unh41ZD51nMPfysIkO9zVGEsgTNZsnuhYRx7b7qVmiNmjn24Xc47ARsWZfpuEx0AXf6FD6
	5V6JB1+2kOyi97P/i
X-Received: by 2002:a05:600c:1381:b0:487:1108:48af with SMTP id 5b1f17b1804b1-488996a351bmr153511975e9.4.1775420678260;
        Sun, 05 Apr 2026 13:24:38 -0700 (PDT)
X-Received: by 2002:a05:600c:1381:b0:487:1108:48af with SMTP id 5b1f17b1804b1-488996a351bmr153511735e9.4.1775420677789;
        Sun, 05 Apr 2026 13:24:37 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1525:da00:3ac2:1a22:72ff:4256])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d475a6sm105140325e9.8.2026.04.05.13.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 13:24:37 -0700 (PDT)
Date: Sun, 5 Apr 2026 16:24:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: virtio-PCI interrupt corner cases
Message-ID: <20260405161547-mutt-send-email-mst@kernel.org>
References: <983b94a2-a97a-449e-ba4d-ef5360704a59@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <983b94a2-a97a-449e-ba4d-ef5360704a59@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7SSB2CU2mUgIB71F6uFUYAyoqNjTHLxjYadeewkE4fA_1775420678
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 05, 2026 at 03:35:27PM -0400, Demi Marie Obenour wrote:
> There are several corner cases in virtio-PCI interrupt handling.
> I'm trying to figure out what the expected behavior is in these cases,
> as the spec isn't clear.
> 
> 1. Suppose virtqueue 0 is mapped to MSI-X vector 5.  The device
>    triggers an interrupt on virtqueue 0.  Vector 5 is currently masked,
>    so the interrupt becomes pending.  The driver then map virtqueue
>    0 to vector 6 and this succeeds.
> 
>    a. Is there still have an interrupt pending on vector 5?

as per the pci spec, there should not be, as the event source
are satisfied:


	If a masked vector has its Pending bit set, and the associated underlying interrupt events are
	somehow satisfied (usually by software though the exact manner is function-specific), the
	function must clear the Pending bit, to avoid sending a spurious interrupt message later
	when software unmasks the vector. However, if a subsequent interrupt event occurs while
	the vector is still masked, the function must again set the Pending bit.




>    b. If vector 6 is unmasked, is an interrupt delivered immediately?
>    c. If vector 6 is masked, does it become pending?


I don't think there are any guarantees about vector 6.


> 
> 2. Suppose virtqueue 1 is mapped to MSI-X vector 7.  The device
>    triggers an interrupt on virtqueue 1.  Vector 7 is currently masked,
>    so the interrupt becomes pending.  The driver then maps virtqueue 1
>    to NO_VECTOR.
> 
>    Is there still an interrupt pending on vector 7, or is the interrupt
>    lost?

as per the pci spec, there should not be, as the event source
is satisfied. 



> 3. Suppose both virtqueues 3 and 4 are mapped to MSI-X vector 3.
>    The device triggers interrupts on both virtqueues.  Does the driver
>    receive one interrupt or two?

Depends on timing, host architecture etc. spec makes no guarantees.


> I don't have access to the PCI specification (paywall).




> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)





