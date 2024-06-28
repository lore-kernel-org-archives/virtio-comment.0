Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F18A145354
	for <virtio-comment@lists.linux.dev>; Fri, 28 Jun 2024 08:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719563017; cv=none; b=hFgKGcCHc/ODW/TQ/2H4qKpndpBbH2X0ezhvpkrHDnHCDlV6fucN+pQW9V9URWqgBauDwNHGIts6vKwodAs/goOBgkVmkrX0LhD9b2T/2ryROVzZKMshl36va6AtSkT9eciNmMubbCLJlJgblwJuYFbbNveLsJ/OxwzIYiePQQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719563017; c=relaxed/simple;
	bh=AmBdCmasJ0cTGF5AaZVt7pgvfdiIlS5w0XTc5B4lBDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7A7e2nu+bSB6ADiHNf5D1zivVnz02/GWqRM6KOFTgO6ZiwzzhZqABTjlzDodyqHxPM1apbFfPlilyq0tWk5feQeryXuM0VfPKjRWbC6sDIazzEz35TWvqm3JBS4jUWBJuzr4IoamwXpxrD0EJVOGv+vDap0PmMMWz2F16jWiy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AurHAJOC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AurHAJOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719563014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c99oAiLwG7uzOeH4zAuKFB/j0VVxdyp4AoJgVv23y3c=;
	b=AurHAJOC6e8jcbzIPI6sZu4+vAY/TXB5FBM1VDkPJiWJFOBAgI8zsSmHGTBReq3CAh69kA
	6Gg0Pr9wfV6KnzqvvlVTkqlleYqH0tzAsWRD9sXBDKIKJ93X7oCBIXpdvVW85ltFlG1fwt
	M39tze5WsQ28v4ktGC56ve3UHFcZxbM=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-op1WAqgbPoOya6LP3UuVLA-1; Fri, 28 Jun 2024 04:23:30 -0400
X-MC-Unique: op1WAqgbPoOya6LP3UuVLA-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2c78c2b7f4bso431475a91.0
        for <virtio-comment@lists.linux.dev>; Fri, 28 Jun 2024 01:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719563010; x=1720167810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c99oAiLwG7uzOeH4zAuKFB/j0VVxdyp4AoJgVv23y3c=;
        b=ljFSURK3jm1CE0r8E5DcAIlLfrQ1d3k8hO8rTODxWjdF/7y9XCMIFRkUeWX0WOs4PZ
         lMQLD9cqGLO8GGyog9od5vrZaNf6FQiN7ccnzyNschX2M1LCK/mAZRsCCO/bDJSdM6J6
         xuLH0hr5q+QiGCLMmlVnx7VCXrlCpMs0xTaIlkAoCtn/WljO2yHOLEKTv6VH7Nl29JND
         x75VLTfyJJ6MnTJR4idf6uiDjOkSfdgI5EQCVG7buBDjMXG6Jej31ez03FMT/po1sMZB
         aDCUGMnI4XVp5MwQ05OX/ZbZWTDRxJzOPvDXAdHT0VFoBaOQ4cB0ow5rauYOjzOjMQ2E
         ILtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtcLRY5IZ6nYV6h3O3eHmUkqfD6jQzOtzuo0R4LRvV4yRFDCWlXz1RqYNUk4LR/FGHdY9f13NvzSfM0yXUGNCycag4W8r4WMuFUv81LlY=
X-Gm-Message-State: AOJu0YxxIfmejg9vG1Y0ZoOGgWsT1JCWPpuNy4FlAPpe9PWQS2dsw+aG
	CsqcK9LuLB5ziybSMtSAMHK9UTPkIQ000vLZ4HGWr5ZI3EvqY0AufYff5wXhGH4fyDimDml5UFs
	yNHQy2KkDifzrlchOCQvBRQo2eJ4oeSZykXxCowMc0aMOzfJgdoKROAlJ5Bj6GFJVuRkXtCyGTX
	QiEsgb89b3Hcok55l8FNDBL7aexvp8bvVw8rCMoAc=
X-Received: by 2002:a17:90b:4f8c:b0:2c7:aafb:8e3c with SMTP id 98e67ed59e1d1-2c861246c21mr14728279a91.18.1719563009727;
        Fri, 28 Jun 2024 01:23:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHimDRwfR/n6UsiKPfyG8tcg7PI+UeGmjqA2IqZP8JRrqzdS3v6ATURUg9ZIZYO94MTwQorV06ZrvMUkbOMDGw=
