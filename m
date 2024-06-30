Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22EC282ED
	for <virtio-comment@lists.linux.dev>; Sun, 30 Jun 2024 17:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719767104; cv=none; b=tPVMjFujqFuuHIlTyLKxQb/tjOGmvzRLy9mOeufgyigzIEKgJNLhmdsFNcwJ69MDqfvm5zvT6G+0CdrzkUyq5RXGjVPVkld4RuEaRu+8d3ZF8EpNNYB/G4q5VDr1e12sMuU9wdJrG35BPHZP1C1VUKw5kYBCMVRmtU+lY8QtSxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719767104; c=relaxed/simple;
	bh=EiwskjNk9gHHP46FHBLkAs6qCuEY0YlZsiO/GPN/L9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qAYUZin7GgWEJCbmjtPXt0wWQkTOMbkzzamebi/Xeb8g0iA8R3HGjeUQIyOTPXS30woGMPj/TIkJCsUFfxci/Svs8yJm7ua4a1AXQcxPT9HFMLyGnVEtnYUsuOk5ZtNMLwpgJUvc3d6piGJd4ENS/lFK6/aBeQhzqs28OPEr2Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eqTaHecm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eqTaHecm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719767100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bT8lu8A3nTJ5Bk/CNf0xoo38Ji+m+WHfH4ygB/5s5KA=;
	b=eqTaHecm1EaQMywvTPRqcYotGyRAW77fzUCjSUW8rm8oRm9BNmlURTivbbi8ifAiS4w5xg
	awXrMp2Lkag/0Hne4nB4BuRdMj3w7tIishSY2VNRZaLiffjAepf7kBU+hfvBSYxXA8qlvA
	N3SDTf5iI6KqYCaStnKdKcmNlt4/yrg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-J2gTBejPPTKS6Xg8spPhhQ-1; Sun, 30 Jun 2024 13:04:56 -0400
X-MC-Unique: J2gTBejPPTKS6Xg8spPhhQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-363e84940b2so1272841f8f.3
        for <virtio-comment@lists.linux.dev>; Sun, 30 Jun 2024 10:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719767095; x=1720371895;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bT8lu8A3nTJ5Bk/CNf0xoo38Ji+m+WHfH4ygB/5s5KA=;
        b=GjspBkoIY1xQ6YHVg2wFFtaXWmNpZug78cia0E7ib+somijiLzyPCUUIERGZsl75A5
         kYlhEVFY5SS9pWF/hfhhzGK+FXjkXq+3rvn9gGrer7o0cNS9bcNlCtuQtWvAfLRmUDrR
         WYhzyKre3MTut28shtG8Ydm21ZYDSjGashgX06URhPSyxDVx7qpERRhif9aIWltSs5ek
         198F88vmVqA7mfPC95QMR5/JifqWeAnEBWYCZz8GDK7NCJwESLZDC8HVWsBTWan93cD6
         0Lssfsj2TNfS7HBbiYk+Efj2xfLm1tIG7Q5+0eKrXgTtjQV0FYb8vYMM7QjuNP5VMSEv
         u8hg==
X-Forwarded-Encrypted: i=1; AJvYcCXBS3r5ntdUzRJmyCfvvykCorBczEi/pks5emLPE/2eobO1EhC50gaKLMqVLTh3So1sd1I9poAW8NZw2bz5TOFNyCyWIBb9SCnIie4DOG0=
X-Gm-Message-State: AOJu0YxQ1UaMJdUbfumniv4+1fKh2WS4boF8g5CMJl/N44IjAk2H31Kw
	Q3YvSdBTaD6pKzj9F32/4WyiQuRQAtTqOnUtQc9KCdbiAmL5TPw51EYwQ2MkS0R87CWSTLcfcx3
	5ZFN+GEKIpWy0pLI/lO1Q3Cx2NGbatEZoJjEak7UjL91n8i6s5DLxL3g/JM9p6dQ+
X-Received: by 2002:a5d:61cc:0:b0:367:4d9d:568b with SMTP id ffacd0b85a97d-367757283cemr2140955f8f.68.1719767095321;
        Sun, 30 Jun 2024 10:04:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeiPt5Yne6wTPN79PmOCsTwkpYkp+m/wyzPZkYXCvcQONujC6SoONT2joJuGLjTZPGgaCASw==
X-Received: by 2002:a5d:61cc:0:b0:367:4d9d:568b with SMTP id ffacd0b85a97d-367757283cemr2140935f8f.68.1719767094551;
        Sun, 30 Jun 2024 10:04:54 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:346:7728:cff8:104f:5265:699])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103d18sm7840221f8f.106.2024.06.30.10.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 10:04:53 -0700 (PDT)
