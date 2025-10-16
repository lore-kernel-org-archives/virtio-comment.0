Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720D67494
	for <virtio-comment@lists.linux.dev>; Thu, 16 Oct 2025 06:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760595791; cv=none; b=BTNNLjMxn69rYXq1JTTGCEbVnFK0QyiMk/9iElsScS1l3LFR4L0AmeX9LMWwrfAVA8LD6sesIF2Us3tRFOaP5zVC5kWS9q2Ky/Jd/eWeyiEDz6rRV7IL4t3UdOvzmOvk61L5wV4nuFn/pGtW0qxgGKvUbvguqpN71aY9dtJHyXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760595791; c=relaxed/simple;
	bh=NmHiAhSVVlsbZSzx2P4dwXuqUGdyJIKphlA7zHN3pKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QiUq/jKIdq0H7RgXUF+Oq/xearU/wWEvet9CAyo4R84n5/46Wv6bnIAi3KH5BDE5vYs6RGB/sVIruB0nLeP5rRQC4O/n8uYp/2WhA44bryCsXepU3s7SR+3sjVuxuBZWxGFS2/QcTNy7ZTQGTCXJmnxacmCtjaS4GkSje/FiqCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EBWEYC5L; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EBWEYC5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760595788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/ML+ifqkTc03xk1bafj+Tv/8Xeg+SCItrXoPmm6dq4=;
	b=EBWEYC5Lfjr+WPklU9wwijnFk3kw4PBr8uSEm3KrRZ9kkdxHA50NK9MfCvi4VgEpsWgsFY
	ajkxiJVFbm8PKolzi2P7HtNo8pu/kJPaB472xQVlUBJuH1R/myAJ1l/CdHqI+jCCJ37mBT
	4hrRJ3SaIuRvsmqzRh48BFWfdV5u6WM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-_sIH4d0bMjGuk6a2hFkz6g-1; Thu, 16 Oct 2025 02:23:06 -0400
X-MC-Unique: _sIH4d0bMjGuk6a2hFkz6g-1
X-Mimecast-MFC-AGG-ID: _sIH4d0bMjGuk6a2hFkz6g_1760595786
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33826e101ecso1620642a91.1
        for <virtio-comment@lists.linux.dev>; Wed, 15 Oct 2025 23:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760595785; x=1761200585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/ML+ifqkTc03xk1bafj+Tv/8Xeg+SCItrXoPmm6dq4=;
        b=jDCCa5jKVITK6brN91+jbsOvybEOikazESBZgbMXY7Gy12wRqRVTVQWm/MJP29F0yz
         BesJ+gaj+Cc3RbUI5RMgapZY+NBpKYNyAkhKuJjqWsCSazueo7onY2QxM85GlJ22DffX
         exueu4M3m8SYY1SaMrP8+/fV3Zk0DmWsDfmVtcvCQ+r9o00Gl6+KwaKBrppBv/26mNwe
         qrJyndiM7fGUN/jrvjL7AdZjuBLIYNEpzAfJ0nt/TMh931ZmNB5TtG70wmySXL0YXHPH
         HiEIGvH3KPKmC9vvUDdV++4UeeQ80oy7dlgMH+zqhGhQKAKdO6czQebWEiLqur9kdnxl
         5BQA==
X-Gm-Message-State: AOJu0YzNBeY43IjtMwNbALTAAJMuzhdhTRmfwKr6y0GMOw6YcLuVIINs
	MHu5GCqGmNWgoDXCeYQ/58YIe0dzRtCxM/+3vgBGOhRaoHvrQOFtfOvZFx8ewGHACZpGLSXQdwx
	S9IN0xxTFClbRvxgKA+RYbO7p0htiIhoZsznxEjyYLmOtOj2VOe7Mi4cUHsFoBMOvWt8Cc4Wr+I
	AJeSIALAyLp9ojIW94385Bz3xArRD9HTRowci/+6XqbvvbaChxUFqhTQ==
X-Gm-Gg: ASbGncs0Kp0PxUTDmxSGI54jvPC0ngdsjZhnx3SERzGjCU9TGiUe893gBDHr86H1FuT
	5F3mGpDdc+ukJI1fJU7owqwJ1Nb6hVidbHHYMi0ookPgbx37twgGBqBcDPFztS27Tw52pq3QXqr
	1KOkASvHIVRYqeeyM6MO6MXOcDcGXm3yX1JoRpU+hI0URXgJ94FZcWBtKv
