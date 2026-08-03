Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414BD357CFB
	for <virtio-comment@lists.linux.dev>; Mon,  3 Aug 2026 09:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785749866; cv=none; b=kSU1v1LpauVhAvR3oC0xefi+82UwQs6ZXzKPTAHMbFYzKui9KRXMctecxfyzIdlphw349J2gZTXUodXghPrSEbsRzLnyKR3TWWkCiREZvJzqzvQQWuZNN45J2dbxXD+Kat2GHxsdSOxOQ/yfOvdiHcf0LAoL4n41H6Fxqfa28bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785749866; c=relaxed/simple;
	bh=BwVtmX/7/t4GWzaY77ArhFQZrbZ49dQpQfnFV9UWL28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDkU4p2n4fR6GA/OpC6qRadCMCoGa3pATmT/p6MRk0eNzluVdVc723VhZHiT6dS7sFzXR1sr0BwUGyXER5+mo4wXlMz0iPKOLoUtfFtaAwnUIzol4T98JlfpUVhfzDPJy2lYjrCE7lHVgo/ItQWrYJKceUXzw3aJC6eDVsz8hbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MpY12wTL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MpY12wTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785749860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlF/horReMgsPc6XkHjkkkQXsFKiHsIu0lkISqWp6QM=;
	b=MpY12wTLPbCuPsSIte5cevyLHtthUA81CuVT88/22jTviz2AdgyUHieFN4MrfTp6bEiaxR
	TUHbwiFmE0Y82dqDV0WMoJT33JnasCmDWS2t0Aqxy81LZiOiz6WrXjGnheTtwedlQJfs0L
	BwnmSPn910QRn79jkbwC8Jmo9QYlp3U=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-pd7YZmvNMFOLyaQmpyruAQ-1; Mon, 03 Aug 2026 05:37:39 -0400
X-MC-Unique: pd7YZmvNMFOLyaQmpyruAQ-1
X-Mimecast-MFC-AGG-ID: pd7YZmvNMFOLyaQmpyruAQ_1785749859
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e71268bf6so113342917b3.0
        for <virtio-comment@lists.linux.dev>; Mon, 03 Aug 2026 02:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785749859; x=1786354659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlF/horReMgsPc6XkHjkkkQXsFKiHsIu0lkISqWp6QM=;
        b=KaJt/2/X9zM86rBTLmSvQpr5GES7E8UQRc/O5zXDxej6lwAOStm2Un6i78X/NYi7bZ
         agSTwcStddnSy00x3RlyQ5Gftuh9+jRV2xP2YssZ+mqY4B0RWICdi71pr0ISrKbeVBPq
         d4+A9ElS2YNjwM8vK6dcsszulwTEi13aFTXqM/1yzlVSc5hsUd+nEViOOtDqBp/mgqBl
         43n2WzAQbvoUoU1iIbkq+3bkm0IOHDH+ZwUFsr2PsYXsnOPrxARAsabHlRZE8itGb00T
         3/59lLFm12mYGzq1QbftusWaNwHgR7plJOZ5Nrrbll4/qeH0pE/lWBxkKA+VSoMNWr2e
         YqLQ==
X-Gm-Message-State: AOJu0Yx89dTPxKfzILaccz4N07HoPq7na/g6Bsua2zq1ePmiZ/0iw8cP
	/x/FRlvervEoxXR/UZPihQvtFDDvwsF/X64F4+m6luIW5EccW88G1dsQHpqMFRTVQE1gCbTj2rU
	VNtHfoTXEBbgPaNgx7o9ye00cf1N/nrqbjW1gIo8GMcEEBAZw9zNu3Bi7bYkPNFZXlRleQhKIg1
	YPTTWh+hyuwvp9KW4rcmWkHAL7ToOXvwG8BITtoiHjIQw=
X-Gm-Gg: AR+sD123vut695QyAz0kMUUMaGbNfjQ3uXvFeh2AuirrESd2iS/NEPrIi4biH+Y9Fa8
	wZE6H0ogOW13d+oOPGH/XDF6dDDDk0ElYn9sjAUgq6jcKsp12S8cxkTtzVshLWKnqnVj15GbxFS
	H0mojB+InErBCrToO8lUI6D0HpWzbkS6UDdrBxemMmWU3ZZNysUnrOj6k=
