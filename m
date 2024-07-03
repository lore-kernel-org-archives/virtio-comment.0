Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A6B282FA
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 05:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719983465; cv=none; b=LC8wuIaHQdlHHzZkpWbLvqMbZ7IgH7O1PQEswNTSOnvCe1Db4oapQq2kk+Lvw7XfMkVDXMGX6qQ6yzNanRK/hdGx7rxU01qRu7yRLTOISVpVCSLm4oDWUk/LaJbcMMKtU1GJ2Diebm06cBchesoQCuskTVaZPkdZq1DxWKqYtVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719983465; c=relaxed/simple;
	bh=AT/FuVc89w2vsPgP3d3ix6IUFBaYNRMoK4mkhLrwyJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=thHc7N59Z3ae69MRaEHC4pshBnZ6cRvQaeSfRfQ67sS02yXwheBdQULwCltnbno2CWObD4XSvX3+RUQlCKKGbHB0RnWnb7w4urRSqN8XwbTJOK+UHJ2KAlofwDsiNgXuFLCYvUXgAoXDg0OdxqIT5EpxpJF9NzTgRdrvI05FJu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K6ER2ka0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K6ER2ka0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719983462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EoFQpDQ7MRWjz6dNCrhjUb2QZuHNtD0nyMITallMyyc=;
	b=K6ER2ka04wp2H+C7Ar6J1APTblBXegiDpxmYY5p3hfHvpPxYk/VojyQbNgigi9EC/NW7oe
	JTWSxan7m1e4RBFeE8ENpaYAWd0Las12/WgP1cqEmLLnlnORk1+XW+lvlvUZ/Qaw5/ojHj
	AdnbqF6yMdnnkHRd9elDOWFnKFzomoE=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-i3KMMgQkPtO5b8Dq5oyvvQ-1; Wed, 03 Jul 2024 01:11:01 -0400
X-MC-Unique: i3KMMgQkPtO5b8Dq5oyvvQ-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-70683497777so3667640b3a.2
        for <virtio-comment@lists.linux.dev>; Tue, 02 Jul 2024 22:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719983460; x=1720588260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EoFQpDQ7MRWjz6dNCrhjUb2QZuHNtD0nyMITallMyyc=;
        b=N+N+kVtO/R6lWw/+6I5mqYDE0paufZCXuO1PmjEymTyDOaDFvUragdW/aQquPtKhN4
         IergKkATbNQK747XrYyY22jy5nje+j4QNQOO94FCJmQvXB22aIHtw4cbPYApdbP+yrFM
         W1zgygE2IMT+pv3LwMfHsz8jVbQ4GHEkQ03PjKTo8axL4GLI5YBkr9zB7d2wMgE5xHuM
         sCxJd3dkzvPgVtpF/TbAEJWvLGcxJ+/7GSezhhPPy5xk8AnOPb+OqJ9op5+tjgUOX27H
         AwBY2eQWLNOZHj1EpyRm/ULmtQoRR8Tp6In6DSJzAIixGZa/2f2UGRSUJsl3RRwomu2O
         onHw==
X-Gm-Message-State: AOJu0YwRonmfwlcm7w4zeL3A5+cbsx/S7/0cIjUAJcIbcIfCzn9SpIrp
	3jCpB2Shyj8ntKP3F9UDsZ8ggwuv3TS/nq8PvSdREVrnRCIVzRzd1ibBgi+/r8uGqKcZBpYYg+C
	0sE/HI4tWdiPgw/0ZmzGgCOc7aj5eayjWacvQivAZ4DvqVHUTmZoB3YiecRXn7VQqXNVjHv7XTr
	ZvD0jE0wuw10w+EBzcQOHsQrYiXAW7Fqvs52tmw0M=
X-Received: by 2002:a05:6a00:4fd4:b0:706:8cc6:7471 with SMTP id d2e1a72fcca58-70aaaf453eemr10504683b3a.34.1719983459748;
        Tue, 02 Jul 2024 22:10:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5KhCytPq2eWPWACwIKDtS4UPUDlK+Qsr+EwFA3SgN+jtM0CUSiQhVNqSRXgn1NqOJhYV+3ax3wKk/85/zkw8=
X-Received: by 2002:a05:6a00:4fd4:b0:706:8cc6:7471 with SMTP id
 d2e1a72fcca58-70aaaf453eemr10504662b3a.34.1719983459292; Tue, 02 Jul 2024
 22:10:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <CACGkMEvrHNnjdgC6Ls=YWRPFxpirCFkbf8_VnNsh-VU4NoK3tw@mail.gmail.com> <SI2PR06MB53850C468CF18A489A6E1ED4FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
