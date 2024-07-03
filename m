Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F217B1DA316
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 06:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719986985; cv=none; b=j9qA2Y87IOkZju0cyWs4aYGVlQW9ahr//Na5NcwyQC8Ko7PkGHaMsTTuW+0/Utkw59MtG9Fwcni8VX8gthj3Jb+C/8kSIuVy8VqdKWCNeTsupxtVQ14jjd9NqQcN7lBVJaZquUbvlkBEMBt6VwdprQD9SVKKxvOvAfEH/Zwznb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719986985; c=relaxed/simple;
	bh=48xcqJ2oeLLs9f0X1rfzm8FbnvvchOuomAX8bRRTHeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BqYR56g2cc7p48VBTbREAACfVHYqDZ7J3KecCal/jaYYKUGZ5egICahDbDwQRoz5hDsG5bihz69cgssh8nqpLx9jFqLMJt4xZ1EtNoT/w11jgwTbGMdOqDzLn4xB0833rhDlBEiQBI7hBldtiHRVlbQ7S0IOH230zfGw0q9c9Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NUMpMHRp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NUMpMHRp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719986981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/qEQQOboO2me6EbmAlg7yMkdHYYmXy7nLqmDuw9M9kg=;
	b=NUMpMHRpMONVs5jTfwmK/7J1YVV/7n5cEDcoATGy33x7+qDsRxbQilvAzNO85sB/tcLF3S
	Wflo7kodjOs59fUYE68jp0erGAsLbIExLu4/ti0ht57VHc14T1vEoJ4zZNlZeVCKeLdP0b
	QB/DzyLepKNmtNk6aprY7lXpnF/PMuA=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-VRo2PW78OlaYsoNpcRmHzA-1; Wed, 03 Jul 2024 02:09:40 -0400
X-MC-Unique: VRo2PW78OlaYsoNpcRmHzA-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-706875d27easo3833615b3a.1
        for <virtio-comment@lists.linux.dev>; Tue, 02 Jul 2024 23:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719986979; x=1720591779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qEQQOboO2me6EbmAlg7yMkdHYYmXy7nLqmDuw9M9kg=;
        b=P2UGRf9tEq+zvKME8VDPWFJ+8lXt5zBrJ5791bDzN2Yom3g1Hl5f40FcTYaitQHoPX
         KmVAAXXwLCmzKAgTa20qNPGSQ5eA7kL2DHkoYhcBhyUyaU823Y1KccH05BCx2IGFTQBG
         eiy2Bsp/272BI8CRyDbFO2PkPzduRdmbvF37sDI1Z4AE4ZerRspQqVnK+pTp5GOHE+DU
         SyFwiAp/6vPyjZXvCLgFAOxm0nE0G+jCrGfY4u8QXCo8hYuStZQ24xavZsIjXRtJU/0L
         V0bewn/ie/tu2IdxiNuUIqNBci1qdSI1V4vx0HpXpr+7GMsOgHyHRklDA1rQGIFipxRo
         bxCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL72mc7UsNFBr38jTa03wQUdlGs2sQdU8VLIlmvwdi1ep8G7r54ODciZu2DYuYqkE/yAVm54bdCahLNeGt56YMfeCuTH4+fuutEX3MMS0=
X-Gm-Message-State: AOJu0YyVg6FAvKlRXxQRbh6dD+Y+oYee5Fxcs3UnUSdOJsWSNz+yrXc2
	GidwCL/JFgo55oj7pqtPqxvGX7XZ/Wo9LPx5jpKqw0Q2oxkWObG5tVPQOwFscvAIYN5A3AUETqz
	WCfI3Po4RxQuVuKG3QvBbUJKwpgEgt4xwTTYnjqsitE2OhZtvMG5K0iY5Ys6+wyTtACaTU9Op7c
	eWTPcZc3nOk8nWNXyBblcdw8Lf/a62w0sKGf6XYOM=
X-Received: by 2002:a05:6a00:1944:b0:706:423b:2ed1 with SMTP id d2e1a72fcca58-70aaad299a8mr9742260b3a.6.1719986979515;
        Tue, 02 Jul 2024 23:09:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu/evNvrEWI8PqMG2/zjPYHLIVZ/u7BG4PgMbRgSqKwKvW6OD3+7CNCmwB4Zy6+AeNIIORdQdjadnqXow80hw=
