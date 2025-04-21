Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7888A210FB
	for <virtio-comment@lists.linux.dev>; Mon, 21 Apr 2025 02:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745204194; cv=none; b=twgpTSqqGmAx84xwBd7HmUUxxrm3hgCst7+rHT5+SM7uDBQTQDsLybCzud3rnCqHxKSKuXmTXSVdxsbC7vMuxdwJ+frD7m+ekm27n5lno4yT9s4vaRvSEjCKI4+pM0WLF6KaOs386rD+7HpbGzxg/scFzMn7b6vk+gkWpvKgxUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745204194; c=relaxed/simple;
	bh=EX61QT41Es4yP77sB2zvZ5C59Tc4vWw58TfyBqZgPgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W4CqzJk2AcVXryUux7DOi2lKOOO23YO0i4T07bYQ+/Sj91lZmktd2fx+UQBWI/MNFYzQaeYu/a6uxNbVKEXijXm5n3o2AXf5T8Zl3lzG0WvQpV8JuY73QIv6UxbiLmBIi/HA3g3XidqBVlKNl2NVLin+FerAhrbOmi7hi/stXEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HGvltP8Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HGvltP8Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745204191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bjJJNnenVvfTrlE5OXy7vcjmESb/kZH5AbLEr4xBQ8k=;
	b=HGvltP8YU56JHwasgc02V2LydUHKvGQg3Bz0JZtVjhgWG9Qsk1ITrXOvUHBcSp0uCBq+fY
	1zCnx286j+Pii6ZZyUXC2Socgox5+WcNB79nvfwD7mSosANxR99T+sNs0LCM6b6FdEH69K
	ZIjrpkO3FBvFjCMDEDwJQJqtc0co0SE=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-E6UpRxnLNJOKxiASMtunUg-1; Sun, 20 Apr 2025 22:56:29 -0400
X-MC-Unique: E6UpRxnLNJOKxiASMtunUg-1
X-Mimecast-MFC-AGG-ID: E6UpRxnLNJOKxiASMtunUg_1745204189
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7395095a505so2509057b3a.1
        for <virtio-comment@lists.linux.dev>; Sun, 20 Apr 2025 19:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745204188; x=1745808988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjJJNnenVvfTrlE5OXy7vcjmESb/kZH5AbLEr4xBQ8k=;
        b=pJIuzBygb5Nu6sd/SMv2cVMEq0qs1ahayxe77nlQGOut6vJ1iQ/GOCpI9dSCQ1L51F
         d3PGAIF/Rjl47johty/EOQdD6WcDBRsNwFpUaSVF6gLkJBs/NTRoY9WEfU14dL06Nk8C
         lHBSwqfx6uxGk7fHpx67LYWIAXhJfoeeWan50Kxy7D5BRn2CFaf65gYZCnt8ojdbdrcj
         Vr0lCQYMSyP9GUSKH+bnWEoS52472vjZCMPjsW0OBhWGpA3CZ61WpkYht2cXLUwKQ+2u
         HTSOsdwey//y/i6OQbBXHNhSQAEuPx2pXkXMgZcSkyWL5/zJ46opix8om+be+4J0XGwP
         8V2g==
X-Gm-Message-State: AOJu0Yxj0dU0dLDy9Wya+F7EhoG4edB4ECBq4Zy++rqUtzXx7LCwKOE6
	vuiAbt0qUtd91VXSSYkVL3CqMg/P3cZqVtw90k4r99QNWLQcXkPuAGvLJSYfO8JTGqG53W1mp5O
	/l4zDYHgLG7RxXtwM+KjetGvd7c4/OA1ZSgs6/UpP/MGFw4vuCai38v2ttd0ddvKf4aR/Q4yAG+
	6H15fUs6yT4VhSf4NYDIYYZnNMEaQQkeJbTY+HI9M=
X-Gm-Gg: ASbGncu38Bkio1UXmFxO71MM+HOnJ5km0JG5ir1u7xOxQa53hMZveVn6qWliIVENqF+
	h4a3xmXcFsEdXCIZFQd3bU8+Xt0ORmql4ILEOd0E72oDVAM9ZmJ7iQQ/JADlnqPumLwl6UQ==
X-Received: by 2002:a05:6a00:2445:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-73dc144c123mr11590814b3a.4.1745204188491;
        Sun, 20 Apr 2025 19:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbi8FmUmqjdAiGj0ODfxibSJoh3RB1qNCcuhQ/432Ts8JSA9X315tZjzLdjvm+k3Pra9ngIFhvpRdZsxAiqh8=
