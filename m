Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AE3522A
	for <virtio-comment@lists.linux.dev>; Thu, 30 May 2024 02:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717036634; cv=none; b=a/lLUq1QoW+YywX8Vjl9KGjwxVf9dPPauia7LsjHMGUM6ibCgcDGTU6xt1xlsa4ph7ZlHh4Cdro9tyxRZO0yizq9BnnpbE8gVYMA2pOYIt5ISx+5SINGQG5+uCNM0nymCFvsQeqlyVHZsY7neD89lILsrRceJtJPXwApv8pR8bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717036634; c=relaxed/simple;
	bh=IAN+nMzFW9fEprx0FCOI3Fi+DwuTBOEyWSojoVHSJek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQ+FNvGl2XOv3u0hsg2nA0e/fbPBPjrRmqUixh9MhyZ7AOrhzipawQKX8GVFfVhplAz094Ldk66HWZEvPQMoeACQp6TricuF07HebxWPWGPp9J1hoaSgwwlspkLeohHxDkaEKrA15b1mRtWaYkAfjtcdhowL9+IckdySxNKpsl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d1mXrhdE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d1mXrhdE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717036631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IAN+nMzFW9fEprx0FCOI3Fi+DwuTBOEyWSojoVHSJek=;
	b=d1mXrhdE3uNISQlILXjADtIFzLuORdeCbvIxSXI0q5nL0AjXSozQLKJybeuK+AaZj+/WbF
	UEEnlluiNnHjxlo2axBlnfTlH+LYZFFDiGB9FGBGZQfYmiOQdWoRSwLnwnC6mFy8Df/aNN
	d4jbhznepOedt1HiVbMzHDBIPzTGoRs=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-l31qGo-sPGSdHy4V-1k4og-1; Wed, 29 May 2024 22:37:09 -0400
X-MC-Unique: l31qGo-sPGSdHy4V-1k4og-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2bf5bb2a414so351322a91.1
        for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 19:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717036628; x=1717641428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAN+nMzFW9fEprx0FCOI3Fi+DwuTBOEyWSojoVHSJek=;
        b=VBT849Vnk5mUOa0gVGWlRAzdnh0cb0HXAKwowbwhOfxgfDMKKdXwmi1ekHS0BSsPBe
         F0ejYthdaghilBLSfgeA93D3zsoaoSSPhAIY7dmsd1X5++ixIKkpuuLuNFeRgYCfJ/yW
         7aPzD/lQphMzhrO3ChZXxcxoTILf7c2/JExJ/OTeN5lGcgG1mjQ98biQIgs0zcU61n+a
         vwLLgm5SOGTL4dAaFjPb6TzSPI8sO6zbesCxeoVWNw7OLR9WNH22V1/JEy2b0KrklSwe
         8Cl22H0EnfveXDQuPux4aYVmSggLm5HAAUwdR/yVINW1vr9r+gGFZByNETZzULYOyHJA
         v/OA==
X-Gm-Message-State: AOJu0Yy4TPQkmhJiewASRZrWxkHvFyseToiQf0Juh85axjULlga9SBQx
	fxYclREpUl8V6RJExtgg2jYcsH8/EPWbJvvtOeo0SgQXfsQ0MB8R0kNv4YGay4XFSQzMRYzvl+T
	P19cZKvRqMcTfPbcE9OKTG6vAOJWKVZbU3rQA4GKNOA+hC9tHAb4bv81AckYnE426EpeCorUGWC
	DeIoktVuhp0ZSmON2kT73033oD6vXwKyAjfi7Ua/8=
X-Received: by 2002:a17:90b:a4d:b0:2b3:28be:ddfa with SMTP id 98e67ed59e1d1-2c1abc6a03dmr876788a91.38.1717036628388;
        Wed, 29 May 2024 19:37:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFIezGTZfq7F5JN1a/QMFl6qTB62sTjiJfIghsxsbY4dTIAziCy69TMbm7CjxON4u5E3r1NCkbaQfDwzOdtJw=
X-Received: by 2002:a17:90b:a4d:b0:2b3:28be:ddfa with SMTP id
 98e67ed59e1d1-2c1abc6a03dmr876771a91.38.1717036627839; Wed, 29 May 2024
 19:37:07 -0700 (PDT)
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
 <CACGkMEsuhCoBe=dXTroTunjX98BUVo-EyyE3HRhzL0D4gC-qXw@mail.gmail.com>
 <387c70eab4f9984938e721aee18b64080bb5e55e.camel@redhat.com>
 <CACGkMEt+9oFwVbwnjB_EDB0iS880uza1hxo3m0EKmE06_1usjQ@mail.gmail.com> <d7b1cf767c56cae57a5c8c10b6be8aaae9f9ce05.camel@redhat.com>
