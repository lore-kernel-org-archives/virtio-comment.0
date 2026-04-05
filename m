Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F8B38239F
	for <virtio-comment@lists.linux.dev>; Sun,  5 Apr 2026 20:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775421803; cv=none; b=n/0Gjt5kULXogoja0svhh62cmhjoyZ5lVAXjWqhJrTpf3VOBimV/SM4ZMjiewE8KqT5xYxv2lJa4yWfCYeHe5R87zcYHDolOFv7SXKxpMheyG4yxlsmMbYJ7m+Jx6KeJoyyaCY4GH2NZmSxDR2oICbfdifWn+6UniolRc7pCw9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775421803; c=relaxed/simple;
	bh=0ZZIyrp3uwJcbSbSQnFcV6N1rAyxF+I3DOUkq9h7dOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=oImVRD/bmJDEODa23bXUcwp8Bcr5G0uGBG0pYSymaUP653Ck62zCEgsAbbylHHpf80nDuHDkglIL81bT/tX2tJjSYU2YGeyaIjNRcWfMEdTwwmhoMvJ0t5PASArySP73PlJV6bpveU2SRQ52u76/EtZzeKI6gAZKtcI1D3aLdUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mcyytgx3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mcyytgx3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775421799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x0dwtFYAuBPN7+u7NVXL3na58ljBLKy2zkSzfhKnXUY=;
	b=Mcyytgx3BmcpnUmGzeoXIhtiXd5fPbCSwnO7saVwWHL2cbn8SuuqD49r80UdDypphCkscg
	CnoA0mJ16MzsiX3RjWUbeq5rMwrTULseRhi6H+cifGGHk3L2sopYvdJqY6jjAtRuxkMqk8
	HCnAIcEnFVfCURL8Depi97Xqqv/46HE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-s9t_oifRMLKJ14JMOIbo-w-1; Sun, 05 Apr 2026 16:43:18 -0400
X-MC-Unique: s9t_oifRMLKJ14JMOIbo-w-1
X-Mimecast-MFC-AGG-ID: s9t_oifRMLKJ14JMOIbo-w_1775421797
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43d03ae4f2aso2806800f8f.1
        for <virtio-comment@lists.linux.dev>; Sun, 05 Apr 2026 13:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775421797; x=1776026597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0dwtFYAuBPN7+u7NVXL3na58ljBLKy2zkSzfhKnXUY=;
        b=fXF67qmAfR7m1WMBMYsR/lTlAep8KDppQvnB29N39R0hvWp+aDVk6EK2HUKoW3ttLO
         zjSAkpqNHjULUmdV3EIsgeEnY1Q2GSMF+WxfDq+ZDIpcant02ZKzwNue/hoOAFTbkEmC
         ahlGa69XQCetJNpyB2VcVejpG0WLrOcKzQcdOpKyFOaedQ4lcwbaM+DwJGA6ZcOD8wS5
         MvSDR2JeKg9lQDTAmiRIda/KbrE0jkavcAur7+cTUBfn7JX89ovkWhtD9i995/VEtf2y
         AqtA2xcMcsXxLwWlpPoOU5+crPr3QczJx1ldiTXlW7zQMYEburO9oTAOLRsb9pp+aFWp
         zfXw==
X-Gm-Message-State: AOJu0YwLM4oPiDVJB6hwMxMs16BoSDgx9MqnSvJhdU89gSUsbBn/7g2a
	u41sxh1hInqgZ7gXneU3NO7jBfPsfWKLGBVStJY+3ENFTOSX45vZQbrXYTkXRAl5WKJiEkNeLWd
	fVw9xiwEMsT8mi9kHHnukuly/3+GTrZZtZgMZt7V1OcDVZYnjLuiR080rKZTzPwo5p3afRuYPnn
	jn
X-Gm-Gg: AeBDietccLKWXHqLmG30uuW9xK0U0VkRcw/fCIwZ2URk1DQZVo4bgq35BRnBPhM3j7V
	QQ51zTHPHpiMxeO24onrTSYClq548Muca/3ykqsDG6aEqfvlt82yk1SAfoEJa1WNJFGuvksvO1K
	RcBB/B5PmUURURRW4x5FBf/rEJ/il/1cTyUhSKjtEwEgJBQJHQVh0dsIyin8V4Qbn89vzcdOTse
	c9oHooG7pFXk0R7LG5kXCyoDD7qT0whgbM/ET9HASke/gZI0EIUO3rnEm5vVkJgC6WlT/JgeCSE
	4afC3HoGFfPI0+mqK8JGiynuKCnd9uwCk6gNzFKKZa5BzgTxTwrTWXlfqzkwO5auD8E7pcpF4jq
	qJnNM4sY7CY+T5kXn
