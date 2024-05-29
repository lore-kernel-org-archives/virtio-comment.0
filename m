Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF8116D9DD
	for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 10:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716978338; cv=none; b=i0uTtWRxykI3G+nWusXsyUYrnoUdhWcCVOnmzQwsJrHEXbNU5FVOgJf5akn9FvUe5s2P9QVm0LAcWKj0giGSxJBqdAIDXjdVCM7++abeEV2s2l/I8KMiyS2hFUNPDA+qK81hYCodslqUqpAFmZNBCfsuqYl9G8waRIqrf18PH34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716978338; c=relaxed/simple;
	bh=SJgPxzW+ye623D56MnKT954zU3/AEUcumWGhgvefzLI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lBQoHjcpPE1NG2TabPQC7Dkmh/zGAu76tnnbPFuN+ZZwCh6VazE791uYwBV6HOSfXPwDRhfG8Tk4p27RSV3NpWtpC4ycSmQ0tJ8LpdKA4idnSiFM6/2YAapkny0e3bnHKpheM76AUSXaLk3XAYxhwH81EZWmZ3feLItnGuj1gxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=frSazT9I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="frSazT9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716978335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SJgPxzW+ye623D56MnKT954zU3/AEUcumWGhgvefzLI=;
	b=frSazT9IObZnPjwyJKfrXoK6G7GJjRz6tLW3GDRBy6coVLWFAOyDXPQYHFkxKBdEzBDTrl
	iqHqMUlU9ZH50QEZbx72RyLnjmnN+r9hOa8V7rZjonA7wM62cEbpH7VOEHzZgDFIvVA24J
	ntpvAkmWoBhGJeJr3WuEtW6xm6KUnsg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-mf8TGUZCMyq3kCOaJjPAlA-1; Wed, 29 May 2024 06:25:31 -0400
X-MC-Unique: mf8TGUZCMyq3kCOaJjPAlA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4211239ed3dso2607505e9.1
        for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 03:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716978330; x=1717583130;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJgPxzW+ye623D56MnKT954zU3/AEUcumWGhgvefzLI=;
        b=X6Ir2MV4Bm7j8sxLU43bWwoSCbAqWxy5JnNK/V07YdwxOeUjdFG15VCx7q0Ohr95W4
         suh7OhpIYYhflIy9v0+lA5bFA0sHDDXuBDiFinMF/OKS8YyhwaDkCDLSXXaRNkyw5s+T
         sul7S/4+G6NtQVqKrKkXDdPh4npKkiKVHYCcsacznhpCckZYoBB6KzQxtOvmK5AHf4rN
         ibk/HncWh/dbReyHSSk9djDbqUfQFbW64gig7tyDpBRiBurW39S5f1JmB2LesibfsNEE
         GOHtwMSrHomofexdp7vF3fW6okAckJnpdxwb3jimdsWEq8XmLeR8akn3wgycmuorCbRF
         c+bg==
X-Gm-Message-State: AOJu0Yxr1fd9uZmENgc/cIySjNhRqXXFiPTy7LMQAsI2fWVBi2cv/Wnx
	oAItE+nc19c0hwPGgUyjEW5O17hPUHkquIeKRL4YY1+HRhsKX9uX/TzN6iY1A25ieirDeDfbRbo
	OkiYrL6Cia6YIswKAiDIRIEOWV8Pw7e7wQDXH1DekJ4yCNXqD0lIJIXcz7eX2zxlw
X-Received: by 2002:a5d:6552:0:b0:359:79f1:bab4 with SMTP id ffacd0b85a97d-35979f1bae2mr4843889f8f.3.1716978330384;
        Wed, 29 May 2024 03:25:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvogax9/XdGKVKQlI4dSg0GS2lgdrIb45Ne9A68BATWRPH/pF1mFmxcD1jP1KPLjz/NANOvA==
X-Received: by 2002:a5d:6552:0:b0:359:79f1:bab4 with SMTP id ffacd0b85a97d-35979f1bae2mr4843872f8f.3.1716978329926;
        Wed, 29 May 2024 03:25:29 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b094:ab10::f71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579d7db5esm14611870f8f.15.2024.05.29.03.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 03:25:29 -0700 (PDT)
Message-ID: <d7b1cf767c56cae57a5c8c10b6be8aaae9f9ce05.camel@redhat.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, Eelco
 Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 29 May 2024 12:25:28 +0200