X-Received: by 2002:a17:90b:4f8c:b0:2c7:aafb:8e3c with SMTP id
 98e67ed59e1d1-2c861246c21mr14728260a91.18.1719563009134; Fri, 28 Jun 2024
 01:23:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
 <1718940245.6932242-13-hengqi@linux.alibaba.com> <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
 <1719020069.8729858-17-hengqi@linux.alibaba.com> <f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
 <PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com> <20240627123732.0cf541b3.pasic@linux.ibm.com>
 <20240627080346-mutt-send-email-mst@kernel.org> <b57acf4d-84e1-4360-a229-eeb7b3d752fc@oracle.com>
 <20240627181635-mutt-send-email-mst@kernel.org> <3297e270-e9a5-404e-92eb-55fbe6c3f78c@oracle.com>
In-Reply-To: <3297e270-e9a5-404e-92eb-55fbe6c3f78c@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 28 Jun 2024 16:23:17 +0800
Message-ID: <CACGkMEsxP0eKK2DbKVTig8MPW0J7z4o5xSSRtk4JAcOMoXmsPw@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Parav Pandit <parav@nvidia.com>, 
	Heng Qi <hengqi@linux.alibaba.com>, Cornelia Huck <cohuck@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 2:57=E2=80=AFPM Si-Wei Liu <si-wei.liu@oracle.com> =
wrote:
>
>
>
> On 6/27/2024 3:18 PM, Michael S. Tsirkin wrote:
> > On Thu, Jun 27, 2024 at 10:14:49AM -0700, Si-Wei Liu wrote:
> >>
> >> On 6/27/2024 5:35 AM, Michael S. Tsirkin wrote:
> >>> On Thu, Jun 27, 2024 at 12:37:32PM +0200, Halil Pasic wrote:
> >>>> On Tue, 25 Jun 2024 18:14:15 -0700
> >>>> Si-Wei Liu <si-wei.liu@oracle.com> wrote:
> >>>>
> >>>>> On 6/24/2024 10:56 PM, Parav Pandit wrote:
> >>>> [..]
> >>>>>> I saw the need of this proposal slightly differently in the discus=
sion with Heng in v4.
> >>>>>> The way I understood is, proposed relaxation enables below Linux d=
river flow to work as equally as without device offering VIRTIO_NET_F_VQ_NO=
TF_COAL.
> >>>>>>
> >>>>>> Flow is:
> >>>>>> 1. The device offered feature VIRTIO_NET_F_VQ_NOTF_COAL
> >>>>>> 2. The virtio-net driver negotiated VIRTNET_FEATURES that has VIRT=
IO_NET_F_VQ_NOTF_COAL
> >>>>>>
> >>>>>> 3. Because VIRTIO_NET_F_VQ_NOTF_COAL is negotiated, device is not =
applying any coalescing on the VQ, in a good hope that driver will perform =
VQ notification coalescing.
> >>>> I have certainly understood this differently. When
> >>>> VIRTIO_NET_F_VQ_NOTF_COAL is not negotiated then the device is not s=
upposed/allowed to do any interrupt coalescing (notification suppression ma=
y still apply).
> >>>>
> >>>> If VIRTIO_NET_F_VQ_NOTF_COAL is negotiated the device is supposed
> >>>> to/MUST do the coalescing according to the parameters as described b=
y
> >>>> the virtio spec.
> >>>>
> >>>> Michael, Jason: Can you guys weigh in on this?
> >>> I still don't understand why this change is needed.
> >>> We have this text:
> >>>
> >>>     The device may generate notifications more or less frequently tha=
n
> >>>     specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> >>>
> >>> and
> >>>
> >>>     The behavior of the device in response to set commands of the VIR=
TIO_NET_CTRL_NOTF_COAL class is best-effort:
> >>>     the device MAY generate notifications more or less frequently tha=
n specified.
> >>>
> >>> So with no spec changes, devices already can do what this patch says =
they can do -
> >>> send notifications less frequently.
> >> Right. If I still recall it correctly, the above text was to accommoda=
te the
> >> interaction with existing used buffer notification mechanism, F_EVENT_=
IDX or
> >> whatnot.
> >> When coalescing is in place and effective, interrupt delivery is a
> >> collaborative consideration based on the coalescing parameters specifi=
ed
> >> *AND * event index / NO_INTERRUPT flag as well.
> > No, not really.
> >
> > For that we have the next sentence:
> >
> > A device SHOULD NOT send used buffer notifications to the driver if the=
 notifications are suppressed, even if the notification conditions are met.