X-Received: by 2002:a05:6a00:2445:b0:73c:b86:b47f with SMTP id
 d2e1a72fcca58-73dc144c123mr11590788b3a.4.1745204187921; Sun, 20 Apr 2025
 19:56:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250321-tx-v1-1-dd21fbdedf7a@daynix.com> <CACGkMEtGx7ajAmJUib++qJ2=rhZjyj5p=7iN2xBvba4gcBAQtg@mail.gmail.com>
 <afd70f86-a248-460c-b82f-c3bbbf62c0f1@daynix.com> <CACGkMEtqXtLeNTdcg0j57EX-4953htM9PWH+KQdRLBM=3jWgjg@mail.gmail.com>
 <6edb002d-406f-4f50-827a-14fe2228a650@daynix.com> <CACGkMEuuK4uUgfdcYaGnGhTvbwzcrVL4Po2UFanPPObSX7oskA@mail.gmail.com>
 <1024b26d-ad8e-4ad6-a7c7-232d32e5e872@daynix.com> <CACGkMEvAf=4kL6L1rSGBT5tAdnaE6m1tG_GuA6Jghb5E4WZb1A@mail.gmail.com>
 <51a96d2a-6911-4a6c-8108-4a523e836819@daynix.com>
In-Reply-To: <51a96d2a-6911-4a6c-8108-4a523e836819@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 21 Apr 2025 10:56:15 +0800
X-Gm-Features: ATxdqUGkFehsQ-7Auts5jHCJc6zDMs1FvLeWHs7bDySqbY3kV6prQikS3G3BiNI
Message-ID: <CACGkMEvPTzNwyxjF1C1ZnL6wJUyojpJ8XH3L-py9R208HzdcOQ@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: Update the max_tx_vq description
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: virtio-comment@lists.linux.dev, devel@daynix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3VDdzhYx9Esztr2uwjTRdeYa_NBA_3AqpNv1mCEpM-Q_1745204189
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2025 at 2:22=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> On 2025/04/16 16:38, Jason Wang wrote:
> > On Fri, Apr 11, 2025 at 3:41=E2=80=AFPM Akihiko Odaki <akihiko.odaki@da=
ynix.com> wrote:
> >>
> >> On 2025/04/08 15:33, Jason Wang wrote:
> >>> On Mon, Apr 7, 2025 at 11:43=E2=80=AFAM Akihiko Odaki <akihiko.odaki@=
daynix.com> wrote:
> >>>>
> >>>> On 2025/04/07 11:41, Jason Wang wrote:
> >>>>> On Sat, Mar 29, 2025 at 4:32=E2=80=AFPM Akihiko Odaki <akihiko.odak=
i@daynix.com> wrote:
> >>>>>>
> >>>>>> On 2025/03/24 13:02, Jason Wang wrote:
> >>>>>>> On Fri, Mar 21, 2025 at 3:01=E2=80=AFPM Akihiko Odaki <akihiko.od=
aki@daynix.com> wrote:
> >>>>>>>>
> >>>>>>>> The previous description said:
> >>>>>>>>> A driver sets \field{max_tx_vq} to inform a device how many tra=
nsmit
> >>>>>>>>> virtqueues it may use (transmitq1\ldots transmitq \field{max_tx=
_vq}).
> >>>>>>>>
> >>>>>>>> However, it also controls how many receive virtqueues a device M=
AY use.
> >>>>>>>> Copy the description of the virtqueue_pairs field of struct
> >>>>>>>> virtio_net_ctrl_mq_pairs_set, which also has the identical seman=
tics, to
> >>>>>>>> clarify that.
> >>>>>>>
> >>>>>>> Thanks for doing this, I wonder if it's time to rename as "max_tx=
_vq"
> >>>>>>> sounds like a TX only thing.
> >>>>>>
> >>>>>> I'm no longer pursuing this change. Please see the discussion at:
> >>>>>> https://lore.kernel.org/r/765a23aa-bb6b-4a01-89f1-31ad213b4715@day=
nix.com
> >>>>>>
> >>>>>> Please also review a change for QEMU based on the discussion:
> >>>>>> https://lore.kernel.org/qemu-devel/20250322-vq-v2-1-cee0aafe6404@d=
aynix.com
> >>>>>
> >>>>> Ok, so it seems that RSS implement a async RX/TX queue model instea=
d
> >>>>> of the MQ queue pairs:
> >>>>>
> >>>>> 1) rx available queue were controlled by indirection table
> >>>>> 2) tx available queue were controlled by max_tx_vq
> >>>>>
> >>>>> So it introduces more "issues" like:
> >>>>>
> >>>>> 1) This calls a new uAPI as I suggested in another thread instead o=
f
> >>>>> reusing TUN_SET_QUEUE
> >>>>
> >>>> QEMU applies the same approach for both VIRTIO_NET_CTRL_MQ_VQ_PAIRS_=
SET
> >>>> and VIRTIO_NET_CTRL_MQ_RSS_CONFIG, which is to parse the configurati=
on
> >>>> passed by the guest in QEMU and to pass the parsed configuration to =
TUN
> >>>> via TUNSETQUEUE. Please see the patch for QEMU I mentioned in the
> >>>> previous email for the actual implementation.
> >>>
> >>> If this is true, even if guests want to have an async tx/rx queue
> >>> number, the underlayer TAP will still choose a combined queue pair
> >>> model.
> >>>
> >>>>
> >>>>> 2) If both MQ and RSS are negotiated, what happens if the driver is
> >>>>> using both max_tx_vq and virtqueue_pairs. This seems unclear in the
> >>>>> spec itself.
> >>>>
> >>>> The spec says the last one sent by the driver will be used. In versi=
on
> >>>> 1.2, 5.1.6.5.5 "Device operation in multiqueue mode" says:
> >>>>    > The driver enables multiqueue by sending a command using class
> >>>>    > VIRTIO_NET_CTRL_MQ. The command selects the mode of multiqueue
> >>>>    > operation, as follows:
> >>>>    >  #define VIRTIO_NET_CTRL_MQ    4
> >>>>    >  #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0 (for automati=
c
> >>>>    >  receive steering)
> >>>>    >  #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1 (for configur=
able
> >>>>    >  receive steering)
> >>>>    >  #define VIRTIO_NET_CTRL_MQ_HASH_CONFIG         2 (for configur=
able
> >>>>    >  hash calculation)
> >>>>    >
> >>>>    > If more than one multiqueue mode is negotiated, the resulting d=
evice
> >>>>    > configuration is defined by the last command sent by the driver=
.
> >>>
> >>> I think it doesn't clarify all the cases. Consider we:
> >>>
> >>> 1) configure flow A to use rx queue 4
> >>> 2) set curr_queue_paris to 2
> >>>
> >>> How to choose the rx queue in flow A? This needs some clarification
> >>> e.g whether unclassified or automq or drop
> >>
> >> Such a configuration is not possible. If VIRTIO_NET_CTRL_MQ_RSS_CONFIG
> >> configures flow A to use rx queue 4, the resulting number of queue pai=
rs
> >> will be at least 5.
> >
> > Yes, this could be prevented by a well formed driver. But I mean from
> > the device side, such commands could be sent from the driver that is
> > something both spec and the implementation (e.g TAP) needs to
> > consider.
>
> If VIRTIO_NET_CTRL_MQ_RSS_CONFIG is the last command, it must define the
> number of queue pairs since the spec says the resulting device
> configuration is defined by the last command sent by the driver. So if
> VIRTIO_NET_CTRL_MQ_RSS_CONFIG configures flow A to use rx queue 4, the
> command also define that the number of queue pairs to be at least 5.
> Therefore, it is not possible for a driver to define the number of queue
> pairs contradicting with the flow configuration.

