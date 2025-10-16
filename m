Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5A2242D9F
	for <virtio-comment@lists.linux.dev>; Thu, 16 Oct 2025 05:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760593638; cv=none; b=Xb0JYbfEs4FZIZDueyCuwavwIHOAVhdFbuApBgSi3UqWRiyaFjTn4crUzi1l5N3dO4PjkhgyvALWE7HHZvTpYnEpfqatKJfgaBZ6m2pqenmmvyDDpgrLPJAw/NvObuHJpfrDXHfyO2Xayc3PLxasF8U3OLiQuHNn0n3KxfZSw/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760593638; c=relaxed/simple;
	bh=4ZNWI5R7XcS28G78RjGJSVRLhTI6VYhp+wDxkYWBYwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FsJqihsACAZyvJk0OFExvXFYkSpqSw/Sq363WeA8GUvvnLlhq+zTw1zYrFs2+w3y8Vc1kQQIhE4J/7U9A4HGxDTiD1hon7+hvxYWUCCSpUCE7742spkjOzGSYtkfG1QMFRQgVmXaDTF3YvjGZzUZnLqTTuVZmPb0HHE+7UTjoyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KJoG1KNt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KJoG1KNt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760593632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y06V+XJFqaD8Oci+5ur1Ae7/j+wUIsIbDWRfVm0QTdc=;
	b=KJoG1KNtnTC5eqyXkEqJPXHTEOV1TSGJaJ5jroaFkt0uEWqzqoYBrOVXivvSV460plKnko
	MKk7AxZqCOAIOdXAkVLsHqpk0SgOid65CjJveuo7TqiBphi33478qQAkeEiVnbmGIs0USH
	Yqn2X/T+2OFGg8rTwGl+34tVf0nObOQ=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-tt4rGS7mP_6vzP26JERM1A-1; Thu, 16 Oct 2025 01:47:10 -0400
X-MC-Unique: tt4rGS7mP_6vzP26JERM1A-1
X-Mimecast-MFC-AGG-ID: tt4rGS7mP_6vzP26JERM1A_1760593630
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33428befd39so965685a91.0
        for <virtio-comment@lists.linux.dev>; Wed, 15 Oct 2025 22:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760593629; x=1761198429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y06V+XJFqaD8Oci+5ur1Ae7/j+wUIsIbDWRfVm0QTdc=;
        b=en6tdPeKuLtnbzKlpwdJfqnmplEQ1IpJtzrK6VfPFDoVhbhAwZEn9Rx6kPe/MuuSeB
         9XECFUnWs8cpvflxUANkplQlRCFSbw07FJipc76C13URHP2Ito3cEV+oWs7OXiDDPO17
         gn+KjglRjlNj5rHilS947aJIiioZjgLXU34ftJK5BeTravzuSNjIyXxhcvSILDrsf/4G
         nlyKx2/4LKeIrcH33XgdR8oRjt/uy6/fp27IXINauNrVs5YPJFxwi0ZCPi0o3EwkXFVE
         HZYuDNEAJN0SbH6Rz6GpTr9jWNrQ14nuwRlyW3jU4DHnEyymxD7YQzYti/qkQTk7F8dH
         1nrw==
X-Gm-Message-State: AOJu0YxXqilCYv4HWw90F9nk9FV/s4djLMheUh4i+k5Sl3qkJTKyAqU0
	Z2THDcJAMMu8iC1x3t6rVCY4ykq3HU4GC+pj7gcYCnaRdzbVB5sSGHtza77UDCQ44qc13ft2Ohw
	FXH+6Gj1w0d0wXjmZ2ZOECpp6GCrZKjEEONdqwmYH84lMHOUv71TIXKo1HHy332wFu1tYs4WwrZ
	YZnLAxL2kuvLqvDoJ4rcht05OOvjR2XBf2On+D18VU3ZI=