> >
> >
> > And of course event index never makes you send interrupts
> > more frequently.
> Hmmm, this next sentence you reference above was indeed for the
> interaction between coalescing and used buffer suppression. Then what's
> the best-effort part was about, really? Round-up or round down the set
> value to the power of 2 to save space? How is it relevant to our
> discussion? I think even with rounding it shouldn't be too off? (as
> said, by best-effort v.s. give up)

Would it help if we add something like below in the guidance?

When the device wants to send a notification it needs:

1) check notification suppression, don't send interrupt if it is
suppressed otherwise goto 2)
2) check event index, don't send interrupt if event index is not
crossed otherwise goto 3)
3) check coalescing, don't send interrupt if the coalescing limit is
not exceed, otherwise send the interrupt

(Just to demonstrate the idea, needs tweaking for sure)

THanks


>
> -Siwei
>
> >
> >>> Re-reading this spec text, maybe the confusion is that it mentions se=
t
> >>> commands specifically? And it's also stuck in the middle where it's e=
asy
> >>> to miss.
> >>>
> >>> So it would seem that the following should be sufficient, and it look=
s
> >>> like a small clarification we could just apply and include in the
> >>> vote for the csd. What do you guys think?
> >> The revised text below looks good to me.
> >>
> >> Thanks,
> >> -Siwei
> >>>
> >>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >>>
> >>> ----
> >>>
> >>>
> >>> diff --git a/device-types/net/description.tex b/device-types/net/desc=
ription.tex
> >>> index 76585b0..d6788df 100644
> >>> --- a/device-types/net/description.tex
> >>> +++ b/device-types/net/description.tex
> >>> @@ -1711,8 +1711,6 @@ \subsubsection{Control Virtqueue}\label{sec:Dev=
ice Types / Network Device / Devi
> >>>                                            for an enabled transmit/re=
ceive virtqueue whose index is \field{vq_index}.
> >>>    \end{enumerate}
> >>> -The device may generate notifications more or less frequently than s=
pecified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> >>> -
> >>>    If coalescing parameters are being set, the device applies the las=
t coalescing parameters set for a
> >>>    virtqueue, regardless of the command used to set the parameters. U=
se the following command sequence
> >>>    with two pairs of virtqueues as an example:
> >>> @@ -1726,6 +1724,9 @@ \subsubsection{Control Virtqueue}\label{sec:Dev=
ice Types / Network Device / Devi
> >>>    \item Command6: VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET with \field{vq_in=
dex} =3D 1, the device responds with coalescing parameters of index 1 set b=
y command5.
> >>>    \end{itemize}
> >>> +The device can generate notifications more or less frequently
> >>> +than specified by the coalescing parameters.
> >>> +
> >>>    \subparagraph{Operation}\label{sec:Device Types / Network Device /=
 Device Operation / Control Virtqueue / Notifications Coalescing / Operatio=
n}
> >>>    The device sends a used buffer notification once the notification =
conditions are met and if the notifications are not suppressed as explained=
 in \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Used Buffer=
 Notification Suppression}.
> >>> @@ -1798,7 +1799,7 @@ \subsubsection{Control Virtqueue}\label{sec:Dev=
ice Types / Network Device / Devi
> >>>    Upon disabling and re-enabling a receive virtqueue, the device MUS=
T set the coalescing parameters of the virtqueue
> >>>    to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET c=
ommand, or, if the driver did not set any RX coalescing parameters, to 0.
> >>> -The behavior of the device in response to set commands of the VIRTIO=
_NET_CTRL_NOTF_COAL class is best-effort:
> >>> +The behavior of the device in response to specific coalescing parame=
ters is best-effort:
> >>>    the device MAY generate notifications more or less frequently than=
 specified.
> >>>    A device SHOULD NOT send used buffer notifications to the driver i=
f the notifications are suppressed, even if the notification conditions are=
 met.
> >>>
>

