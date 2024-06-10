Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234F27440B
	for <virtio-comment@lists.linux.dev>; Mon, 10 Jun 2024 14:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718031016; cv=none; b=D9cNX3l4C9WjctkLM4k+5c1NrN9aE+1w7ZqmHEC4CymL17u4Rc5cjx1CrOGo4Pcr5dirxBATz602nUoa6rkvc/h2AQTbmJfsHD9APs608FtZ16okOXVXDdbbsfmeIgZGwEdb5TgrBabS/1CzzcRQ4hhoSg6100BThyDy4N+VNBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718031016; c=relaxed/simple;
	bh=a3Vw+TEUaQxftWFUiBu54dq9g7/QF4acOfE21yrCWL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=aUyarGGyid7g4Bj1WtaScBsw8ziF4fLatc4tykS9Iaovz/LMgW7g4AwvLaMFiHWnduES6NM+G6/sELuBzuWMIWTDYpJFYORHlkwPTHUAZi/kUYZnWQ7gTMGtRFVElBhtKZLkPPbdLxh7qmR1KAMZU2074DZucwVFI8sg0UKnos8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RYdXp+mz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RYdXp+mz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718031014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5j3O7zNupUTzQD97LxRgfz5MtQ+a217FTYWIUXIKQqU=;
	b=RYdXp+mzHyzyVuB88u8jIJ+1a2kJo10ym2ThRi2WZeT+tr1kQExlS8OE/ZxXSR8Nc4Qn29
	lY60kjkwJeGydICxNjv3BqbZ0bNHcAuxfkac3tRvMd7EGRl8jW4xESxH3D5H3K/7QLBZH/
	4JvKqUWWXK2uZqU7WKbo4NUAmGhfECg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-yTlEMUvpN0-7Cg5M_WqNLQ-1; Mon, 10 Jun 2024 10:50:10 -0400
X-MC-Unique: yTlEMUvpN0-7Cg5M_WqNLQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4215b0b1c11so717395e9.3
        for <virtio-comment@lists.linux.dev>; Mon, 10 Jun 2024 07:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718031009; x=1718635809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5j3O7zNupUTzQD97LxRgfz5MtQ+a217FTYWIUXIKQqU=;
        b=Y2d2EXqLgWL5GqDPPDxUuwz0IZHjR8/g/ooTBbxBBnOnu/CuDh8rq8qaqXO3l5Idst
         ffE6Keb5j6Gzfv1QpiuLrXytEDmb7ubPXzxlwxxUgXwAVhmHSZ5SRHAiBp8+yla39X6w
         vxFijptYPmSRTELSK6Vj85USUEFAL9tDwlnm4+Z6OH/sT2xhENSWtP49dztjEaWEeR5e
         JlFAsNhKFyB+6OB0Fua5JzB69bccNIHpGM0N11ud5wnjgCesoxJDIeFaHcMRD8hFfg7u
         TfcXs9C/5GxB2Bg/D3Uh+opksT7kPlMF+NGd2f846jHxf1D7ND6/4JQJZw57xQ8QQINh
         uTyg==
X-Forwarded-Encrypted: i=1; AJvYcCVONUywys5/bw7gcHKcCUfbiZ7I9Eemc+GM1mmIThBIO7SYJ8oXfnywr8kOnHXgwzy0votkW8FzLF5kqvcWtZl77q6UkKjmjk2gc/4psk8=
X-Gm-Message-State: AOJu0Yw0vo9bW6M98G1MjWjvSKMcwNUxaRTk53NeVOza7fjD4JBqlojj
	fd1HvZDxcjEKRS89iH6HxIkFVDZEsKhtP9jQcKJrMQhKgZUoILj6ZFLCbZzmlNBBFpwvqEYd6Fg
	QlpkeMeI5M8sb07xd1+CoQ8uhFaF1z/qBidnCUEmIUBvZyynI3ZzjHJrd/RYRIYKt
X-Received: by 2002:a05:600c:3589:b0:421:7fee:d909 with SMTP id 5b1f17b1804b1-4217feedc9fmr33314745e9.39.1718031009449;
        Mon, 10 Jun 2024 07:50:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSTnaB9jL7lTkz2VskBJflJtl1b1a4oqTQ1MoVZhqqCGxKZkz1SZMFEvGKIldljBstelVsOw==
X-Received: by 2002:a05:600c:3589:b0:421:7fee:d909 with SMTP id 5b1f17b1804b1-4217feedc9fmr33314475e9.39.1718031008913;
        Mon, 10 Jun 2024 07:50:08 -0700 (PDT)
