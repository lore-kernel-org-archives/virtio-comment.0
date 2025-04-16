Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770441A8F9E
	for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 07:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789145; cv=none; b=fDryT5gHcHmBZ9AGux7cQYaAKxuleu6ANWJLmyOLvqrtSIrRkWP33+FBBw5/QnVSQwJ4d79dbIL7U6A6jlpsbugiYuOi/9hr+ilkTLMY8/jYwR6vcVLe0JzNZlwkGuhxWdel8M5lL2AkDWBzA99ZViFa6u+IGUp532gmgFbHW6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789145; c=relaxed/simple;
	bh=ZMYL59uzyWvkwxRUyBg73E4EkYB9PGIWA8cxso011Q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qT4iAsDNAwz3WGUiFOWc2uM1Du6RHDgIi/Kz3XgqDBPudToSc4zMgSoPkwdOz/TXcRMW6ehfCmj7AW4GlAIfrYR23hkjTW6AW7ie/Tk4wExGau0Qiv1jd7VuA135/oYpJXmYqbP2rok+LpVASBV3kto6dU97J4Mm7b7b7vydINo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BxVqhS+y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BxVqhS+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744789142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MEGOskScDR7mjR7fbnJQ7l2qkYivKTv7+ZygnJfu1qU=;
	b=BxVqhS+yp87GhvqeI+tqy5waFHKxm7NF19cvTGr5nK5IS6Dc/9abZ2O1Uf06OVeWrRg/ZX
	vX8VPq/XaTW0gbwNudt5071wqD5Y2UbAuum/LhLSPbhuX+sb8FPaWUeuz9Fp6rYlxA+hfC
	D8OK3z1uCQlnGlB5LePKEc90t3KNepE=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-PhSbcTkhNIadiYNRoUqmjA-1; Wed, 16 Apr 2025 03:39:00 -0400
X-MC-Unique: PhSbcTkhNIadiYNRoUqmjA-1
X-Mimecast-MFC-AGG-ID: PhSbcTkhNIadiYNRoUqmjA_1744789139
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22650077995so89585505ad.3
        for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 00:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789139; x=1745393939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEGOskScDR7mjR7fbnJQ7l2qkYivKTv7+ZygnJfu1qU=;
        b=FeQzlYStSn8S0GNuimb+wwXiEzcFC14UJzJGQE2w/IAexCUo4qh8aBtEfO8b6GleHt
         OetzgMQ412aORVFAGkDfxW2ew4M0CvOmxIh3+X77ee23Fo9OwRGLcH0YhUKBW7eDhpb4
         aefaQ0z1z+CQ3q9pvYv7ju24akDbdCzN5FDXWZIuc7kMepNj2WS/mZxtTCgEAIfaXfqh
         8U5/osanUFmbxCFgRVVdVdclx53EOh4DUy/dJBEgeBZ1a9SEmu6pHRLJPjjNZsyXojvc
         ZALXZsFwwcbQjixHyDmzBnqn/iZ9CLoT3HbvjB1VHFD6zk2jtr1xtvZFsAGlAkL5FKrC
         emQQ==
X-Gm-Message-State: AOJu0YwrXTZ18iIIJh/3BfZX84NuF8nb4OUoLUFipRFsIzDUe04hu54h
	xj6gnbYSxWVuUXP1TRmsGpe+wvY1HWJS8h/4tBSxr7bvgerp+OQZENPYngS12H1MhXyUJU2N7Md
	VCUJAZPGNLOecz3ieTGE3JZ5EY+MhSmCOU3U7YngRzQdKF3BVWU5NYthkYRZbTlaj/u1Bvf9hUp
	ip7qtOi/GPusTAOeLSxU0fWKftmqv0COwZ0KU75DQ=
X-Gm-Gg: ASbGncuZr0zuSy03U8mimwEHPKXd+NLRDhGL7JpokgZXNe5fVQwy15NzD4Ybv/fD8K/
	fwWgB2picyJ/IXkPuMRK4QjI1zNWkKYE/Pey/CwunDpYA3cUWSULx5JTOCeESKsmZ/HHs
