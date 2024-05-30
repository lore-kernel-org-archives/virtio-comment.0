Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABFB2137F
	for <virtio-comment@lists.linux.dev>; Thu, 30 May 2024 16:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717086263; cv=none; b=f1BwBkkqr2oclTxt7/zMGmJM/4CZWt7KA9/qVG7prqA1GKxYNxJG6gbG5llAcBXBOtiHKO+XX0/izbzlV4fr434xLd3slcFxBWbeDzhcB+OLozoc0x7qTOSiEPO98WTTdG1RYUinV/oOEf1GIyrdWqgsVJFpWDIglcX6Yde8aFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717086263; c=relaxed/simple;
	bh=a7Mdx4nH0KX8njF7bBu7km0sqJymAIA7Ot6nE6mSuMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XnUACTdnS+hDWPJsDEwGsn+k873dGff/ORlJKYiSx6wVCoW5TcxkH/jT+D+OhsJFBb1m3bTWOphrFChRQICD00DyOt70zKMp3G7QHaqOvfLzWgC6N4JtV6aEf70J4H8fngNgEGFttnoEbsGHxofz8v82IUDrFd43zez9CtLJRlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zT1ga6Zc; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zT1ga6Zc"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-43e14f0bd75so320511cf.1
        for <virtio-comment@lists.linux.dev>; Thu, 30 May 2024 09:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717086261; x=1717691061; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a7Mdx4nH0KX8njF7bBu7km0sqJymAIA7Ot6nE6mSuMU=;
        b=zT1ga6Zcb6nVD3j51CcMUlXfNUeUjuGyKmsrGITFsybfTCfAdySgAK1B8Jyu4wXA9j
         Yf4jc7QMGkwlFjarJTDLFkuW7RXTO0KrZFI0uC0RDVy8Hd4pS6LSd6QRuvuAK9afA7e/
         yoCZw9MQpP8DQ8pXKjttuq0eVRpff9F0FwU34tptEGC6M+3TLBNh/dsEzh/HcRtdebUo
         zehsWAG1uf7ViRNQTejAqAnrG7cPwUEA6sBDOqpMQccUTKULabCCJ+20IBTzSUVZhZM0
         whd9g0VvvOBLuLHcOwtYWo9Wx7DYVefrKw0RRTIsDSrOVqBv2wSJke7J22wmK2bZFWhK
         dtsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717086261; x=1717691061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7Mdx4nH0KX8njF7bBu7km0sqJymAIA7Ot6nE6mSuMU=;
        b=dRWK1WML7QNXcPNWm1T8dQx9OCsYGbbqYR4ybDS4MwWQA7+0xaQPe5kzoUyWtGIlKY
         REAn5ImLJfXEyjg7EV4v+/sHv0/yd0yPY62cS/pqq9YFBmtdTbpHydZYCwFh0STpx75K
         HxBYD+ltVs1yJi4g81LWfgL/D9bjkFhIEtW8GL870eAqGpIA4N0ErAajijnk6PbIT42l
         woqfYkDpSsqQ0bZmFnzdlpovlX2WaCTzmZtwyDyIm9vuyNsoW5+Nd1SPNARV1PNUI4EF
         cLDPhtnvIMYdBoIRV2Gvj0+oMf2J65ZWx2r0xJBk4TdXs/hL9781VSKzQHvX2+ihLPAd
         kkLg==
X-Forwarded-Encrypted: i=1; AJvYcCUz4BpMyolCIDAe/Mv/9lWwq2t+ddQkyLRvFBLkeX8hh1nMLQIKFfXwV27tSD02xGB4Kquku21qKByUQwfcMA5Om5sSBEMvaS/PJscHd4Q=
X-Gm-Message-State: AOJu0Yy4AZFGeYZB0SIcuEg4sujEOLqI902o1AzIZdVdvXzt+WJbMCvg
	fMEMMByX9VGAx8T9h0bOzaTotCSq1TiQxlDB8pahw+ZpuKGbEbfmOYph5Qd/XnwO6XyNI2CuNlQ
	ly7qjI98sI8BuZ/IsBCR/HVJuVaD8CeS1BJ03