X-Received: by 2002:a17:90b:4f47:b0:32e:72bd:6d5a with SMTP id 98e67ed59e1d1-33b9e0a09a5mr3576149a91.1.1760595785389;
        Wed, 15 Oct 2025 23:23:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcfxNsFvjYooRrfDwTKMhRqGhxxjV1CSbZjpPmCpyLUGtVoF8Pyc/Bldw4IUcgciYIefIXRKUB9nyu09pwA5Q=
X-Received: by 2002:a17:90b:4f47:b0:32e:72bd:6d5a with SMTP id
 98e67ed59e1d1-33b9e0a09a5mr3576125a91.1.1760595784848; Wed, 15 Oct 2025
 23:23:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251014042243.22087-1-jasowang@redhat.com> <20251014044005-mutt-send-email-mst@kernel.org>
 <CACGkMEs7Y9DLuRp_3ex8ac3Hv5y7X5Q-PnS61DMjOVjAkvazjA@mail.gmail.com>
 <20251015024018-mutt-send-email-mst@kernel.org> <CACGkMEt77EDs4MKo9RSnXRxuVD8hZFca+W3mAxv6sQ3sWN-xZw@mail.gmail.com>
 <20251016021820-mutt-send-email-mst@kernel.org>
In-Reply-To: <20251016021820-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 16 Oct 2025 14:22:53 +0800
X-Gm-Features: AS18NWAP9w8lJlVR6wijhl7Bu6Bk1yQe5Yr7LJ6uRA7VJltbQEdmtVFUCYijzEE
Message-ID: <CACGkMEtJUhH2CTbUfF08=tv0kQGZa3R_KdvwyXZKtxDWgVsHPg@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: introduce TSO limit feature
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, lulu@redhat.com, nguyenlienviet@google.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7sWE06tkRv09wK1V1nuTd89-6S4T2fbEzGjwrGdlkrc_1760595786
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 2:19=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Thu, Oct 16, 2025 at 01:46:58PM +0800, Jason Wang wrote:
> > On Wed, Oct 15, 2025 at 3:02=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Wed, Oct 15, 2025 at 12:29:13PM +0800, Jason Wang wrote:
> > > > On Tue, Oct 14, 2025 at 4:59=E2=80=AFPM Michael S. Tsirkin <mst@red=
hat.com> wrote:
> > > > >
> > > > > thanks for the patch! yet something to improve.
> > > > > I note issues only when encountered 1st time but please
> > > > > do go and check all patch for each issue.
> > > > >
> > > > >
> > > > > On Tue, Oct 14, 2025 at 12:22:43PM +0800, Jason Wang wrote:
> > > > > > This patch introduces TSO limit feature which allows the device=
 to
> > > > > > advertise:
> > > > > >
> > > > > > - Maximum TCP length of a TSO packet or inner TSO packet when U=
DP
> > > > > >   tunnel is support
> > > > > > - Maximum number of segment that can be produced by the device =
after
> > > > > >   segmentation of TSO or inner TSO packet of a UDP tunnel
> > > > > >
> > > > > > This is a must to implement TCP jumbogram, as networking stack =
needs
> > > > > > to know the limitation of the device in order to produce TSO pa=
cket as
> > > > > > large as possible.
> > >
> > >
> > > Maybe you can provide an overview of how this all is used?
> >
> > Sure, this feature does not implement BIG TCP (jumbogram) itself. BIG
> > TCP requires a little bit more to be implemented:
> >
> > 1) new gso_type for jumbogram
> > 2) when TCP length exceeds 64K, we should mandate ip->tot_len to be
> > zero and device can judge from the length of the buffer
> > 3) other stuffs
> >
> > I guess this is something that Viet wants to work on.
> >
> > But before BIG TCP, the driver needs to know the device limitation of
> > TSO packets. That is what this patch did. BIG TCP is not the only
> > user, it could be used in the software datapath as well. Consider a
> > simple datapath:
> >
> > virtio-net -> TAP -> bridge -> eth0
> >
> > If eth0's tso_max_size is less than 64K, we need to advertise this to
> > virtio-net otherwise 64K gso packets will be segmented by software run
> > xmit in eth0. We've encountered this in collaboration with mana and
> > virtio-net/vhost.
>
>
> Wait a second this does not make any sense. Bridge disables tso,
> it only works with gso.
>

I don't understand here, we have used similar setups for a very long
time and TSO works well?

Maybe my statement is not clear enough, I meant the forwarding path of
the bridge.

>
> So what is the actual motivation?

Thanks


>
> > > I am looking at tcp_fragment and I just do not see
> > > where it looks at any device limits.
> > >
> >
> > It works like a device advertising tso_max_size/segs, and it is capped
> > by gso_max_size/segs. The gso_max_size/segs were the ones that are
> > used by the stack to determine the skb->len.
> >
> > Thanks
> >
> > > --
> > > MST
> > >
>

