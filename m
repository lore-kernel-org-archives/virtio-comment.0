Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C09D161321
	for <virtio-comment@lists.linux.dev>; Tue,  8 Apr 2025 06:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744094011; cv=none; b=Qcm6mThtP9CtB9dKy5HjkjVFKlgEJL5oelbMmKKR2vHZf0OBoZSraaLolBFuWA+10vOsP7lH9q80EvEfOmYekON12xIFeMBzJ0amVGfMziTCkdPBslvPEB+ADaU0lvaltTAh0x0bN/aVLZWf+Axp8hXwqlcGG3hiXkJcL/CUwtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744094011; c=relaxed/simple;
	bh=szlBC6oUBhSr/UVCzbhsTBxLTcfQAeiyQXiGi6nFnqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GCNfsvP4dKM3qFXF++vQdm0SinhgzqU9vSAGWih0RnSkeMVtOe5Me+fRhGIXXPKzs5vT4OnGwWBInSWDOMVgUY1vLpMT3DaOq7eM9nTr2jTKaCbbyXLh+AveMBOKH0FzZhaPvm8VHjY5QsI5phUtJYmyRFz7k2iHC5cUwS98At0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hXVRXTR7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hXVRXTR7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744094008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kXzKehP7pD2FUxFjQMlWthkC7uwrdmU1t256Yjcgmhs=;
	b=hXVRXTR70TschbXhSbaX9sSFxsURgd9c3ss9xnApb5KGLzfKACLQANdBwFmEuOGypgva1M
	An3Kd9z4if2aAVXWpTVdwzNp7DafGmIvCLUJPqH3p4iMVODO+B1FTVzGYNsqdEOTYvNqKK
	eSwsq96EDA470zYvQH1MCaEAJtLRYJg=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-hUxY6iagOHeyT5aGi0bdXQ-1; Tue, 08 Apr 2025 02:33:27 -0400
X-MC-Unique: hUxY6iagOHeyT5aGi0bdXQ-1
X-Mimecast-MFC-AGG-ID: hUxY6iagOHeyT5aGi0bdXQ_1744094006
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-86d04803f24so1619602241.0
        for <virtio-comment@lists.linux.dev>; Mon, 07 Apr 2025 23:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744094005; x=1744698805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXzKehP7pD2FUxFjQMlWthkC7uwrdmU1t256Yjcgmhs=;
        b=dVN/oPt5bt8WK5HFOsZSJIwPt6w6M+lkIcmMg1+wLG+mzi1+g7yJBceJFzm/SNBPGv
         EDwV2zmw/fbzH8xJ4Hs8nNemHTX4BXnioDrPHuLlEUwT/odIlh4cBFlBebqWke4rhCUt
         7G+s+bXd/gMuq/4fCcpASA9CokZ3rsPJXU4V8WnhlN9zBQhcpCkgjO8AcVPyW7uSuCnR
         C2M7lwWM7RwOlen9h6s4MK48Aes2yTPLJPazYbRi9NVCsNExprTXp/rKACvXaf5iy5w4
         SX9A//fXTevCN+Xtdd0N/kkwfKqpivtA6v2AWfn6pEbN/5zzFuIZPYmrGe8Z7Jcxb5lW
         JjXg==
X-Gm-Message-State: AOJu0Yzau2G9tnGwqTRwisYwLJ4EB/h6HAAIB3HNtDAqMH3hzg4BbUQV
	lYQRaZc1iLbd9qaYTNRddMcRfw0v0f/CMX+EE2xmcmQLLIsZ+09P3yfbJ+aKwbVzN/1vmYWn++V
	8UGq0bn8pVvwl5MokFDUCVgwERN/mMbkhpsfOVzdBpsmDbtCTzzLSQuvCgkard05M8vYgVMgUEp
	BwO0t4do9lWmeW9j/Dvv3voXErZNsglyTa6Qm07jkM7zxb3nF/hQ==
X-Gm-Gg: ASbGnctAnBjkb8XC7S2T0pyeJaKnDF15SbVMvUgbDvQxH7QcYgkRlagkgnkgLTmehSY
	NW92FjXRALo8Es1AdxRqZTQx8g2NLfozHkaPANcKYaCPnxrg0uuuH4/yH7w5f0I3Q+wtghfvb
X-Received: by 2002:a05:6102:330b:b0:4c1:85d9:5641 with SMTP id ada2fe7eead31-4c8553cdf61mr12840737137.11.1744094005302;
        Mon, 07 Apr 2025 23:33:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGaB9034m1PZjZH1yD/9B1DC5b34ICi+rRRvnaDyCaYRAz0xeWhr13jZERAQ0zJhHR4dLouR5QFowIsmDXPpA=
X-Received: by 2002:a05:6102:330b:b0:4c1:85d9:5641 with SMTP id
 ada2fe7eead31-4c8553cdf61mr12840735137.11.1744094004956; Mon, 07 Apr 2025
 23:33:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250321-tx-v1-1-dd21fbdedf7a@daynix.com> <CACGkMEtGx7ajAmJUib++qJ2=rhZjyj5p=7iN2xBvba4gcBAQtg@mail.gmail.com>
 <afd70f86-a248-460c-b82f-c3bbbf62c0f1@daynix.com> <CACGkMEtqXtLeNTdcg0j57EX-4953htM9PWH+KQdRLBM=3jWgjg@mail.gmail.com>
 <6edb002d-406f-4f50-827a-14fe2228a650@daynix.com>
