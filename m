Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD74E13D8BA
	for <virtio-comment@lists.linux.dev>; Tue,  2 Jul 2024 07:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719906052; cv=none; b=KEVriW230GzLr8bA1uXGRWJnWQtjlA0O26JsPtIMRoX0B9eYCM/FWy3pFEmeiNcGkfcAeXbMbcvaCBEcDV1azxDf4UMmErBWjJGK14GbjyHhbhVb1OA34KpOI0bnr5WgcsXyZK1erlaWeMKdsW8yX0gowworkahEY9EF2+8+4hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719906052; c=relaxed/simple;
	bh=8KymttaLMRyJcg5CLkVF78ISQIsNQvVpdEQBph28s+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7AFhH50y1+OzpROvvKwyJp0GgF+35uElYmpzNrFRD4CfekBFnqVwuuR5qwkhff6dzuK0h99j84MMXK0eKzUqpzNjstAv48U9SyIUtwPhnaTh6FytouTMUbBqZTdBVQX/51CRvbv0pCNmWIlnXG1Ujj23jyNFZi7T4mhBzpzGo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UHsBlEgQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UHsBlEgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719906049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XqqST0r2oxvnQs1L2Y7PoijfrH2HjrScRmcu3ejOTeM=;
	b=UHsBlEgQgXkAUImMAoF282Ik+SqWycYBvvY0tgvIyfP6an9pDxsfR6lEE48kcefok8Xcfs
	trreBBL8Ueb+L8oCpooNmbhiRToPk/l2JSIbA4ypwUX6HsG24sRj8tHNPHTEXztKhqe364
	O5ry/C8DODS8X/bN4VwZZ5gKqCWq/js=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-Y3nUqcwJPLiS8JrmeqVOSg-1; Tue, 02 Jul 2024 03:40:47 -0400
X-MC-Unique: Y3nUqcwJPLiS8JrmeqVOSg-1
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-5c21a8eeb97so4595688eaf.2
        for <virtio-comment@lists.linux.dev>; Tue, 02 Jul 2024 00:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719906046; x=1720510846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XqqST0r2oxvnQs1L2Y7PoijfrH2HjrScRmcu3ejOTeM=;
        b=sIXHOTeW6ffiSEA+RtmXHvdeSSbnHWcnRcSx76by05ioFJ1MZeZ+2qw8LtSqfC5q0s
         ACe8q5+umSvbCZvRVVgDFf9+1ElUx/NWoL8+JKFgjw8PhttWEmKDxOYUEuRt5f76KKF9
         vrFAu+XB1WCg+xCLODNMBuSCkgpH5yfPubA4H5dnzsXIBAjvGAT6RowWKo7+9c2/iXzE
         tRsK2puxIBWGosYQblhJiN+H80x13U1x4x/wM5kMDfgIfLUGCfnniPkuR2WflYlwkof3
         knVuXV4FPXpGj07b5ZVaDr7xgB9fivmaHOsUhNJHUvtCsHRnN9ahCprTV9atdk1Ee6dZ
         7n8w==
X-Gm-Message-State: AOJu0Yz7QpVEYJ5PddTmnuF1/J7woHLgeNljRpvYRSlpg8JPAuKQGUMG
	lsUfaTHdUhybfOb9oqkPK7wGSyQk9aWXuvP2ul8NgazvA32AmGMYYo0bdi37Eqtar2Cd97Fjtmf
	LIWX6AESw6bkwU6LNsS3jWQGGg9g3s+PKlzvlo0RfncDDL5mdwHkOsaCqq+D0MSIQBPqfxDSnN6
	Goj4UQH2RWOYilJkHaxA1JIyZ+pnlhH9NWThPzMQ4=
X-Received: by 2002:a05:6870:a511:b0:254:6e4e:23d7 with SMTP id 586e51a60fabf-25db362e2a7mr7787002fac.50.1719906046264;
        Tue, 02 Jul 2024 00:40:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF38hlFfKpQ/48uGcTAQzq+J7WPXFsEOHpcoLs41EazpObzNaKTK93OZEPz2jjD1cekRyrLbMo+4nrhxkPKOhw=
X-Received: by 2002:a05:6870:a511:b0:254:6e4e:23d7 with SMTP id
 586e51a60fabf-25db362e2a7mr7786990fac.50.1719906045886; Tue, 02 Jul 2024
 00:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
In-Reply-To: <20240701034435.675-1-lege.wang@jaguarmicro.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 2 Jul 2024 15:40:34 +0800
Message-ID: <CACGkMEvrHNnjdgC6Ls=YWRPFxpirCFkbf8_VnNsh-VU4NoK3tw@mail.gmail.com>
Subject: Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
To: Xiaoguang Wang <lege.wang@jaguarmicro.com>
Cc: virtio-comment@lists.linux.dev, vattunuru@marvell.com, 
	ndabilpuram@marvell.com, parav@nvidia.com, mst@redhat.com, 
	leo.liu@jaguarmicro.com, angus.chen@jaguarmicro.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 11:51=E2=80=AFAM Xiaoguang Wang