In-Reply-To: <CACGkMEt+9oFwVbwnjB_EDB0iS880uza1hxo3m0EKmE06_1usjQ@mail.gmail.com>
References: <cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com>
	 <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com>
	 <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com>
	 <a630f422b86ea4dd96418a84b5eea196fc98f326.camel@redhat.com>
	 <CACGkMEsuhCoBe=dXTroTunjX98BUVo-EyyE3HRhzL0D4gC-qXw@mail.gmail.com>
	 <387c70eab4f9984938e721aee18b64080bb5e55e.camel@redhat.com>
	 <CACGkMEt+9oFwVbwnjB_EDB0iS880uza1hxo3m0EKmE06_1usjQ@mail.gmail.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2024-05-29 at 08:30 +0800, Jason Wang wrote:
> On Wed, May 29, 2024 at 1:47=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> w=
rote:
> >=20
> > On Tue, 2024-05-28 at 10:57 +0800, Jason Wang wrote:
> > > On Mon, May 27, 2024 at 4:06=E2=80=AFPM Paolo Abeni <pabeni@redhat.co=
m> wrote:
> > > > On Mon, 2024-05-27 at 11:26 +0800, Jason Wang wrote:
> > > > > I meant, virtio is not necessarily for a software implementation.
> > > > > Various hardware vendors started to implement it as well.
> > > >=20
> > > > Note that the above links refers to an HW offload implementation fo=
r
> > > > TCP over UDP tunnel TSO support.
> > > >=20
> > > > > I wonder if hardware is as flexible as Linux to support general U=
DP
> > > > > tunnel offload.
> > > >=20
> > > > I don't have additional information WRT HW specific limitations.
> > > >=20
> > > > Perhaps the vendors (nvidia? intel? who else?) could chime here to
> > > > specify such limitation if any.
> > > >=20
> > > > How is that kind of scenario managed with plain TCP TSO for virtio?
> > >=20
> > > It's a problem indeed which needs to be addressed (and it is required
> > > for big TCP).
> > >=20
> > > > e.g. let's suppose that some virtio H/W only supports a limited num=
ber
> > > > of segments per TSO packet.
> > >=20
> > > A similar problem like this:
> > >=20
> > > https://lore.kernel.org/lkml/20240411051124.386817-1-yuri.benditovich=
@daynix.com/T/
> >=20
> > This is actually for the "reverse" problem, right?
>=20
> Not sure but I think the context is all about migration compatibility.
>=20
> > I think we can have
> > HW induced migration issues only if the H/W introduces some unexpected
> > constraints in the VM -> Host direction.
>=20
> Yes, it's kind of similar. For example, destination is not as capable
> as the source:
>=20
> 1) dst's max gso segs is less than the source
> 2) dst's UDP tunnel offloading is not as "rich" as the source
> (something similar to the UFO removal issue in the past).
>=20
> >=20
> > Restricting the problem to the tunnel part of GSO/TSO over UDP tunnel,
> > The only variables there are:
> > - the tunnel header size
> > - the outer header destination port number.
> > - the inner mac header type
> >=20
> > I think the easiest thing is requiring that HW implementation for
> > virtio net supporting GSO over UDP tunnel must support:
> > - a 'reasonable' arbitrary maximum tunnel header - say 128.
> > - any outer UDP header destination port number
> > - ethernet inner mac header
> >=20
> > If the above proves to be too restrictive, we could later extend the
> > specification to fine grain negotiate the mentioned parameters, and
> > prevent migration on Hosts with too restrictive capabilities. I think
> > that designing that now (even before such negotiation for plain TCP
> > TSO) would be too early.
> >=20
> > WDYT?
>=20
> It should be fine. A question here, does the kernel have checks for
> the above? (e.g max tunnel header size)

At least a driver (ice) has a check for that in its ndo_feature_check:

https://elixir.bootlin.com/linux/v6.10-rc1/source/drivers/net/ethernet/inte=
l/ice/ice_main.c#L9556

The tunnel size limit is 32, and the callback additionally ensures that
the tunnel header len is not odd.

Note that in such ndo there are more constraints related to plain TCP
TSO - e.g. maximum IP header len <=3D 508 for both the inner and outer
header (no idea how that could be respected in practice).

Do you have other comments or can I go for v5 including the mentioned
constraints on the tunnel header layout?

Thanks,

Paolo

