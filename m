Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E286219FD
	for <virtio-comment@lists.linux.dev>; Thu, 30 May 2024 17:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717089319; cv=none; b=KTib3XtS4thi5yigAj7EvzVI+tf9UzNcw5djUV7VGUTzxMgl8L9qUae0llBx2NdzuzECMw81OMN7f2aU1BOACJY9fEuSbrjFWaV4V33XbexKmSoRaPD9w2r//F+wdsacxBJaFBSlUjKRSnOdEZxhIN8uIVUCOWDux3lKG+twDAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717089319; c=relaxed/simple;
	bh=NgbZUQK4ZENrJOtsWDOQaA58ldkM494PpsHUGfKwako=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T3jbdec7vXj7h1NnT8r6AJqTGSe2vbkEZ4Ag1a2AJKanfRcWh5akEVxeNGsXZ2/IotF3auoC/P8qxt22hq+Ld9fekIjCbPg017UFSo0rHrgmeR9IgCubmZESD8jMxiUIl+LOaFHptIYZVflwTen+HkE3vl2DupYFyUFziGdWtXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i4zeZcr6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i4zeZcr6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717089317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NgbZUQK4ZENrJOtsWDOQaA58ldkM494PpsHUGfKwako=;
	b=i4zeZcr6BbZqDaDVPV69NZNLiY14VoVUE/skFCEbOZKu2ZxZ4GfJKam4Az4aGDwuf1Lcs8
	RRgPZoRRf0Pf2SSMUzK/gYFeDvDfLe0qxSVAEcC4rMhNlT0CZUEA/z5PCAvdFKYaWo57tL
	0j3/HwVp54YqLfKkx8WajQSpo5NBRUs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-Yl2Y8C7SPsuUdUksNOO43w-1; Thu, 30 May 2024 13:15:14 -0400
X-MC-Unique: Yl2Y8C7SPsuUdUksNOO43w-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-35dbd381d56so140172f8f.2
        for <virtio-comment@lists.linux.dev>; Thu, 30 May 2024 10:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717089313; x=1717694113;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NgbZUQK4ZENrJOtsWDOQaA58ldkM494PpsHUGfKwako=;
        b=X8VT8LGzezr17Ik5Q7dg5Jypxqh1HfghB/fuXNBgrarS82NRGSeOXpg/rkSxRsbZFw
         ADauGelvw7BXxVdGGRhwogm2wppvKKvHnMEp3AgONuAqFLqmpnQcbu0XUUUsPSsRKnxu
         dfr+0SvMaPzutPRRMhULrzLlaIy4MSJtOo2iLZFiJzyomD1yGAMQyNW8GPIfDztwjjjF
         02cDVGHQo+eFkfh/MogZZ/AilMKcE98LSbEoSoJhKPYj7mzCMRRWaXW0a3qF6at/sGa0
         NV6alqi8cS8A3hIj6E/3OOM1wfTgzyxb0wr1ywGz9HZCNLT31ceKahZLj+dmcJUQg6jR
         ZhNA==
X-Forwarded-Encrypted: i=1; AJvYcCXhgigzsPu4dcWo57wWJXJsu95xTT6QEMakB/j1IpcjdIHFWsJw6uwej98WbMKLICk74MkNKBb1MY9SfrQoWmxx89FVH/RXt28WDpcebcQ=
X-Gm-Message-State: AOJu0YwIN5JML8kTpkAMWzKebYvuQlVqzdx8Eseg+ZvZ8MHY9BtKHUMI
	ErPvB+D1aHYXGbxppK4yQJWpo7gKU1TitouRvF0PXifaOVwRUJ0T5FokNAB3MVxFhO7b5SE36XI
	SPwcdzNeHFvAIdMu4ubzYOzf3LJ1SBlVTqJ33qdkpjRDq3NDyMn+wgHN/S2LOc3j1
X-Received: by 2002:a5d:4103:0:b0:354:fa0d:1421 with SMTP id ffacd0b85a97d-35dc009854bmr1916469f8f.1.1717089313161;
        Thu, 30 May 2024 10:15:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm2PzoCZ9xHlf4vvCY8I52CfBss/OYw/oEe8rYi031+Uzw6wpfnPXz9l/1gT/ikXzrGPGahw==
X-Received: by 2002:a5d:4103:0:b0:354:fa0d:1421 with SMTP id ffacd0b85a97d-35dc009854bmr1916452f8f.1.1717089312703;
        Thu, 30 May 2024 10:15:12 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b094:ab10::f71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04da182sm8951f8f.54.2024.05.30.10.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:15:12 -0700 (PDT)