X-Google-Smtp-Source: AGHT+IE/ggapybSjv94XB3n3JxqJ5Af2wd4FQBHBiPixwUFOTF2wRYZ6eNJXaHOyepYeZz02K1ykQgD+SbRJNEmFbvg=
X-Received: by 2002:a05:622a:578f:b0:43e:3833:c5e3 with SMTP id
 d75a77b69052e-43feb3a328bmr3283401cf.11.1717086261071; Thu, 30 May 2024
 09:24:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com>
 <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com>
 <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com>
 <CA+FuTSfCm-GpLHYztQCxti2adCcFPV7GyKBH1zTDB8tM2w1NNg@mail.gmail.com> <794dd45767bf54385613c5d18c32ee11d474db87.camel@redhat.com>
In-Reply-To: <794dd45767bf54385613c5d18c32ee11d474db87.camel@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Thu, 30 May 2024 12:23:42 -0400
Message-ID: <CA+FuTSeDqrQ3FVjpmmQ31UbyGQA-fUsYz3=NmizC1U7Q8w6E3Q@mail.gmail.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"

> > > > > inner transport header offset from the provided information, as it's
> > > > > currently the case for plain (not UDP tunneled) GSO packets.
> > > > >
> > > > > The outer UDP header may carry a second checksum, which can be offloaded
> > > > > independently from the inner one. Since UDP tunnel checksum offload
> >
> > Just require local checksum offload? Computing the outer checksum is
> > always cheap. Optional double checksum offload might add complexity
> > that is not needed, as it is so cheap.
>
> The rationale behind the making the outer csum offload manadatory was
> to keep the specification change simple and prevent the exhaustion of
> the virtio_net_hdr flags and gso_type exhaustion. With this change,
> 'flags' has 4 bits used out of 8 and will raise to 5. 'gso_type' has 3
> 5 bits used and will raise to 6 (even if only 3 of them will be
> bitfields).

Perhaps we're talking about something different. I'm suggesting that
the outer checksum is not offloaded at all, because outer checksum
generation and validation is always cheap in software. This is the
premise of LCO.

> The complexity problem is only relevant for h/w implementation, right?
> Is really such a problem for modern H/W?

I'm concerned more about the virtio_net_hdr struct and minimizing
the combinatorial explosion of allowed flags.

We've had a lot of issues in the past with the Linux implementation,
in part because we allow combinations of fields that have no practical
use, but let syzbot go nuts. And then we have to patch up the data
path with branches that slow down the actual practical cases.

> > Can you reconsider the choice to only allow UDP encap that includes an
> > inner MAC header?
> >
> > There are useful UDP based tunnels that skip that, such as GUE. Virtio
> > revisions are a long process. If we can accommodate those in the
> > design from the start, that saves us much work later. Or, at minimum
> > make sure that the proposed design can easily be extended to such
> > protocols.
>
> I'm surprised about interest in GUE: for years I wondered about
> deprecating and removing it (together with FOU).

We use it extensively. In fairness, maybe as a result of my choosing
this protocol when we needed a (UDP based) tunnel protocol with
custom internal headers. FOU and GUE are well suited to that.

> Yes, I think the ethernet-only constraint could be removed, but I fear
> that will pose some difficulties for H/W implementation - requiring
> extra flexibility - and possibly some additional features negotiation
> should be needed.
>
> I think that the struct layout can already cope with GUE or the like.

Great.

To be clear, I don't mean to ask for all back-ends to offer support for
all these. But that the layout supports it.

I suppose if we want conditional support, then that would require
extra flags on negotiation. E.g., a separate
VIRTIO_NET_HDR_GSO_UDP_L4_TUNNEL type.