In-Reply-To: <6edb002d-406f-4f50-827a-14fe2228a650@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 8 Apr 2025 14:33:11 +0800
X-Gm-Features: ATxdqUH1r5aPWZ4zkf3FqRQp2MGncgulMAhn9-LPlaCJ04z97j0hHTIQOSdQrlU
Message-ID: <CACGkMEuuK4uUgfdcYaGnGhTvbwzcrVL4Po2UFanPPObSX7oskA@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: Update the max_tx_vq description
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: virtio-comment@lists.linux.dev, devel@daynix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j1JYK3ORNfCmpxjEm_3G44mXdq8PYqYYDv-NRXmb-ig_1744094006
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 11:43=E2=80=AFAM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> On 2025/04/07 11:41, Jason Wang wrote:
> > On Sat, Mar 29, 2025 at 4:32=E2=80=AFPM Akihiko Odaki <akihiko.odaki@da=
ynix.com> wrote:
> >>
> >> On 2025/03/24 13:02, Jason Wang wrote:
> >>> On Fri, Mar 21, 2025 at 3:01=E2=80=AFPM Akihiko Odaki <akihiko.odaki@=
daynix.com> wrote:
> >>>>
> >>>> The previous description said:
> >>>>> A driver sets \field{max_tx_vq} to inform a device how many transmi=
t
> >>>>> virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}=
).
> >>>>
> >>>> However, it also controls how many receive virtqueues a device MAY u=
se.
> >>>> Copy the description of the virtqueue_pairs field of struct
> >>>> virtio_net_ctrl_mq_pairs_set, which also has the identical semantics=
, to
> >>>> clarify that.
> >>>
> >>> Thanks for doing this, I wonder if it's time to rename as "max_tx_vq"
> >>> sounds like a TX only thing.
> >>
> >> I'm no longer pursuing this change. Please see the discussion at:
> >> https://lore.kernel.org/r/765a23aa-bb6b-4a01-89f1-31ad213b4715@daynix.=
com
> >>
> >> Please also review a change for QEMU based on the discussion:
> >> https://lore.kernel.org/qemu-devel/20250322-vq-v2-1-cee0aafe6404@dayni=
x.com
> >
> > Ok, so it seems that RSS implement a async RX/TX queue model instead
> > of the MQ queue pairs:
> >
> > 1) rx available queue were controlled by indirection table
> > 2) tx available queue were controlled by max_tx_vq
> >
> > So it introduces more "issues" like:
> >
> > 1) This calls a new uAPI as I suggested in another thread instead of
> > reusing TUN_SET_QUEUE
>
> QEMU applies the same approach for both VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET
> and VIRTIO_NET_CTRL_MQ_RSS_CONFIG, which is to parse the configuration
> passed by the guest in QEMU and to pass the parsed configuration to TUN
> via TUNSETQUEUE. Please see the patch for QEMU I mentioned in the
> previous email for the actual implementation.

If this is true, even if guests want to have an async tx/rx queue
number, the underlayer TAP will still choose a combined queue pair
model.

>
> > 2) If both MQ and RSS are negotiated, what happens if the driver is
> > using both max_tx_vq and virtqueue_pairs. This seems unclear in the
> > spec itself.
>
> The spec says the last one sent by the driver will be used. In version
> 1.2, 5.1.6.5.5 "Device operation in multiqueue mode" says:
>  > The driver enables multiqueue by sending a command using class
>  > VIRTIO_NET_CTRL_MQ. The command selects the mode of multiqueue
>  > operation, as follows:
>  >  #define VIRTIO_NET_CTRL_MQ    4
>  >  #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0 (for automatic
>  >  receive steering)
>  >  #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1 (for configurable
>  >  receive steering)
>  >  #define VIRTIO_NET_CTRL_MQ_HASH_CONFIG         2 (for configurable
>  >  hash calculation)
>  >
>  > If more than one multiqueue mode is negotiated, the resulting device
>  > configuration is defined by the last command sent by the driver.

I think it doesn't clarify all the cases. Consider we:

1) configure flow A to use rx queue 4
2) set curr_queue_paris to 2

How to choose the rx queue in flow A? This needs some clarification
e.g whether unclassified or automq or drop

Thanks

>
> Regards,
> Akihiko Odaki
>
> >
> > THanks
> >
> >
> >>
> >>>
> >>>>
> >>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>>> ---
> >>>>    device-types/net/description.tex | 4 +++-
> >>>>    1 file changed, 3 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/device-types/net/description.tex b/device-types/net/des=
cription.tex
> >>>> index 76585b0..5178191 100644
> >>>> --- a/device-types/net/description.tex
> >>>> +++ b/device-types/net/description.tex
> >>>> @@ -1578,7 +1578,9 @@ \subsubsection{Control Virtqueue}\label{sec:De=
vice Types / Network Device / Devi
> >>>>
> >>>>    Field \field{indirection_table} is an array of receive virtqueues=
 ids.
> >>>>
> >>>> -A driver sets \field{max_tx_vq} to inform a device how many transmi=
t virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
> >>>> +Field \field{max_tx_vq} specifies the number of the transmit and re=
ceive queues
> >>>> +to be used up to \field{max_virtqueue_pairs}; subsequently, transmi=
tq1\ldots
> >>>> +transmitqn and receiveq1\ldots receiveqn where n=3D\field{max_tx_vq=
} MAY be used.
> >>>>
> >>>>    Fields \field{hash_key_length} and \field{hash_key_data} define t=
he key to be used in hash calculation.
> >>>>
> >>>>
> >>>> ---
> >>>> base-commit: b495841a8e80d12c1130f8868f4128866291142d
> >>>> change-id: 20250321-tx-78e44c50a035
> >>>>
> >>>> Best regards,
> >>>> --
> >>>> Akihiko Odaki <akihiko.odaki@daynix.com>
> >>>>
> >>>
> >>
> >
>

