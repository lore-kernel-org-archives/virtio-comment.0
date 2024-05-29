Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179AE14EC6E
	for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 00:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716942639; cv=none; b=N2XGi82gsw69Rsv/LYxuS+2PRTTOxS7fKdkOORDB21AcaJmfFcGxpzT+8hJZdpVz6qWvB3aKVX4w9iMBzKispv7Ker/J3m6mqCdxlPHW+qeaR7PeI3wdzk2x14iczANzvYyfrUThYrOsvLjJJ1fxwf47VfAzVl+eP2e9H9imyjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716942639; c=relaxed/simple;
	bh=zZAeHG03w7tEihodl0SV8nloEEly2TMZAJxReBAkc3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=czVQn+Oy+r4gDhZrggRD0ZWEPztc2/vOamUge9An2E7IkFFSjpAf7/pEcHzD7OzdxaF5X1vqBNHxNB8c0UyNmZxpjpKZmlP7uTJxawvR6Z/WIx6zA/WHBa9z+nmcsES608NF/n2JBWC0YKNZG4w5tExTkm6hxrVqU3wzOjhEI1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IjyF/t7K; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IjyF/t7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716942636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZAeHG03w7tEihodl0SV8nloEEly2TMZAJxReBAkc3c=;
	b=IjyF/t7K043PInONZgCdmNUkUSNo9wBRTsDU5nFd/kq0Eja6Gw0uU3n0ENXmG7whPOqqxN
	b8vxcOzoVdgR5JiqDWsb2bXESEG2RSnxdUYSTuvRJM+kse6TA3Lx2ebkp/RiqTYTItWpPk
	Te7rqJJ5aDnI/VSaLyNjkRFmJqr903o=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-1vXb-sgkMZGltOksQ1dPjw-1; Tue, 28 May 2024 20:30:35 -0400
X-MC-Unique: 1vXb-sgkMZGltOksQ1dPjw-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2bf8a8799f1so1459262a91.1
        for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 17:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716942634; x=1717547434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZAeHG03w7tEihodl0SV8nloEEly2TMZAJxReBAkc3c=;
        b=G07WNh8PwNuUDE9/g74UjcGGNzNf6hlre67WiF3oi4HYP6BRjG0vloc1jxQXD7P3MI
         tJshArW9S/lm7KNNElEig5nIh9oHIFxfir3KNGs6ZX6eh9rTsMEwhlgWFK1ZZOyal8rp
         x7sugVSu/U6PEV/xlFHPeLCpWe388BaOPvkAVq2N5tJphCpLn6mf03VxuHlvztDYky8l
         mOk1XbyOVYEups2PoyrDkDMVGmN7ze5NzTiZue3fcom4ECkPoLpc74WVpiETm6dn/+XR
         CvtIob4xgp7tvr4NvEcSQQC2SNlTvylbcPnhUF8EU+WrSrc708HXQg4EH5B+bBtUzCk/
         aolQ==
X-Gm-Message-State: AOJu0YwyBbw0o3bo91t5a13CONcR144WaTIjzVQXPwHYD1CdLEsuAcxp
	89j8HSisNeOd6mLc/DSHfVTGG4T51hbiTtsEDggEsAvCJ155Q6C8XId+Pc/VfObTz2ODUlNDJKu
	nOqXrt6U7eHoWs86aTMnHFVGgKzJ6y6egktpY9hw0j9WORp40qmkDzJoq6IV3ndXZkjSpJNlAlD
	IJI1/6hZxD/mPQiJLUVQJI8Rt7Ko3B43wuYKzDq1A=
X-Received: by 2002:a17:90a:ff15:b0:2ae:78cd:59fe with SMTP id 98e67ed59e1d1-2bf5f74dfdfmr12669089a91.31.1716942633994;
        Tue, 28 May 2024 17:30:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/dcNtbOgv8HoHGWlHfXhtiewkeXfybvlXYjda1ZHAae8ur/JPn0t3B58q+wOjmjfykokxXeVSJbx6DHIgCVg=