<lege.wang@jaguarmicro.com> wrote:
>
> Currently for the PCI transport, used buffer notification suppression
> informations are located in guest memory, for example, pvirtq_event_suppr=
ess
> for packed ring and virtq_avail for split ring, then PCI devices simulate=
d
> by hypervisors, such as QEMU, can vist these suppression informations
> directly before issuing used event, the only overheads may be just proper
> memory barriers, but for some hardware PCI devices offered by
> DPU(Data Processing Unit), DPU would need to submit DMAs to copy guest
> suppression informations to DPU internal memory, then check whether
> used event should be notified by examing this internal memory, which
> is obvious expensive, and this DMA operation is needed every time
> DPU attempts to issue used event,

Several things could be used to help here:

1) With the event index, as long as the used index doesn't pass used
events you don't need to fetch even index every time
2) Interrupt coalescing may help to throttle the interrupt rate
3) Spec doesn't forbid implementation specific heuristics for
interrupt moderation

> DPU may also choose to add a hardware
> component to polling suppression informations by submit DMAs continuously
> to get newest used event suppression infos, but it's also expensive.
>
> To help improve this sitiuations, add a new feature:
> VIRTIO_F_USED_EVENT_AUTO_DISABLE. When this feature bit is negotiated,
> devices will place new notification area for used buffer suppression
> notification in PCI bar specfied by virtio_pci_notify_cap, also for bette=
r
> used buffer notification coalescing, the device will disable later used
> buffer notifications automatically after sending one used buffer notifica=
tion
> to driver, and after the driver finishes handling current used buffer eve=
nt,
> it needs to notify the device to enable used buffer notification again by
> writing above new notification area in PCI bar. Device will receive
> this notification reliably, and device knows that it can issue used event
> now, but it may choose appropriate timing to send used events according t=
o
> its notification coalescing policy , now it also does not need to DMA gue=
st
> memory to obtain notification suppression.

Performance numbers are welcomed:

1) compare disabling via register against memory
2) compare auto disable against no auto

>
> Signed-off-by: Xiaoguang Wang <lege.wang@jaguarmicro.com>
> ---
>  content.tex       | 38 ++++++++++++++++++++++++++++++++++++++
>  transport-pci.tex | 26 +++++++++++++++++++++++++-
>  2 files changed, 63 insertions(+), 1 deletion(-)
>
> diff --git a/content.tex b/content.tex
> index 0a62dce..84505da 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -448,6 +448,7 @@ \section{Driver Notifications} \label{sec:Basic Facil=
ities of a Virtio Device /
>  The driver is sometimes required to send an available buffer
>  notification to the device.
>
> +\subsection{Available Buffer Notifications} \label{sec:Basic Facilities =
of a Virtio Device / Driver notifications / Available Buffer Notifications}
>  When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
>  this notification contains either a virtqueue index if
>  VIRTIO_F_NOTIF_CONFIG_DATA is not negotiated or device supplied virtqueu=
e
> @@ -488,6 +489,35 @@ \section{Driver Notifications} \label{sec:Basic Faci=
lities of a Virtio Device /
>  has been negotiated, these notifications would then have
>  identical \field{next_off} and \field{next_wrap} values.
>
> +\subsection{Used Buffer Event Enable Notifications} \label{sec:Basic Fac=
ilities of a Virtio Device / Driver notifications / Used Buffer Event Enabl=
e Notifications}
> +This kind of notification is only necessary when VIRTIO_F_USED_EVENT_AUT=
O_DISABLE has been negotiated.
> +When this feature bit is negotiated, the device will disable used buffer=
 notification
> +automatically after sending one used buffer notification to the driver, =
and after the driver
> +finishes handling current used buffer event, it needs to notify the devi=
ce to enable used
> +buffer notification again.
> +
> +\begin{description}
> +\item [vq_index or vq_notif_config_data] Either virtqueue index or devic=
e
> +      supplied queue notification config data corresponding to a virtque=
ue.
> +\item [used_off] Offset
> +      within the ring where the latest used ring entry the driver has pr=
ocessed.
> +      Without VIRTIO_F_RING_PACKED this refers to the 14 least significa=
nt bits of the
> +      offset (in units of descriptor entries) within the descriptor ring=
 where the latest used
> +      ring entry the driver has processed. With VIRTIO_F_RING_PACKED thi=
s refers to the offset
> +      (in units of descriptor entries) within the descriptor ring where =
the latest used ring
> +      entry the driver has processed.
> +\item [used_wrap] Wrap Counter.
> +      With VIRTIO_F_RING_PACKED this is the wrap counter
> +      referring to the latest used descriptor where the driver has proce=
ssed.
> +      Without VIRTIO_F_RING_PACKED this refers to the most significant b=
it(bit 14) of the
> +      offset (in units of descriptor entries) within the descriptor ring=
 where the latest used ring
> +      entry the driver has processed..
> +\item [enable_notify] Whether to enable used buffer notification.
> +      The driver may benefit from just informing device the latest used =
ring entry
> +      it has processed, but not enabling used buffer notification. This =
field only
> +      occupies one bit, if set to 1, it will enable used buffer notifica=
tion, otherwise not.
> +\end{description}

Any reason we can't reuse the existing meachsim like used index /
event suppression here?

Basically it just sounds like we need a transport specific method for
them besides being part of the virtqueue.

Thanks