X-Received: by 2002:a05:6000:18a9:b0:43b:8f29:b08f with SMTP id ffacd0b85a97d-43d292e15damr14969146f8f.30.1775421797041;
        Sun, 05 Apr 2026 13:43:17 -0700 (PDT)
X-Received: by 2002:a05:6000:18a9:b0:43b:8f29:b08f with SMTP id ffacd0b85a97d-43d292e15damr14969131f8f.30.1775421796543;
        Sun, 05 Apr 2026 13:43:16 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1525:da00:3ac2:1a22:72ff:4256])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f5bsm31867988f8f.7.2026.04.05.13.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 13:43:16 -0700 (PDT)
Date: Sun, 5 Apr 2026 16:43:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: virtio-PCI interrupt corner cases
Message-ID: <20260405163944-mutt-send-email-mst@kernel.org>
References: <983b94a2-a97a-449e-ba4d-ef5360704a59@gmail.com>
 <20260405161547-mutt-send-email-mst@kernel.org>
 <a9ccf52a-ffda-48a6-ae30-20e22d65ec35@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <a9ccf52a-ffda-48a6-ae30-20e22d65ec35@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UinJMKqFm_RG6GxJhCr7GdDW3V_XNuwbfMNcc11dVRc_1775421797
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 05, 2026 at 04:34:15PM -0400, Demi Marie Obenour wrote:
> On 4/5/26 16:24, Michael S. Tsirkin wrote:
> > On Sun, Apr 05, 2026 at 03:35:27PM -0400, Demi Marie Obenour wrote:
> >> There are several corner cases in virtio-PCI interrupt handling.
> >> I'm trying to figure out what the expected behavior is in these cases,
> >> as the spec isn't clear.
> >>
> >> 1. Suppose virtqueue 0 is mapped to MSI-X vector 5.  The device
> >>    triggers an interrupt on virtqueue 0.  Vector 5 is currently masked,
> >>    so the interrupt becomes pending.  The driver then map virtqueue
> >>    0 to vector 6 and this succeeds.
> >>
> >>    a. Is there still have an interrupt pending on vector 5?
> > 
> > as per the pci spec, there should not be, as the event source
> > are satisfied:
> > 
> > 
> > 	If a masked vector has its Pending bit set, and the associated underlying interrupt events are
> > 	somehow satisfied (usually by software though the exact manner is function-specific), the
> > 	function must clear the Pending bit, to avoid sending a spurious interrupt message later
> > 	when software unmasks the vector. However, if a subsequent interrupt event occurs while
> > 	the vector is still masked, the function must again set the Pending bit.
> 
> That makes sense, and is thankfully the easiest to implement.
> 
> >>    b. If vector 6 is unmasked, is an interrupt delivered immediately?
> >>    c. If vector 6 is masked, does it become pending?
> > 
> > 
> > I don't think there are any guarantees about vector 6.
> 
> In that case I will go with whichever option is easier to implement.
> 
> Is this a driver bug, or can a driver check to see if an interrupt
> would have been needed in a race-free way?

I'd expect the driver can just poll the vq?


> >> 2. Suppose virtqueue 1 is mapped to MSI-X vector 7.  The device
> >>    triggers an interrupt on virtqueue 1.  Vector 7 is currently masked,
> >>    so the interrupt becomes pending.  The driver then maps virtqueue 1
> >>    to NO_VECTOR.
> >>
> >>    Is there still an interrupt pending on vector 7, or is the interrupt
> >>    lost?
> > 
> > as per the pci spec, there should not be, as the event source
> > is satisfied. 
> 
> Makes sense.  This is also the easiest to implement, thankfully.
> 
> >> 3. Suppose both virtqueues 3 and 4 are mapped to MSI-X vector 3.
> >>    The device triggers interrupts on both virtqueues.  Does the driver
> >>    receive one interrupt or two?
> > 
> > Depends on timing, host architecture etc. spec makes no guarantees.
> 
> Is the driver still guaranteed to get at least one interrupt, and
> not more than two?

at least one I figure, surely?
The spec has this implementation note:

	When system software allocates fewer MSI or MSI-X vectors to a function than it requests,
	multiple interrupt sources within the function, each desiring a unique vector, may be
	required to share a single vector. Without proper handshakes between hardware and
	software, hardware may send fewer messages than software expects, or hardware may send
	what software considers to be extraneous messages.


> Thank you so much for your time and help.
> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)