X-Received: by 2002:a05:6a00:1944:b0:706:423b:2ed1 with SMTP id
 d2e1a72fcca58-70aaad299a8mr9742238b3a.6.1719986978987; Tue, 02 Jul 2024
 23:09:38 -0700 (PDT)
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
 <CACGkMEsxP0eKK2DbKVTig8MPW0J7z4o5xSSRtk4JAcOMoXmsPw@mail.gmail.com> <67d0af06-8132-4f0c-afb2-3dbff77ccf10@oracle.com>
In-Reply-To: <67d0af06-8132-4f0c-afb2-3dbff77ccf10@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 3 Jul 2024 14:09:26 +0800
Message-ID: <CACGkMEu-9d9GLGA1Lsfb9iJWLh2AYmO5p17HEtAdztoGQjLvKA@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Parav Pandit <parav@nvidia.com>, 
	Heng Qi <hengqi@linux.alibaba.com>, Cornelia Huck <cohuck@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 29, 2024 at 3:32=E2=80=AFAM Si-Wei Liu <si-wei.liu@oracle.com> =
wrote:
>
>
>
> On 6/28/2024 1:23 AM, Jason Wang wrote:
> > On Fri, Jun 28, 2024 at 2:57=E2=80=AFPM Si-Wei Liu <si-wei.liu@oracle.c=
om> wrote:
> >>
> >>
> >> On 6/27/2024 3:18 PM, Michael S. Tsirkin wrote:
> >>> On Thu, Jun 27, 2024 at 10:14:49AM -0700, Si-Wei Liu wrote:
> >>>> On 6/27/2024 5:35 AM, Michael S. Tsirkin wrote:
> >>>>> On Thu, Jun 27, 2024 at 12:37:32PM +0200, Halil Pasic wrote:
> >>>>>> On Tue, 25 Jun 2024 18:14:15 -0700
> >>>>>> Si-Wei Liu <si-wei.liu@oracle.com> wrote:
> >>>>>>
> >>>>>>> On 6/24/2024 10:56 PM, Parav Pandit wrote:
> >>>>>> [..]
> >>>>>>>> I saw the need of this proposal slightly differently in the disc=
ussion with Heng in v4.
> >>>>>>>> The way I understood is, proposed relaxation enables below Linux=
 driver flow to work as equally as without device offering VIRTIO_NET_F_VQ_=
NOTF_COAL.
> >>>>>>>>
> >>>>>>>> Flow is:
> >>>>>>>> 1. The device offered feature VIRTIO_NET_F_VQ_NOTF_COAL
> >>>>>>>> 2. The virtio-net driver negotiated VIRTNET_FEATURES that has VI=
RTIO_NET_F_VQ_NOTF_COAL
> >>>>>>>>
> >>>>>>>> 3. Because VIRTIO_NET_F_VQ_NOTF_COAL is negotiated, device is no=
t applying any coalescing on the VQ, in a good hope that driver will perfor=
m VQ notification coalescing.
> >>>>>> I have certainly understood this differently. When
> >>>>>> VIRTIO_NET_F_VQ_NOTF_COAL is not negotiated then the device is not=
 supposed/allowed to do any interrupt coalescing (notification suppression =
may still apply).
> >>>>>>
> >>>>>> If VIRTIO_NET_F_VQ_NOTF_COAL is negotiated the device is supposed
> >>>>>> to/MUST do the coalescing according to the parameters as described=
 by
> >>>>>> the virtio spec.
> >>>>>>
> >>>>>> Michael, Jason: Can you guys weigh in on this?
> >>>>> I still don't understand why this change is needed.
> >>>>> We have this text:
> >>>>>
> >>>>>      The device may generate notifications more or less frequently =
than
> >>>>>      specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL cla=
ss.
> >>>>>
> >>>>> and
> >>>>>
> >>>>>      The behavior of the device in response to set commands of the =
VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> >>>>>      the device MAY generate notifications more or less frequently =
than specified.
> >>>>>
> >>>>> So with no spec changes, devices already can do what this patch say=
s they can do -
> >>>>> send notifications less frequently.
> >>>> Right. If I still recall it correctly, the above text was to accommo=
date the
> >>>> interaction with existing used buffer notification mechanism, F_EVEN=
T_IDX or
> >>>> whatnot.
> >>>> When coalescing is in place and effective, interrupt delivery is a
> >>>> collaborative consideration based on the coalescing parameters speci=
fied
> >>>> *AND * event index / NO_INTERRUPT flag as well.
> >>> No, not really.
> >>>
> >>> For that we have the next sentence:
> >>>
> >>> A device SHOULD NOT send used buffer notifications to the driver if t=
he notifications are suppressed, even if the notification conditions are me=
t.
> >>>
> >>>
> >>> And of course event index never makes you send interrupts
> >>> more frequently.
> >> Hmmm, this next sentence you reference above was indeed for the
> >> interaction between coalescing and used buffer suppression. Then what'=
s
> >> the best-effort part was about, really? Round-up or round down the set
> >> value to the power of 2 to save space? How is it relevant to our
> >> discussion? I think even with rounding it shouldn't be too off? (as
> >> said, by best-effort v.s. give up)
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
> reason. We should really come up with clear clarifications to help
> readers set expectation rather than being vague or worrying too much
> about verbosity.

