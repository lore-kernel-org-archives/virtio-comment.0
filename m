Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FE21DA317
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 05:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719982901; cv=none; b=OPLx799Y0WajOy7XAsTwNRawMWuQ9wYqe8yyBEX84YDbhbj0VNYAMsYFgbs7hYX6pmuBJcrtCZ7JdP/ls4Ft4SSCstYHZQ3N8TwJ3YMHYr6ZJekSuMNPWc7d+IaR56y16PqPEk547Wb5h/Q83BrlD0T3mSTFIxGpDaCxWXBrqgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719982901; c=relaxed/simple;
	bh=gJRRdKIIHBrf5OlVNdedwoiYp+mLMEBz4Ge5VVYYtNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSXizQURB4bwGS7uUhjZ441+riwXVHZbrKB+b/KH0kcJudCND9J8vFBZlmQwuFsIPqxTTnNxDB1ReQz+FoPJDNWMexUQaGD9mW/43NOCYT4jKzZdQYQ9uIbR2PTr4wOnoxEOSkMBHoomLjFya/oGEU/y2VxxeDQIGdmvBoUGAMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xl8XKEEC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xl8XKEEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719982898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eNFA26nxxOCnFmCGmi5ehrDKkKUYoe6hknmTB3swHlg=;
	b=Xl8XKEECql3T9/+bs4cuZQZbDLqDsjGT19NxYh4Xb6QhE0Dzau3yn8Vnoum0rcqf2RGxNJ
	Xh2jZMbtLRZwWpJo1kcmuUBTjtTGqVa4J2hrS0/jjyTcZMPYZOxjA80FPlrNNh4JhsHGdS
	/CfjLKs4zNJawzT7cfaxmSHClGd8+I0=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-LGi3uO56Pjav3lopsRCYlg-1; Wed, 03 Jul 2024 01:01:35 -0400
X-MC-Unique: LGi3uO56Pjav3lopsRCYlg-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3d8465743a6so1650802b6e.2
        for <virtio-comment@lists.linux.dev>; Tue, 02 Jul 2024 22:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719982895; x=1720587695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNFA26nxxOCnFmCGmi5ehrDKkKUYoe6hknmTB3swHlg=;
        b=uOC1kFRNyfd4Tq8cQVbd17i4FuD6lQm+NrGaFF7pfomY+HuGA9hWUagiL3ZI5RA0Yk
         08HfRSAqByCvaJ0yzPLHJbCFCGhS9E2YNrd0/HG7onek0yfr5Na6fT5npp0VxefgHv0r
         7wA1x2WcniOWT4RHuY+9JQcCiRpQdBafZW2B4vfugux75auXA36M8wy5sKbkZjwAwg6x
         PfPVAZ17XTbWniPwTRfoy/jeDQA4XKxcbtIdD6MW01hHprTx9FJFiMSOfRYvqU+sr7Vw
         qjVyYwj+Lbb0TujVxGc5DpwW+F/hNpfGAf3Vhzrdj6UPPkR7cACOizc/jaVKe7x+VnKm
         o05g==
X-Forwarded-Encrypted: i=1; AJvYcCUct3dSUU8zncu/kzagad2bB1UJoxvAqya0DMPE3C1vzSZ48MCsqqTiU9yS4MWn1JbnnAwRfeV24q9Nq8HZAcylguRNDuXFkd1mmM6FeYk=
X-Gm-Message-State: AOJu0YyqCDJwkWrurVyXCSlW1IRTABVmuUxAej+XWBq0CoW/+xDVjeeQ
	8Xm3srnWgkeU5jcA0Q6t4T6Tt0OzuhhKKBkBEoNY8AOdSyUmQX2zTfnrXqChb11Dc3WF7rXHGQ8
	hThid7Rdb3cZFqnpKOqG3Im5OCJaAOrY1Cdoo7eiRHGQt2yTHSXT77y+Q1NLapnqWP42xTZLNfF
	nSrCNqVekJYas+LVslXY4ETgP5W7kV65kIfwLDVhE=