X-Received: by 2002:a05:690c:6701:b0:7ff:1a93:be35 with SMTP id 00721157ae682-81fd4a6f84emr117484757b3.16.1785749858503;
        Mon, 03 Aug 2026 02:37:38 -0700 (PDT)
X-Received: by 2002:a05:690c:6701:b0:7ff:1a93:be35 with SMTP id
 00721157ae682-81fd4a6f84emr117484617b3.16.1785749858059; Mon, 03 Aug 2026
 02:37:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706061539.2339496-1-zeloren@qti.qualcomm.com> <20260717154845.3553474-1-zeloren@qti.qualcomm.com>
In-Reply-To: <20260717154845.3553474-1-zeloren@qti.qualcomm.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 3 Aug 2026 11:37:26 +0200
X-Gm-Features: AUfX_myGE51gA1KzhxMEt2qUZm-mHn38BydVWxSQcUVJi9IZ_3x1mCYAxcovJ4Y
Message-ID: <CADSE00KHLXywjkJJ5fzJPcgTeAz9k3_pq9+7+WV43a+yosDXmw@mail.gmail.com>
Subject: Re: [PATCH] Reserve device ID 51 for Virtio HAB (Host-Guest Auxiliary
 Bridge) device
To: Zelong Ren <zeloren@qti.qualcomm.com>
Cc: virtio-comment@lists.linux.dev, demiobenour@gmail.com, 
	lixian@qti.qualcomm.com, lxia@qti.qualcomm.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NxzC58LVExYu_WcODystRU7l_Nu4FGUxdhLMGDRkG7w_1785749859
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 6:10=E2=80=AFPM Zelong Ren <zeloren@qti.qualcomm.co=
m> wrote:
>
> Hi all,
>
> Gentle ping on this patch.
>
> The earlier questions have been addressed in the thread. Could anyone com=
ment
> on whether there are any remaining concerns with reserving Device ID 51 f=
or
> Virtio HAB?

Hi,

If there are no concerns raised for a period of time, the next step
would be to open an Issue in the repository (which you already did),
and request a TC voting as specified in [1].

BR,
Albert.

[1] https://github.com/oasis-tcs/virtio-spec#use-of-github-issues

>
> I'd be happy to provide additional details if needed.
>
> Thanks for your review.
>
> Best regards,
> Zelong
>
> On Mon, 7 Jul 2026, Zelong Ren wrote:
> >
> > > Can this be used for communication between two different guest VMs?
> >
> > We didn't have this use case today but with some effort this can be sup=
ported.
> > It should be viewed as 2 GVMs still requires the setup of PVM and assis=
tance
> > of it to reach this functionality.
> >
> > > Do you plan to upstream the specification for this device as well?
> >
> > Yes, agree 100%.
> > The ID reservation is the first step, we plan to upstream the device sp=
ecification
> > to the virtio TC as well.
> >
> > On Thu, 2 Jul 2026, Demi Marie Obenour wrote:
> > >
> > > > Virtio HAB device is an inter-VM IPC and shared-memory device
> > > > intended for multi-VM systems.
> > > >
> > > > Virtio HAB provides named service channels between guest VMs
> > > > and primary/service VM, primarily targeting platform-specific
> > > > hardware accelerators and system services (deployed in Qualcomm
> > > > automotive platforms).
> > >
> > > Can this be used for communication between two different guest VMs?
> > >
> > > > It also supports bi-directional zero-copy shared-memory lifecycle
> > > > operations (export/unexport/import/unimport).
> > > >
> > > > The driver is shipping in Qualcomm automotive IVI products,
> > > > supports Gunyah, QNX, Green Hills, Red Bend and Xen hypervisors
> > > > (KVM in progress), and is being prepared for Linux kernel upstreami=
ng.
> > > >
> > > > Signed-off-by: Zelong Ren <zeloren@qti.qualcomm.com>
> > > > ---
> > > >  content.tex | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/content.tex b/content.tex
> > > > index 243ce2d..25837d8 100644
> > > > --- a/content.tex
> > > > +++ b/content.tex
> > > > @@ -805,6 +805,8 @@ \chapter{Device Types}\label{sec:Device Types}
> > > >  \hline
> > > >  50         &   Video encoder/decoder device \\
> > > >  \hline
> > > > +51         &   HAB (Host-Guest Auxiliary Bridge) device \\
> > > > +\hline
> > > >  \end{longtable}
> > > >
> > > >  Some of the devices above are unspecified by this document,
> > >
> > > Do you plan to upstream the specification for this device as well?
>