Yes.

> I was having a hard time in understanding what the
> best-effort part is about...

Being verbose might be helpful for vendors. Otherwise the may guess
(since we don't have a reference software implementation so far).

Thanks

>
> -Siwei
> >
> > THanks
> >
> >
> >> -Siwei
> >>
> >>>>> Re-reading this spec text, maybe the confusion is that it mentions =
set
> >>>>> commands specifically? And it's also stuck in the middle where it's=
 easy
> >>>>> to miss.
> >>>>>
> >>>>> So it would seem that the following should be sufficient, and it lo=
oks
> >>>>> like a small clarification we could just apply and include in the
> >>>>> vote for the csd. What do you guys think?
> >>>> The revised text below looks good to me.
> >>>>
> >>>> Thanks,
> >>>> -Siwei
> >>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >>>>>
> >>>>> ----
> >>>>>
> >>>>>
> >>>>> diff --git a/device-types/net/description.tex b/device-types/net/de=
scription.tex
> >>>>> index 76585b0..d6788df 100644
> >>>>> --- a/device-types/net/description.tex
> >>>>> +++ b/device-types/net/description.tex
> >>>>> @@ -1711,8 +1711,6 @@ \subsubsection{Control Virtqueue}\label{sec:D=
evice Types / Network Device / Devi
> >>>>>                                             for an enabled transmit=
/receive virtqueue whose index is \field{vq_index}.
> >>>>>     \end{enumerate}
> >>>>> -The device may generate notifications more or less frequently than=
 specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> >>>>> -
> >>>>>     If coalescing parameters are being set, the device applies the =
last coalescing parameters set for a
> >>>>>     virtqueue, regardless of the command used to set the parameters=
. Use the following command sequence
> >>>>>     with two pairs of virtqueues as an example:
> >>>>> @@ -1726,6 +1724,9 @@ \subsubsection{Control Virtqueue}\label{sec:D=
evice Types / Network Device / Devi
> >>>>>     \item Command6: VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET with \field{vq=
_index} =3D 1, the device responds with coalescing parameters of index 1 se=
t by command5.
> >>>>>     \end{itemize}
> >>>>> +The device can generate notifications more or less frequently
> >>>>> +than specified by the coalescing parameters.
> >>>>> +
> >>>>>     \subparagraph{Operation}\label{sec:Device Types / Network Devic=
e / Device Operation / Control Virtqueue / Notifications Coalescing / Opera=
tion}
> >>>>>     The device sends a used buffer notification once the notificati=
on conditions are met and if the notifications are not suppressed as explai=
ned in \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Used Buf=
fer Notification Suppression}.
> >>>>> @@ -1798,7 +1799,7 @@ \subsubsection{Control Virtqueue}\label{sec:D=
evice Types / Network Device / Devi
> >>>>>     Upon disabling and re-enabling a receive virtqueue, the device =
MUST set the coalescing parameters of the virtqueue
> >>>>>     to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SE=
T command, or, if the driver did not set any RX coalescing parameters, to 0=
.
> >>>>> -The behavior of the device in response to set commands of the VIRT=
IO_NET_CTRL_NOTF_COAL class is best-effort:
> >>>>> +The behavior of the device in response to specific coalescing para=
meters is best-effort:
> >>>>>     the device MAY generate notifications more or less frequently t=
han specified.
> >>>>>     A device SHOULD NOT send used buffer notifications to the drive=
r if the notifications are suppressed, even if the notification conditions =
are met.
> >>>>>
>