In-Reply-To: <SI2PR06MB53850C468CF18A489A6E1ED4FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 3 Jul 2024 13:10:47 +0800
Message-ID: <CACGkMEtzcaUAauzpUdwjS6MEzF-suGLRv5+7cX4PeoAaqEP9hg@mail.gmail.com>
Subject: Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
To: Lege Wang <lege.wang@jaguarmicro.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	"vattunuru@marvell.com" <vattunuru@marvell.com>, "ndabilpuram@marvell.com" <ndabilpuram@marvell.com>, 
	"parav@nvidia.com" <parav@nvidia.com>, "mst@redhat.com" <mst@redhat.com>, Leo Liu <leo.liu@jaguarmicro.com>, 
	Angus Chen <angus.chen@jaguarmicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 12:33=E2=80=AFPM Lege Wang <lege.wang@jaguarmicro.co=
m> wrote:
>
> hi
>
> Thanks for your review.
>
> >
> > > DPU(Data Processing Unit), DPU would need to submit DMAs to copy gues=
t
> > > suppression informations to DPU internal memory, then check whether
> > > used event should be notified by examing this internal memory, which
> > > is obvious expensive, and this DMA operation is needed every time
> > > DPU attempts to issue used event,
> >
> > Several things could be used to help here:
> >
> > 1) With the event index, as long as the used index doesn't pass used
> > events you don't need to fetch even index every time
> Yeah, I agree VIRTIO_F_EVENT_IDX could help here, but I think it's a rela=
tively
> crude mechanism, I have two questions below:
>   1. Used event notification suppression structure is still located in
>   host memory(in dpu case), I'm not sure whether used_event would
>   be allowed to update in the running of one virtio device,

What did you mean by "update" here?

>   If it's allowed,
>   seems devices still need to fetch newest used_event info timely.

It depends on how you define "timely", I mean unless the used event is
not crossed, you don't need to fetch it from the main memory?

But basically, I meant putting used_event in a cap/register other than
inventing something completely new.

>   2. According to virtio-spec, for example, if used_event is 0, then a de=
vice with
>   VIRTIO_F_EVENT_IDX would send a used buffer notification to the driver =
after
>   the first buffer is used (and again after the 65536th buffer), should t=
his behavior
>   be strictly followed?

Used index is best effort, and the driver must handle spurious interrupt.

>  For example, driver with VIRTIO_F_EVENT_IDX negotiated
>   sets used_event to 0, used buffer notification still could be sent for =
any used buffer event.

Only once in every #vring_size, no?

>
> > 2) Interrupt coalescing may help to throttle the interrupt rate
> > 3) Spec doesn't forbid implementation specific heuristics for
> > interrupt moderation
> Yes, indeed we're trying to use the information about the latest used rin=
g entry
> driver has processed, which is introduced in this patch, to do interrupt =
coalescing or moderation.
>
> > > now, but it may choose appropriate timing to send used events accordi=
ng to
> > > its notification coalescing policy , now it also does not need to DMA=
 guest
> > > memory to obtain notification suppression.
> >
> > Performance numbers are welcomed:
> >
> > 1) compare disabling via register against memory
> > 2) compare auto disable against no auto
> I see, but sorry, currently we don't have any performance numbers yet,
> but theoretical analysis

This might be also helpful, for example, without this proposal x pci
transactions per packet, with this proposal y pci transactions per
packet.

>  and think it'll help improve performance. Some
> popular nic also supports this feature, which disables interrupt after se=
nding
> one and needs driver to enable it again. When enabling interrupt again, d=
rivers
> can attach some extra information.

I'm not saying it doesn't make sense, but t

1) the movitiaton needs to be well explained
2) we need to know if the existing mechanism can be reused (e.g place
used_event in a register)
3) or how the new method interact with existing interrupt moderation
features (event index, interrupt coalescing etc)

>
> >
> > > +      The driver may benefit from just informing device the latest u=
sed
> > ring entry
> > > +      it has processed, but not enabling used buffer notification. T=
his field
> > only
> > > +      occupies one bit, if set to 1, it will enable used buffer noti=
fication,
> > otherwise not.
> > > +\end{description}
> >
> > Any reason we can't reuse the existing meachsim like used index /
> > event suppression here?
> Please see my comments above.
>
> Regards,
> Xiaoguang Wang
> >
> > Basically it just sounds like we need a transport specific method for
> > them besides being part of the virtqueue.
> >
> > Thanks

Thanks

>