Received: from redhat.com ([2.52.131.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421f23d06ddsm26241205e9.8.2024.06.10.07.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 07:50:05 -0700 (PDT)
Date: Mon, 10 Jun 2024 10:50:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
	virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Parav Pandit <parav@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240610104618-mutt-send-email-mst@kernel.org>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
 <20240607220246.3213607c.pasic@linux.ibm.com>
 <1717814062.4461155-1-hengqi@linux.alibaba.com>
 <20240610144602.57a04723.pasic@linux.ibm.com>
 <1718026545.7557275-2-hengqi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1718026545.7557275-2-hengqi@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 10, 2024 at 09:35:45PM +0800, Heng Qi wrote:
> On Mon, 10 Jun 2024 14:46:02 +0200, Halil Pasic <pasic@linux.ibm.com> wrote:
> > On Sat, 8 Jun 2024 10:34:22 +0800
> > Heng Qi <hengqi@linux.alibaba.com> wrote:
> > 
> > > On Fri, 7 Jun 2024 22:02:46 +0200, Halil Pasic <pasic@linux.ibm.com> wrote:
> > > > On Tue, 28 May 2024 12:47:02 +0800
> > > > Heng Qi <hengqi@linux.alibaba.com> wrote:
> > > >   
> > > > > The device can set any initial coalescing parameters (0 or non-zero)
> > > > > for the receive/send queue before the setting command is executed,
> > > > > not just 0, enhancing device performance even without DIM enabled.
> > > > > 
> > > > > So we need to clarify descriptions that don't fit the behavior.  
> > > > 
> > > > Sorry I'm late to the party -- again! Just for my understanding: how/why
> > > > is this a clarification and not just a (basically incompatible) change?  
> > > 
> > > In my opinion, "clarification" means that something may have been described
> > > incorrectly before, and we now need to discuss, explain clearly, and correct
> > > the possibly incorrect description.
> > > 
> > 
> > I figure the difference in perceived semantics of the word
> > "clarification" is at the root of my confusion. Let us have a look at
> > https://dictionary.cambridge.org/de/worterbuch/englisch/clarification
> > 
> > According to my understanding a "clarification", while an improvement in
> > ease of understanding and/or decrease of ambiguity (possibly to no
> > ambiguity at all) implies that what receiving a clarification is not
> > outright wrong.
> > 
> > When rectifying something that is outright incorrect or wrong, I would
> > refer to that with words like "correction", "fix", "erratum" or
> > "corrigendum".
> > 
> > > > 
> > > > I mean if I read this correctly, before the driver had the guaranty
> > > > that if the parameters are not set by the driver, negotiating the
> > > > feature does not introduce any coalescing. After this in theory
> > > > the device could just pick some max value and potentially introduce
> > > > maximal latency in certain scenarios.  
> > > 
> > > "maximum latency" also means "throughput improvement".
> > > 
> > 
> > Under certain assumptions. But not necessarily. Again my concern is
> > mostly the type of change. The virtio standard maintain a revision
> > history appendix, and I would like to avoid the nature of this change
> > being misrepresented there. If Connie and/or Michael think it is worth
> > fixing, I believe it can be fixed with an editorial change.
> > 
> > AFAIU VIRTIO_NET_F_NOTF_COAL and VIRTIO_NET_F_VQ_NOTF_COAL are about to
> > land with virtio-1.3, i.e. there is no released/standardized virtio
> > version where the "initialize to 0" is released. In that sense it looks
> > like we are still on time to change this. But I am not 100% certain. In
> > any case I don't think this as a huge impact and I'm fine going ahead
> > with the change.
> 
> Sorry for the late reply, I'm on vacation.
> 
> I agree with this, and I prefer to release this patch as a correction for
> virtio1.3 instead of a new patch for virtio1.4, because if devices support moderation coalescing based on virtio1.3,
> and after virtio1.4 is released, these devices need to be updated again for a
> more reasonable coalescing parameters.
> 
> Cornelia and Michael, what do you think?

The TC is just voting to start the public review process.
We can defer that by a couple more weeks if there is
a known issue to address.

For that I expect we want a final patch  and a couple of acks
on list from TC members by end of the ballot, June 13.



> > 
> > > > 
> > > > I understand that it is probably in the best interest of the devices to
> > > > not pick stupid defaults. But it is also probably in the best interest
> > > > of the driver to set those params, and if the driver is going to set its
> > > > values, the devices defaults are moot unless we assume that those may end
> > > > up being used by the driver as a hint when deciding which parameter
> > > > values to choose.  
> > > 
> > > "Any values" is compatible with "0 for max-usecs and max-frames", and the device
> > > can choose "no coalescing".
> > > 
> > > "No coalescing" means "latency friendly", but it also means "a lot of
> > > interruptions and throughput unfriendly". 
> > 
> > To what extent does virtio's "normal" notification suppression
> > (VIRTIO_F_EVENT_IDX) would alleviate that in practice? At least in
> > theory the interruption suppression could save us there right? 
> > 
> 
> Interruption suppression is useful, but many scenes still have a lot of
> interruptions.
> 
> > 
> > > If the device chooses a stupid
> > > maximum value, it is his choice (spec should give more devices choices instead of
> > > forcing them to choose "0" which is not the best practice). We can't talk about
> > > performance for drivers when the devices tend to choose any "stupid" designs.
> > > 
> > > We need relaxe the restrictions and makes the spec more reasonable.
> > > 
> > 
> > Hm, I see Linux virtio-net changes have landed with v6.0 and if I read
> > those correctly the driver -- contrary to my initial expectation --
> > negotiates the feature, but does not set the parameters explicitly and
> 
> How does the driver know what parameters to set? The parameters should be
> exposed by each device.
> 
> > thus keeps the defaults (until userspace decides to set the parameters).
> > So it does matter whether the defaults are guaranteed to be 0 or not,
> > and if not it does matter what defaults are chosen by the device.
> 
> Didn't follow this. More below.
> 
> > 
> > One could even argue that those patches have been reviewed under the
> > assumption that the device needs to use 0 as the default parameter value.
> 
> The default value should not be explicitly specified in the spec, because one
> size does not fit multiple devices. The source of this problem is that we are
> missing fields like default_{rx, tx}_coalesicng_params that indicate the device
> capabilities. No?
> 
> Thanks.
> 
> > 
> > Well no strong opinions here. If the community is fine with it, I'm fine
> > with it as well.
> > 
> > Thank you!
> > 
> > Regards,
> > Halil