Date: Sun, 30 Jun 2024 13:04:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: Jason Wang <jasowang@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Parav Pandit <parav@nvidia.com>, Heng Qi <hengqi@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240630125644-mutt-send-email-mst@kernel.org>
References: <f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
 <PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com>
 <20240627123732.0cf541b3.pasic@linux.ibm.com>
 <20240627080346-mutt-send-email-mst@kernel.org>
 <b57acf4d-84e1-4360-a229-eeb7b3d752fc@oracle.com>
 <20240627181635-mutt-send-email-mst@kernel.org>
 <3297e270-e9a5-404e-92eb-55fbe6c3f78c@oracle.com>
 <CACGkMEsxP0eKK2DbKVTig8MPW0J7z4o5xSSRtk4JAcOMoXmsPw@mail.gmail.com>
 <67d0af06-8132-4f0c-afb2-3dbff77ccf10@oracle.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <67d0af06-8132-4f0c-afb2-3dbff77ccf10@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jun 28, 2024 at 12:31:45PM -0700, Si-Wei Liu wrote:
> 
> 
> On 6/28/2024 1:23 AM, Jason Wang wrote:
> > On Fri, Jun 28, 2024 at 2:57 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
> > > 
> > > 
> > > On 6/27/2024 3:18 PM, Michael S. Tsirkin wrote:
> > > > On Thu, Jun 27, 2024 at 10:14:49AM -0700, Si-Wei Liu wrote:
> > > > > On 6/27/2024 5:35 AM, Michael S. Tsirkin wrote:
> > > > > > On Thu, Jun 27, 2024 at 12:37:32PM +0200, Halil Pasic wrote:
> > > > > > > On Tue, 25 Jun 2024 18:14:15 -0700
> > > > > > > Si-Wei Liu <si-wei.liu@oracle.com> wrote:
> > > > > > > 
> > > > > > > > On 6/24/2024 10:56 PM, Parav Pandit wrote:
> > > > > > > [..]
> > > > > > > > > I saw the need of this proposal slightly differently in the discussion with Heng in v4.
> > > > > > > > > The way I understood is, proposed relaxation enables below Linux driver flow to work as equally as without device offering VIRTIO_NET_F_VQ_NOTF_COAL.
> > > > > > > > > 
> > > > > > > > > Flow is:
> > > > > > > > > 1. The device offered feature VIRTIO_NET_F_VQ_NOTF_COAL
> > > > > > > > > 2. The virtio-net driver negotiated VIRTNET_FEATURES that has VIRTIO_NET_F_VQ_NOTF_COAL
> > > > > > > > > 
> > > > > > > > > 3. Because VIRTIO_NET_F_VQ_NOTF_COAL is negotiated, device is not applying any coalescing on the VQ, in a good hope that driver will perform VQ notification coalescing.
> > > > > > > I have certainly understood this differently. When
> > > > > > > VIRTIO_NET_F_VQ_NOTF_COAL is not negotiated then the device is not supposed/allowed to do any interrupt coalescing (notification suppression may still apply).
> > > > > > > 
> > > > > > > If VIRTIO_NET_F_VQ_NOTF_COAL is negotiated the device is supposed
> > > > > > > to/MUST do the coalescing according to the parameters as described by
> > > > > > > the virtio spec.
> > > > > > > 
> > > > > > > Michael, Jason: Can you guys weigh in on this?
> > > > > > I still don't understand why this change is needed.
> > > > > > We have this text:
> > > > > > 
> > > > > >      The device may generate notifications more or less frequently than
> > > > > >      specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> > > > > > 
> > > > > > and
> > > > > > 
> > > > > >      The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> > > > > >      the device MAY generate notifications more or less frequently than specified.
> > > > > > 
> > > > > > So with no spec changes, devices already can do what this patch says they can do -
> > > > > > send notifications less frequently.
> > > > > Right. If I still recall it correctly, the above text was to accommodate the
> > > > > interaction with existing used buffer notification mechanism, F_EVENT_IDX or
> > > > > whatnot.
> > > > > When coalescing is in place and effective, interrupt delivery is a
> > > > > collaborative consideration based on the coalescing parameters specified
> > > > > *AND * event index / NO_INTERRUPT flag as well.
> > > > No, not really.
> > > > 
> > > > For that we have the next sentence:
> > > > 
> > > > A device SHOULD NOT send used buffer notifications to the driver if the notifications are suppressed, even if the notification conditions are met.
> > > > 
> > > > 
> > > > And of course event index never makes you send interrupts
> > > > more frequently.
> > > Hmmm, this next sentence you reference above was indeed for the
> > > interaction between coalescing and used buffer suppression. Then what's
> > > the best-effort part was about, really? Round-up or round down the set
> > > value to the power of 2 to save space? How is it relevant to our
> > > discussion? I think even with rounding it shouldn't be too off? (as
> > > said, by best-effort v.s. give up)
> > Would it help if we add something like below in the guidance?
> > 
> > When the device wants to send a notification it needs:
> > 
> > 1) check notification suppression, don't send interrupt if it is
> > suppressed otherwise goto 2)
> > 2) check event index, don't send interrupt if event index is not
> > crossed otherwise goto 3)
> > 3) check coalescing, don't send interrupt if the coalescing limit is
> > not exceed, otherwise send the interrupt
> > 
> > (Just to demonstrate the idea, needs tweaking for sure)
> Yeah, this looks good to me, in principle. I recall there was detailed
> description like this in the early revisions from the first set of
> coalescing proposal, but those useful descriptions were gone for some
> reason. We should really come up with clear clarifications to help readers
> set expectation rather than being vague or worrying too much about
> verbosity. I was having a hard time in understanding what the best-effort
> part is about...
> 
> -Siwei