X-Received: by 2002:a17:90a:ff15:b0:2ae:78cd:59fe with SMTP id
 98e67ed59e1d1-2bf5f74dfdfmr12669065a91.31.1716942633505; Tue, 28 May 2024
 17:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com>
 <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com>
 <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com>
 <a630f422b86ea4dd96418a84b5eea196fc98f326.camel@redhat.com>
 <CACGkMEsuhCoBe=dXTroTunjX98BUVo-EyyE3HRhzL0D4gC-qXw@mail.gmail.com> <387c70eab4f9984938e721aee18b64080bb5e55e.camel@redhat.com>
In-Reply-To: <387c70eab4f9984938e721aee18b64080bb5e55e.camel@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 29 May 2024 08:30:22 +0800
Message-ID: <CACGkMEt+9oFwVbwnjB_EDB0iS880uza1hxo3m0EKmE06_1usjQ@mail.gmail.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 1:47=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On Tue, 2024-05-28 at 10:57 +0800, Jason Wang wrote:
> > On Mon, May 27, 2024 at 4:06=E2=80=AFPM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> > > On Mon, 2024-05-27 at 11:26 +0800, Jason Wang wrote:
> > > > I meant, virtio is not necessarily for a software implementation.
> > > > Various hardware vendors started to implement it as well.
> > >
> > > Note that the above links refers to an HW offload implementation for
> > > TCP over UDP tunnel TSO support.
> > >
> > > > I wonder if hardware is as flexible as Linux to support general UDP
> > > > tunnel offload.
> > >
> > > I don't have additional information WRT HW specific limitations.
> > >
> > > Perhaps the vendors (nvidia? intel? who else?) could chime here to
> > > specify such limitation if any.
> > >
> > > How is that kind of scenario managed with plain TCP TSO for virtio?
> >
> > It's a problem indeed which needs to be addressed (and it is required
> > for big TCP).
> >
> > > e.g. let's suppose that some virtio H/W only supports a limited numbe=
r
> > > of segments per TSO packet.
> >
> > A similar problem like this:
> >
> > https://lore.kernel.org/lkml/20240411051124.386817-1-yuri.benditovich@d=
aynix.com/T/
>
> This is actually for the "reverse" problem, right?

Not sure but I think the context is all about migration compatibility.

> I think we can have
> HW induced migration issues only if the H/W introduces some unexpected
> constraints in the VM -> Host direction.

Yes, it's kind of similar. For example, destination is not as capable
as the source:

1) dst's max gso segs is less than the source
2) dst's UDP tunnel offloading is not as "rich" as the source
(something similar to the UFO removal issue in the past).

>
> Restricting the problem to the tunnel part of GSO/TSO over UDP tunnel,
> The only variables there are:
> - the tunnel header size
> - the outer header destination port number.
> - the inner mac header type
>
> I think the easiest thing is requiring that HW implementation for
> virtio net supporting GSO over UDP tunnel must support:
> - a 'reasonable' arbitrary maximum tunnel header - say 128.
> - any outer UDP header destination port number
> - ethernet inner mac header
>
> If the above proves to be too restrictive, we could later extend the
> specification to fine grain negotiate the mentioned parameters, and
> prevent migration on Hosts with too restrictive capabilities. I think
> that designing that now (even before such negotiation for plain TCP
> TSO) would be too early.
>
> WDYT?

It should be fine. A question here, does the kernel have checks for
the above? (e.g max tunnel header size)

>
> > I think this approach is problematic as it causes migration
> > compatibility issues.
> >
> > (Unfortunately, it is applied and for some reason my comment doesn't
> > reach the list ...)
>
> I guess the above is a slightly different topic. I suggested to send a
> revert with the reasoning or at least to start a new thread about the
> problem.

Fine.

Thanks

>
>
> Cheers,
>
> Paolo
>