X-Received: by 2002:a17:902:d2c7:b0:220:ff3f:6cba with SMTP id d9443c01a7336-22c3596b9dcmr16780065ad.38.1744789139527;
        Wed, 16 Apr 2025 00:38:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz+bnmE2B208jdo7obP+LEdKINTMxQYnKnuK8Lm41/4igXF6C7sB0+8QRtz16uNwGmOjP6Xo+DmwPxyGIAHLU=
X-Received: by 2002:a17:902:d2c7:b0:220:ff3f:6cba with SMTP id
 d9443c01a7336-22c3596b9dcmr16779745ad.38.1744789139161; Wed, 16 Apr 2025
 00:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250321-tx-v1-1-dd21fbdedf7a@daynix.com> <CACGkMEtGx7ajAmJUib++qJ2=rhZjyj5p=7iN2xBvba4gcBAQtg@mail.gmail.com>
 <afd70f86-a248-460c-b82f-c3bbbf62c0f1@daynix.com> <CACGkMEtqXtLeNTdcg0j57EX-4953htM9PWH+KQdRLBM=3jWgjg@mail.gmail.com>
 <6edb002d-406f-4f50-827a-14fe2228a650@daynix.com> <CACGkMEuuK4uUgfdcYaGnGhTvbwzcrVL4Po2UFanPPObSX7oskA@mail.gmail.com>
 <1024b26d-ad8e-4ad6-a7c7-232d32e5e872@daynix.com>
In-Reply-To: <1024b26d-ad8e-4ad6-a7c7-232d32e5e872@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 16 Apr 2025 15:38:48 +0800
X-Gm-Features: ATxdqUGngZg-vmMryaAsnGMDIpSFDRMQR1QRy5rSGCfoa97dPklATV4GFcWPCPU
Message-ID: <CACGkMEvAf=4kL6L1rSGBT5tAdnaE6m1tG_GuA6Jghb5E4WZb1A@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: Update the max_tx_vq description
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: virtio-comment@lists.linux.dev, devel@daynix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 561pNe2UGSYEvR8Na6RXps8xAUxW7OTsDhD1bomEVlg_1744789139
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 3:41=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> On 2025/04/08 15:33, Jason Wang wrote:
> > On Mon, Apr 7, 2025 at 11:43=E2=80=AFAM Akihiko Odaki <akihiko.odaki@da=
ynix.com> wrote:
> >>
> >> On 2025/04/07 11:41, Jason Wang wrote:
> >>> On Sat, Mar 29, 2025 at 4:32=E2=80=AFPM Akihiko Odaki <akihiko.odaki@=
daynix.com> wrote:
> >>>>
> >>>> On 2025/03/24 13:02, Jason Wang wrote:
> >>>>> On Fri, Mar 21, 2025 at 3:01=E2=80=AFPM Akihiko Odaki <akihiko.odak=
i@daynix.com> wrote:
> >>>>>>
> >>>>>> The previous description said:
> >>>>>>> A driver sets \field{max_tx_vq} to inform a device how many trans=
mit
> >>>>>>> virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_v=
q}).
> >>>>>>
> >>>>>> However, it also controls how many receive virtqueues a device MAY=
 use.