It means it's a hint from the driver.
As another example, devices might have a coarse
grained clock, or a limited packet counter.
Or whatever. No need to guess.

There's a balance with verbosity - more text needs to
add value not just repeat same thing many times.
It also needs to be written in an exceptionally clear way
otherwise we are confusing the reader instead of
helping.


And in this case, I think I agree - instead of saying it
is best effort and then clarifying, we should straight away
say this is a hint.

The text in the conformance section should be thus changed:

-The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
+The device MAY treat the coalescing parameters as a hint:
 the device MAY generate notifications more or less frequently than specified.


The text in non conformance section is fine, but let's make it
consistent:
-The device may generate notifications more or less frequently than specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
+	The device can treat coalescing parameters as a hint,
+	generating notifications more or less frequently
+	than specified by the coalescing parameters.

> > 
> > THanks
> > 
> > 
> > > -Siwei
> > > 
> > > > > > Re-reading this spec text, maybe the confusion is that it mentions set
> > > > > > commands specifically? And it's also stuck in the middle where it's easy
> > > > > > to miss.
> > > > > > 
> > > > > > So it would seem that the following should be sufficient, and it looks
> > > > > > like a small clarification we could just apply and include in the
> > > > > > vote for the csd. What do you guys think?
> > > > > The revised text below looks good to me.
> > > > > 
> > > > > Thanks,
> > > > > -Siwei
> > > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > > 
> > > > > > ----
> > > > > > 
> > > > > > 
> > > > > > diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> > > > > > index 76585b0..d6788df 100644
> > > > > > --- a/device-types/net/description.tex
> > > > > > +++ b/device-types/net/description.tex
> > > > > > @@ -1711,8 +1711,6 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> > > > > >                                             for an enabled transmit/receive virtqueue whose index is \field{vq_index}.
> > > > > >     \end{enumerate}
> > > > > > -The device may generate notifications more or less frequently than specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> > > > > > -
> > > > > >     If coalescing parameters are being set, the device applies the last coalescing parameters set for a
> > > > > >     virtqueue, regardless of the command used to set the parameters. Use the following command sequence
> > > > > >     with two pairs of virtqueues as an example:
> > > > > > @@ -1726,6 +1724,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> > > > > >     \item Command6: VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET with \field{vq_index} = 1, the device responds with coalescing parameters of index 1 set by command5.
> > > > > >     \end{itemize}
> > > > > > +The device can generate notifications more or less frequently
> > > > > > +than specified by the coalescing parameters.
> > > > > > +
> > > > > >     \subparagraph{Operation}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing / Operation}
> > > > > >     The device sends a used buffer notification once the notification conditions are met and if the notifications are not suppressed as explained in \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Used Buffer Notification Suppression}.
> > > > > > @@ -1798,7 +1799,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> > > > > >     Upon disabling and re-enabling a receive virtqueue, the device MUST set the coalescing parameters of the virtqueue
> > > > > >     to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set any RX coalescing parameters, to 0.
> > > > > > -The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> > > > > > +The behavior of the device in response to specific coalescing parameters is best-effort:
> > > > > >     the device MAY generate notifications more or less frequently than specified.
> > > > > >     A device SHOULD NOT send used buffer notifications to the driver if the notifications are suppressed, even if the notification conditions are met.
> > > > > > 