X-Received: by 2002:a05:6808:16a8:b0:3d8:4603:e7a3 with SMTP id 5614622812f47-3d84603ea7emr6671529b6e.1.1719982894836;
        Tue, 02 Jul 2024 22:01:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1IV5U3T/Ggb83iFkzahvmqhBfxrjqrD+PaievuHZ8nI0iy6ZXrh5BGz03qBl3EBWzmkecGbqtBLAkwsXBbLI=
X-Received: by 2002:a05:6808:16a8:b0:3d8:4603:e7a3 with SMTP id
 5614622812f47-3d84603ea7emr6671506b6e.1.1719982894437; Tue, 02 Jul 2024
 22:01:34 -0700 (PDT)
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
 <CACGkMEsxP0eKK2DbKVTig8MPW0J7z4o5xSSRtk4JAcOMoXmsPw@mail.gmail.com> <20240702223735.4fd2847a.pasic@linux.ibm.com>
In-Reply-To: <20240702223735.4fd2847a.pasic@linux.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 3 Jul 2024 13:01:22 +0800
Message-ID: <CACGkMEs2Kr2V8kUkcp8STxv88zQNi0ZRrqjX6kdYFh17qGMuMg@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Parav Pandit <parav@nvidia.com>, Heng Qi <hengqi@linux.alibaba.com>, 
	Cornelia Huck <cohuck@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 4:38=E2=80=AFAM Halil Pasic <pasic@linux.ibm.com> wr=
ote:
>
> On Fri, 28 Jun 2024 16:23:17 +0800
> Jason Wang <jasowang@redhat.com> wrote:
>
> > > Hmmm, this next sentence you reference above was indeed for the
> > > interaction between coalescing and used buffer suppression. Then what=
's
> > > the best-effort part was about, really? Round-up or round down the se=
t
> > > value to the power of 2 to save space? How is it relevant to our
> > > discussion? I think even with rounding it shouldn't be too off? (as
> > > said, by best-effort v.s. give up)
> >
> > Would it help if we add something like below in the guidance?
> >
>
> It would IMHO greatly benefit clarity, provided we do get it right.

Exactly.

>
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
>
> Yes I agree this indeed needs tweaking. Let me make some points.
>
> 1) for virtio-net we have 3 distinct mechanisms that police used
> buffer notification avoidance, but 2 of the three are actually
> mutually exclusive if I understand it correctly. Namely we have
> coalescing guarded by VIRTIO_NET_F_NOTF_COAL and then depending on
> whether _F_EVENT_IDX was negotiated or not, we have "event_idx based" or
> "crude flag based" notification suppression.
>
> 2) Let me just quote the entire section on the good old used buffer
> notification suppression
> """
> 2.7.7.2 Device Requirements: Used Buffer Notification Suppression
>
> If the VIRTIO_F_EVENT_IDX feature bit is not negotiated:
>
>     * The device MUST ignore the used_event value.
>     * After the device writes a descriptor index into the used ring:
>        -  If flags is 1, the device SHOULD NOT send a notification.
>        -  If flags is 0, the device MUST send a notification.
>
> Otherwise, if the VIRTIO_F_EVENT_IDX feature bit is negotiated:
>
>     * The device MUST ignore the lower bit of flags.
>     * After the device writes a descriptor index into the used ring:
>        - If the idx field in the used ring (which determined where that
>       descriptor index was placed) was equal to used_event, the device
>       MUST send a notification.
>        - Otherwise the device SHOULD NOT send a notification.
>
> Note: For example, if used_event is 0, then a device using
>
> VIRTIO_F_EVENT_IDX would send a used buffer notification to the driver
> after the first buffer is used (and again after the 65536th buffer,
> etc).
> """
>
> Frankly, a MUST is a must, and I don't see very little leeway
> for the coalescing to avoid any notifications. But on the other hand,
> that is the very purpose of the coalescing so IMHO we have a problem
> here.
>
> The only loophole here is "after", which could be stretched to
> "eventually, before the end of the world". Which would basically reduce
> the MUST ad-absurdum, and I would not like that.
>
> 3) AFAIU if multiple suppression mechanisms are active
> concurrently we are aiming for some sort of an logical AND semantic i.e.
> a further reduction over just a single one being employed (and not OR).
>
> But IMHO the both the wording for the event_idx based and curde
> suppression, as well as for coalescing.
>
> Let me quote the full description for the coalescing:
>
> """
> 5.1.6.5.9.1 Operation
> The device sends a used buffer notification once the notification conditi=
ons are met and if the notifications are not suppressed as explained in 2.7=
.7.
>
> When the device has non-zero max_usecs and non-zero max_packets, it start=
s counting microseconds and packets upon receiving/sending a packet. The de=
vice counts packets and microseconds for each receive virtqueue and transmi=
t virtqueue separately. In this case, the notification conditions are met w=
hen max_usecs microseconds elapse, or upon sending/receiving max_packets pa=
ckets, whichever happens first. Afterwards, the device waits for the next p=
acket and starts counting packets and microseconds again.
>
> When the device has max_usecs =3D 0 or max_packets =3D 0, the notificatio=
n conditions are met after every packet received/sent.
> """
>
> Here "Afterwards" is ambiguous. What we want here is "afterwards" =3D=3D
> "after the notification has been sent", but one can also read it as
> "after the condition has been met".