X-Gm-Gg: ASbGncvPCTUr3R0xUaIhIO39eEdTGV6Tu0/A/AiJaqTxoSoPBuIC4g3JOpKzTOCOD58
	PcxlAwhwUFuRlF4bxrGa8eOTHEzNE4ualnileU2E2+SdfsypylVplrQtl9xNZH+hRaouj/gY4JO
	cQRgzlxGqEWCX9U1e+a6hmoL2LmRFs66Mq1M2+Yhwab1s747WPlxDt
X-Received: by 2002:a17:90a:e703:b0:33b:b453:c900 with SMTP id 98e67ed59e1d1-33bb453ca3fmr400740a91.19.1760593629527;
        Wed, 15 Oct 2025 22:47:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4zR8IoCoc0HUTq2cU0SqpWYTw50koGK3Kw8ggUBjEbVS0HEipUvvqjtNnvby2vhIAGqj8UcxKyxroZZev7Bg=
X-Received: by 2002:a17:90a:e703:b0:33b:b453:c900 with SMTP id
 98e67ed59e1d1-33bb453ca3fmr400723a91.19.1760593629082; Wed, 15 Oct 2025
 22:47:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251014042243.22087-1-jasowang@redhat.com> <20251014044005-mutt-send-email-mst@kernel.org>
 <CACGkMEs7Y9DLuRp_3ex8ac3Hv5y7X5Q-PnS61DMjOVjAkvazjA@mail.gmail.com> <20251015024018-mutt-send-email-mst@kernel.org>
In-Reply-To: <20251015024018-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 16 Oct 2025 13:46:58 +0800
X-Gm-Features: AS18NWCKM-kjRyjE9QfWIsc1W7RlHmRi8UyqComb3Irorv9aHVKnPvSlBI9q8Vw
Message-ID: <CACGkMEt77EDs4MKo9RSnXRxuVD8hZFca+W3mAxv6sQ3sWN-xZw@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: introduce TSO limit feature
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, lulu@redhat.com, nguyenlienviet@google.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Udc-Y3X6-9w1cWondFX4UurN85i284l-FwakgQPKGXA_1760593630
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 3:02=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Wed, Oct 15, 2025 at 12:29:13PM +0800, Jason Wang wrote:
> > On Tue, Oct 14, 2025 at 4:59=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > thanks for the patch! yet something to improve.
> > > I note issues only when encountered 1st time but please
> > > do go and check all patch for each issue.
> > >
> > >
> > > On Tue, Oct 14, 2025 at 12:22:43PM +0800, Jason Wang wrote:
> > > > This patch introduces TSO limit feature which allows the device to
> > > > advertise:
> > > >
> > > > - Maximum TCP length of a TSO packet or inner TSO packet when UDP
> > > >   tunnel is support
> > > > - Maximum number of segment that can be produced by the device afte=
r
> > > >   segmentation of TSO or inner TSO packet of a UDP tunnel
> > > >
> > > > This is a must to implement TCP jumbogram, as networking stack need=
s
> > > > to know the limitation of the device in order to produce TSO packet=
 as
> > > > large as possible.
>
>
> Maybe you can provide an overview of how this all is used?

Sure, this feature does not implement BIG TCP (jumbogram) itself. BIG
TCP requires a little bit more to be implemented:

1) new gso_type for jumbogram
2) when TCP length exceeds 64K, we should mandate ip->tot_len to be
zero and device can judge from the length of the buffer
3) other stuffs

I guess this is something that Viet wants to work on.

But before BIG TCP, the driver needs to know the device limitation of
TSO packets. That is what this patch did. BIG TCP is not the only
user, it could be used in the software datapath as well. Consider a
simple datapath:

virtio-net -> TAP -> bridge -> eth0

If eth0's tso_max_size is less than 64K, we need to advertise this to
virtio-net otherwise 64K gso packets will be segmented by software run
xmit in eth0. We've encountered this in collaboration with mana and
virtio-net/vhost.

> I am looking at tcp_fragment and I just do not see
> where it looks at any device limits.
>

It works like a device advertising tso_max_size/segs, and it is capped
by gso_max_size/segs. The gso_max_size/segs were the ones that are
used by the stack to determine the skb->len.

Thanks

> --
> MST
>