In-Reply-To: <d7b1cf767c56cae57a5c8c10b6be8aaae9f9ce05.camel@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 30 May 2024 10:36:56 +0800
Message-ID: <CACGkMEueGyq5cpX4fBeK3fy4ejYGjmYG=MS+sr-chNvafex4iw@mail.gmail.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 6:25=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On Wed, 2024-05-29 at 08:30 +0800, Jason Wang wrote:
> > On Wed, May 29, 2024 at 1:47=E2=80=AFAM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> > >
> > > On Tue, 2024-05-28 at 10:57 +0800, Jason Wang wrote:
> > > > On Mon, May 27, 2024 at 4:06=E2=80=AFPM Paolo Abeni <pabeni@redhat.=
com> wrote:
> > > > > On Mon, 2024-05-27 at 11:26 +0800, Jason Wang wrote:
> > > > > > I meant, virtio is not necessarily for a software implementatio=
n.
> > > > > > Various hardware vendors started to implement it as well.
> > > > >
> > > > > Note that the above links refers to an HW offload implementation =
for
> > > > > TCP over UDP tunnel TSO support.
> > > > >
> > > > > > I wonder if hardware is as flexible as Linux to support general=
 UDP
> > > > > > tunnel offload.
> > > > >
> > > > > I don't have additional information WRT HW specific limitations.
> > > > >
> > > > > Perhaps the vendors (nvidia? intel? who else?) could chime here t=
o
> > > > > specify such limitation if any.
> > > > >
> > > > > How is that kind of scenario managed with plain TCP TSO for virti=
o?
> > > >
> > > > It's a problem indeed which needs to be addressed (and it is requir=
ed
> > > > for big TCP).
> > > >
> > > > > e.g. let's suppose that some virtio H/W only supports a limited n=
umber
> > > > > of segments per TSO packet.
> > > >
> > > > A similar problem like this:
> > > >
> > > > https://lore.kernel.org/lkml/20240411051124.386817-1-yuri.benditovi=
ch@daynix.com/T/
> > >
> > > This is actually for the "reverse" problem, right?
> >
> > Not sure but I think the context is all about migration compatibility.
> >
> > > I think we can have
> > > HW induced migration issues only if the H/W introduces some unexpecte=
d
> > > constraints in the VM -> Host direction.
> >
> > Yes, it's kind of similar. For example, destination is not as capable
> > as the source:
> >
> > 1) dst's max gso segs is less than the source
> > 2) dst's UDP tunnel offloading is not as "rich" as the source
> > (something similar to the UFO removal issue in the past).
> >
> > >
> > > Restricting the problem to the tunnel part of GSO/TSO over UDP tunnel=
,
> > > The only variables there are:
> > > - the tunnel header size
> > > - the outer header destination port number.
> > > - the inner mac header type
> > >
> > > I think the easiest thing is requiring that HW implementation for
> > > virtio net supporting GSO over UDP tunnel must support:
> > > - a 'reasonable' arbitrary maximum tunnel header - say 128.
> > > - any outer UDP header destination port number
> > > - ethernet inner mac header
> > >
> > > If the above proves to be too restrictive, we could later extend the
> > > specification to fine grain negotiate the mentioned parameters, and
> > > prevent migration on Hosts with too restrictive capabilities. I think
> > > that designing that now (even before such negotiation for plain TCP
> > > TSO) would be too early.
> > >
> > > WDYT?
> >
> > It should be fine. A question here, does the kernel have checks for
> > the above? (e.g max tunnel header size)
>
> At least a driver (ice) has a check for that in its ndo_feature_check:
>
> https://elixir.bootlin.com/linux/v6.10-rc1/source/drivers/net/ethernet/in=
tel/ice/ice_main.c#L9556
>
> The tunnel size limit is 32, and the callback additionally ensures that
> the tunnel header len is not odd.

Ok, this should be fine as we can fallback.

>
> Note that in such ndo there are more constraints related to plain TCP
> TSO - e.g. maximum IP header len <=3D 508 for both the inner and outer
> header (no idea how that could be respected in practice).

Right.

>
> Do you have other comments or can I go for v5 including the mentioned
> constraints on the tunnel header layout?

One more thing is probably to clarify how the outer checksum is done.

Thanks

>
> Thanks,
>
> Paolo
>