I agree and unfortunately it could be understood differently by
vendors (and we don't even have an open source software implementation
so far to refer to).

Btw, here is the one that is used by Intel E810. It seems better than
the "afterwards" we used here.

"""
Interrupt throttling is a mechanism that guarantees a minimum gap
between two consecutive interrupts (other than possible jitter caused
by handling the interrupts). The E810 counts the time since the last
interrupt is scheduled and compares it against the ITR setting. If an
event associated with this ITR happens before the ITR expires, the
interrupt assertion is delayed until the ITR expires. If the ITR
expires before any event associated with this interrupt, the interrupt
logic is =E2=80=9Carmed=E2=80=9D and the interrupt can be asserted the mome=
nt the
event happens.
"""

And if we follow this it should be "after the notification has been sent".

>
> 4) I see two ways to make sense out of it.
>
> My preferred way would be to replace "send a notification" with
> "generate a notification" in the main text including "2.7.7.2 Device
> Requirements: Used Buffer Notification Suppression", along with adding an
> explanation which states that generated notifications are sent
> immediately unless a device has an active facility that under a certain
> set of conditions  retains and possibly coalesces notifications.
>
> Please notice that here coalescence is used with its dictionary
> meaning (see https://dictionary.cambridge.org/dictionary/english/coalesce=
),

Probably, because we don't tell the driver how many interrupts were
coalesced. I guess that's why it is usually named as "interrupt
moderation" for most of the nic vendors.

> and that the current description of NET_F_NOTIF_COAL is more akin to a
> suppression mechanism where notifications are suppressed or discarded and
> not coalesced.
>
> The notification coalescing facility would then retain the first
> used buffer notification request for each queue (those are still
> generated by the same rules), until either the packet count or the
> timeout type max frequency (or delay we need to clarify that) condition
> is met, and coalesce any further notification requests with the retained
> one until it is sent.
>
> The other way, which I'm not sure is actually viable, is basically to
> try to clarify the hell out of the current approach as taken by
> "5.1.6.5.9.1 Operation" by making it crystal clear when exactly are the
> "notification conditions met" and what is the complement state of that,
> and add a sentence to 2.7.7.2 that references device specific mechanisms
> to do more suppression.  And  of course we would have to find a nice
> definition for "if the notifications are not suppressed as explained in
> 2.7.7." such that loss of initiative is not possible.

This is what I try to achieve. Not sure if it's the best. Or we can
have a pseudo code to explain if it helps.


>
> IMHO any solution where things can stall because we would have sent
> an used buffer notification without "coalescing" but we did not because
> of coalescing  is not acceptable. This could happen if we cross
> event_idx when the coalescing notification conditions are not met and
> thus do not notify, and then when the coalescing notification condition
> are finally met (e.g. via timeout) the event_id type suppression
> is active again because we crossed event_idx when coalescing
> notification condition was not met, and we end up not notifying again.
>
> Sorry for the wall of text.
>
> Regards,
> Halil

Thanks

>
>
>
>