Message-ID: <4745e6a149bb8424ab3931ecf04ee941e6830c47.camel@redhat.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: Willem de Bruijn <willemb@google.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, Stefano
	Garzarella <sgarzare@redhat.com>
Date: Thu, 30 May 2024 19:15:10 +0200
In-Reply-To: <CA+FuTSeDqrQ3FVjpmmQ31UbyGQA-fUsYz3=NmizC1U7Q8w6E3Q@mail.gmail.com>
References: <cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com>
	 <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com>
	 <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com>
	 <CA+FuTSfCm-GpLHYztQCxti2adCcFPV7GyKBH1zTDB8tM2w1NNg@mail.gmail.com>
	 <794dd45767bf54385613c5d18c32ee11d474db87.camel@redhat.com>
	 <CA+FuTSeDqrQ3FVjpmmQ31UbyGQA-fUsYz3=NmizC1U7Q8w6E3Q@mail.gmail.com>
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

On Thu, 2024-05-30 at 12:23 -0400, Willem de Bruijn wrote:
> > > > > > inner transport header offset from the provided information, as=
 it's
> > > > > > currently the case for plain (not UDP tunneled) GSO packets.
> > > > > >=20
> > > > > > The outer UDP header may carry a second checksum, which can be =
offloaded
> > > > > > independently from the inner one. Since UDP tunnel checksum off=
load
> > >=20
> > > Just require local checksum offload? Computing the outer checksum is
> > > always cheap. Optional double checksum offload might add complexity
> > > that is not needed, as it is so cheap.
> >=20
> > The rationale behind the making the outer csum offload manadatory was
> > to keep the specification change simple and prevent the exhaustion of
> > the virtio_net_hdr flags and gso_type exhaustion. With this change,
> > 'flags' has 4 bits used out of 8 and will raise to 5. 'gso_type' has 3
> > 5 bits used and will raise to 6 (even if only 3 of them will be
> > bitfields).
>=20
> Perhaps we're talking about something different. I'm suggesting that
> the outer checksum is not offloaded at all, because outer checksum
> generation and validation is always cheap in software. This is the
> premise of LCO.

If the guess produces GSO packets with outer checksum, and the virtio
driver does not support the outer csum offload, the guest will have to
do s/w segmentation. Even if computing the outer csum will be cheap,
the segmentation will be bad enough by itself.

Am I missing something?

> > The complexity problem is only relevant for h/w implementation, right?
> > Is really such a problem for modern H/W?
>=20
> I'm concerned more about the virtio_net_hdr struct and minimizing
> the combinatorial explosion of allowed flags.
>=20
> We've had a lot of issues in the past with the Linux implementation,
> in part because we allow combinations of fields that have no practical
> use, but let syzbot go nuts. And then we have to patch up the data
> path with branches that slow down the actual practical cases.

I understand.

I don't have any usage data handy to tell which is the most frequent
use-case.

To me, the relevant use-case is openshift inside a VM, which *should*
carry a csum in the outer header (but I have to double check).

> > > Can you reconsider the choice to only allow UDP encap that includes a=
n
> > > inner MAC header?
> > >=20
> > > There are useful UDP based tunnels that skip that, such as GUE. Virti=
o
> > > revisions are a long process. If we can accommodate those in the
> > > design from the start, that saves us much work later. Or, at minimum
> > > make sure that the proposed design can easily be extended to such
> > > protocols.
> >=20
> > I'm surprised about interest in GUE: for years I wondered about
> > deprecating and removing it (together with FOU).
>=20
> We use it extensively. In fairness, maybe as a result of my choosing
> this protocol when we needed a (UDP based) tunnel protocol with
> custom internal headers. FOU and GUE are well suited to that.

What about geneve?

> > Yes, I think the ethernet-only constraint could be removed, but I fear
> > that will pose some difficulties for H/W implementation - requiring
> > extra flexibility - and possibly some additional features negotiation
> > should be needed.
> >=20
> > I think that the struct layout can already cope with GUE or the like.
>=20
> Great.
>=20
> To be clear, I don't mean to ask for all back-ends to offer support for
> all these. But that the layout supports it.
>=20
> I suppose if we want conditional support, then that would require
> extra flags on negotiation. E.g., a separate
> VIRTIO_NET_HDR_GSO_UDP_L4_TUNNEL type.

I think it should suffice negotiating an additional feature, say

VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_L3

as the s/w packet processing should not change in any way.

I propose the 'ethernet only' restriction because AFAICS some existing
H/W implementing offload for TSO over UDP tunnel has that kind of
restriction and Jason suggested to be 'polite' towards H/W
implementation.

Thanks,

Paolo

