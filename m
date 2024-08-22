Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5E41CBEA6
	for <virtio-comment@lists.linux.dev>; Thu, 22 Aug 2024 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724337070; cv=none; b=rePF5+oJU1TN8f67fHr1Vx3mKP7w0Pd+piX84T9X0dWzIpihkFG9sAZcFtBXxicr50+b2yM/E35WGeUXgoMEbJ156Kcm2PYEOShMExxGLHve0nmMh2WuGJRVW0T8f/hws4CtQNS5Usl0HgKX1Q3sRzkqB2FsBwRERJzMYzicGyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724337070; c=relaxed/simple;
	bh=4/X/oKERMAUJO7VukRx54I7q+JmOL3RTVsZnEMV0GBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5nJ/RhLvBRumALtZRf/0bwKhaC43JEJ4OvYKYyw4x3yIQx/gPvmJi4XoWs8wkcQywtEIrKKz/xZv2wjzjPRUfwOvVRmEyJK2vExrW09vKcdRazu5175du8RKFvY9/sXaF5xrHFgDmEakQRRn/dWrJkxZbONdZJFw4algnTwhXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jirey+Cm; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jirey+Cm"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e13c23dbabdso852230276.3
        for <virtio-comment@lists.linux.dev>; Thu, 22 Aug 2024 07:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724337067; x=1724941867; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARW0rWaYEyDorwaojdskzYfUIzdhIASFJ/jzQP1vlj0=;
        b=jirey+CmBxzFQbBRP4GajKVisojhSKKJeXLj1ZCDyg/aBFu8Dd+2stkLUNw+F75xaK
         sCp+LUxfSUGny8ebZeNGdIB3XEA/EDWm9v682ulcHEmPgWDJh2aKeFiXe3CfxltPEcNR
         grBiFvk3hqAnHnW6hgSiv5ShxKTjNc6SRoEEOMqrGgetlSRLOITUs9mZeJRi38As7JFs
         hi9bPqzv4sp1L9eK3tw+ehoDrMxXuDbzrWjOKxlSCSvuVzSq/bZU/Vz/BNcYoenFq8l0
         emML/yxDkqnty8BnBE2LR8etj85DGXO5Gy8OS06FZ+TYVma1Sr9r2hb1RAF+fQYqkaVa
         Meow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724337067; x=1724941867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARW0rWaYEyDorwaojdskzYfUIzdhIASFJ/jzQP1vlj0=;
        b=EH4A1vPBvFDpcPf/V2rWaCwamL6I2I6PxkF6DdRxJVtW68ueGL3UA0I9Zi1NiVAM4k
         +8aOUTCEKK4f7oew70ENRhcwMLIQG5FTF7ns0V39xScvC1Xwub8a3Xpt9vcEa1b5yDis
         7nL4RVmwZDRgQPjAZjxMTuTbrjTRJYI72TyCqeoGCDSqu2t4m6NGMwoh6n7qsTeQSMD+
         GH/lkpBf9xzvwUFEcI4GtnFppSOaZNowk0preNj51yNThcZDkZphfbib3Bc9hf8jFcad
         rVWWIKzs5rZL1foYgT07WlJ+nVr2FthGNIyR/EUr76dMZWy9lEsLOhjaDtjpgySFDsp5
         89vQ==
X-Gm-Message-State: AOJu0Yzq3mrJGHeyNrSCHMbzYourrALlk44VFveQV7pELyVCOCnAGnV1
	5mQoyot1PjoyPQaaxCJ0OcfwoHB2JUI4BrmeB/ZOcsFA5/AGp5PnqXMCKB1OSKzG1A28GqMBbYL
	3RB3KAECWzTy56T/iqW/tpvC2PSBekqZ1GVyS
X-Google-Smtp-Source: AGHT+IEPpF7RdXWFFAqhFy6pbQCOtQ+loovRoUyT0aS1VuPMWLwX28NE1K5zQdu3dwap88k3XVjjL0uIatnrN9b4Fr4=
X-Received: by 2002:a05:690c:d85:b0:6af:8f7a:28d0 with SMTP id
 00721157ae682-6c3d149f34dmr25685747b3.2.1724337067168; Thu, 22 Aug 2024
 07:31:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1724234131.git.pabeni@redhat.com> <04089a87ff34aa518345ba5b50aecf737fb03f40.1724234131.git.pabeni@redhat.com>
 <CA+FuTScjheR1htWujZ5=adBRB3+_z5KrCyHKoRGVapGq-MGtJQ@mail.gmail.com>
 <CA+FuTSd5PW6D0iSDSYjh3S6OpGCL1Lf95q_=eOfi=APXoBZyOg@mail.gmail.com> <fec4d009-df32-40f4-9741-88a267e430e2@redhat.com>
In-Reply-To: <fec4d009-df32-40f4-9741-88a267e430e2@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Thu, 22 Aug 2024 10:30:30 -0400
Message-ID: <CA+FuTSf_c5PWOQi-hZYpEb9GRhTWLV_Ep7KtgSHnLEYW2WCDdw@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 10:25=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
>
>
> On 8/21/24 21:48, Willem de Bruijn wrote:
> >>> +Geneve UDP tunnel (again IPv4) with no tunnel options. Note that the
> >>> +only relevant variable related to the tunnel type is the tunnel head=
er length.
> >>> +The packet will have a 14 byte outer ethernet header, 20 byte outer =
IP header
> >>> +followed by the 8 byte UDP header (with a 0 checksum value), 8 byte =
Geneve header,
> >>> +14 byte inner ethernet header, 20 byte inner IP header
> >>> +and the TCP header (with the TCP checksum field 16 bytes
> >>> +into that header). \field{csum_start} will be 14+20+8+8+14+20 =3D 84=
 (the TCP
> >>> +checksum includes the header), \field{csum_offset} will be 16.
> >>
> >> The csum_offset field is not even needed in virtio_net_hdr if gso is
> >> enabled, as then the gso type already defines the protocol.
> >
> > We recently started testing this invariant in the Linux code. We have
> > learned the hard way to not trust userspace processes to set up any
> > fields correctly.
> >
> > For the new fields, we should from the start think of such invariants
> > that can detect bad input. For instance,
> >
> >      outer_th_offset < inner_nh_offset
> >      inner_nh_offset < csum_start
> >      csum_start < pkt_len
> >
> > Maybe even more stringent invariant checks are possible. The only
> > ones that truly matter are the ones that can affect device side
> > correctness (such as host kernel crashes).
>
> FTR, I intend to implement something alike:
>
>         outer_th_offset >=3D 14 + base outer network hdr size
>         outer_th_offset + 8 <=3D inner_nh_offset
>         inner_nh_offset + base inner network hdr size  <=3D csum_start
>         csum_start <=3D pkt_len - base inner transport hdr size
>
> where base inner/outer network hdr size is 20 or 40 depending on ipv4 vs
> ipv6 and base inner transport hdr size is 8 or 20 debending on udp vs tcp=
.

Great! Thanks Paolo.

We learned the hard way that we need to sanitize these inputs. Good to
see that included from the start for new fields.

> > Not sure that we have to call them out in the spec, but perhaps
> > helpful too. Either way, good to think about possible attacks on
> > the new interface even before coding, before the spec is complete.
>
> AFIACS the current spec currently does not describe validation for the
> existing fields subject to such issues (e.g. csum_start/csum_offset). I
> think it could be added in a second moment, if needed.

Either way. It may be helpful for other implementers of the spec. If
not too much work to add.