> >>>>>> Copy the description of the virtqueue_pairs field of struct
> >>>>>> virtio_net_ctrl_mq_pairs_set, which also has the identical semanti=
cs, to
> >>>>>> clarify that.
> >>>>>
> >>>>> Thanks for doing this, I wonder if it's time to rename as "max_tx_v=
q"
> >>>>> sounds like a TX only thing.
> >>>>
> >>>> I'm no longer pursuing this change. Please see the discussion at:
> >>>> https://lore.kernel.org/r/765a23aa-bb6b-4a01-89f1-31ad213b4715@dayni=
x.com
> >>>>
> >>>> Please also review a change for QEMU based on the discussion:
> >>>> https://lore.kernel.org/qemu-devel/20250322-vq-v2-1-cee0aafe6404@day=
nix.com
> >>>
> >>> Ok, so it seems that RSS implement a async RX/TX queue model instead
> >>> of the MQ queue pairs:
> >>>
> >>> 1) rx available queue were controlled by indirection table
> >>> 2) tx available queue were controlled by max_tx_vq
> >>>
> >>> So it introduces more "issues" like:
> >>>
> >>> 1) This calls a new uAPI as I suggested in another thread instead of
> >>> reusing TUN_SET_QUEUE
> >>
> >> QEMU applies the same approach for both VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SE=
T
> >> and VIRTIO_NET_CTRL_MQ_RSS_CONFIG, which is to parse the configuration
> >> passed by the guest in QEMU and to pass the parsed configuration to TU=
N
> >> via TUNSETQUEUE. Please see the patch for QEMU I mentioned in the
> >> previous email for the actual implementation.
> >
> > If this is true, even if guests want to have an async tx/rx queue
> > number, the underlayer TAP will still choose a combined queue pair
> > model.
> >
> >>
> >>> 2) If both MQ and RSS are negotiated, what happens if the driver is
> >>> using both max_tx_vq and virtqueue_pairs. This seems unclear in the
> >>> spec itself.
> >>
> >> The spec says the last one sent by the driver will be used. In version
> >> 1.2, 5.1.6.5.5 "Device operation in multiqueue mode" says:
> >>   > The driver enables multiqueue by sending a command using class
> >>   > VIRTIO_NET_CTRL_MQ. The command selects the mode of multiqueue
> >>   > operation, as follows:
> >>   >  #define VIRTIO_NET_CTRL_MQ    4
> >>   >  #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0 (for automatic
> >>   >  receive steering)
> >>   >  #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1 (for configurabl=
e
> >>   >  receive steering)
> >>   >  #define VIRTIO_NET_CTRL_MQ_HASH_CONFIG         2 (for configurabl=
e
> >>   >  hash calculation)
> >>   >
> >>   > If more than one multiqueue mode is negotiated, the resulting devi=
ce
> >>   > configuration is defined by the last command sent by the driver.
> >
> > I think it doesn't clarify all the cases. Consider we:
> >
> > 1) configure flow A to use rx queue 4
> > 2) set curr_queue_paris to 2
> >
> > How to choose the rx queue in flow A? This needs some clarification
> > e.g whether unclassified or automq or drop
>
> Such a configuration is not possible. If VIRTIO_NET_CTRL_MQ_RSS_CONFIG
> configures flow A to use rx queue 4, the resulting number of queue pairs
> will be at least 5.

Yes, this could be prevented by a well formed driver. But I mean from
the device side, such commands could be sent from the driver that is
something both spec and the implementation (e.g TAP) needs to
consider.

Thanks


>
> Regards,
> Akihiko Odaki
>
> >
> > Thanks
> >
> >>
> >> Regards,
> >> Akihiko Odaki
> >>
> >>>
> >>> THanks
> >>>
> >>>
> >>>>
> >>>>>
> >>>>>>
> >>>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>>>>> ---
> >>>>>>     device-types/net/description.tex | 4 +++-
> >>>>>>     1 file changed, 3 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/device-types/net/description.tex b/device-types/net/d=
escription.tex
> >>>>>> index 76585b0..5178191 100644
> >>>>>> --- a/device-types/net/description.tex
> >>>>>> +++ b/device-types/net/description.tex
> >>>>>> @@ -1578,7 +1578,9 @@ \subsubsection{Control Virtqueue}\label{sec:=
Device Types / Network Device / Devi
> >>>>>>
> >>>>>>     Field \field{indirection_table} is an array of receive virtque=
ues ids.
> >>>>>>
> >>>>>> -A driver sets \field{max_tx_vq} to inform a device how many trans=
mit virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
> >>>>>> +Field \field{max_tx_vq} specifies the number of the transmit and =
receive queues
> >>>>>> +to be used up to \field{max_virtqueue_pairs}; subsequently, trans=
mitq1\ldots
> >>>>>> +transmitqn and receiveq1\ldots receiveqn where n=3D\field{max_tx_=
vq} MAY be used.
> >>>>>>
> >>>>>>     Fields \field{hash_key_length} and \field{hash_key_data} defin=
e the key to be used in hash calculation.
> >>>>>>
> >>>>>>
> >>>>>> ---
> >>>>>> base-commit: b495841a8e80d12c1130f8868f4128866291142d
> >>>>>> change-id: 20250321-tx-78e44c50a035
> >>>>>>
> >>>>>> Best regards,
> >>>>>> --
> >>>>>> Akihiko Odaki <akihiko.odaki@daynix.com>
> >>>>>>
> >>>>>
> >>>>
> >>>
> >>
> >
>