Yes, but I meant what happens if there's a
VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET afterwards that sets queue pairs to 2.
In this case, should the flow go with which queue?

Thanks

>
> Regards,
> Akihiko Odaki
>
> >
> > Thanks
> >
> >
> >>
> >> Regards,
> >> Akihiko Odaki
> >>
> >>>
> >>> Thanks
> >>>
> >>>>
> >>>> Regards,
> >>>> Akihiko Odaki
> >>>>
> >>>>>
> >>>>> THanks
> >>>>>
> >>>>>
> >>>>>>
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>>>>>>> ---
> >>>>>>>>      device-types/net/description.tex | 4 +++-
> >>>>>>>>      1 file changed, 3 insertions(+), 1 deletion(-)
> >>>>>>>>
> >>>>>>>> diff --git a/device-types/net/description.tex b/device-types/net=
/description.tex
> >>>>>>>> index 76585b0..5178191 100644
> >>>>>>>> --- a/device-types/net/description.tex
> >>>>>>>> +++ b/device-types/net/description.tex
> >>>>>>>> @@ -1578,7 +1578,9 @@ \subsubsection{Control Virtqueue}\label{se=
c:Device Types / Network Device / Devi
> >>>>>>>>
> >>>>>>>>      Field \field{indirection_table} is an array of receive virt=
queues ids.
> >>>>>>>>
> >>>>>>>> -A driver sets \field{max_tx_vq} to inform a device how many tra=
nsmit virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
> >>>>>>>> +Field \field{max_tx_vq} specifies the number of the transmit an=
d receive queues
> >>>>>>>> +to be used up to \field{max_virtqueue_pairs}; subsequently, tra=
nsmitq1\ldots
> >>>>>>>> +transmitqn and receiveq1\ldots receiveqn where n=3D\field{max_t=
x_vq} MAY be used.
> >>>>>>>>
> >>>>>>>>      Fields \field{hash_key_length} and \field{hash_key_data} de=
fine the key to be used in hash calculation.
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> ---
> >>>>>>>> base-commit: b495841a8e80d12c1130f8868f4128866291142d
> >>>>>>>> change-id: 20250321-tx-78e44c50a035
> >>>>>>>>
> >>>>>>>> Best regards,
> >>>>>>>> --
> >>>>>>>> Akihiko Odaki <akihiko.odaki@daynix.com>
> >>>>>>>>
> >>>>>>>
> >>>>>>
> >>>>>
> >>>>
> >>>
> >>
> >
>

