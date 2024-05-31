Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6847483
	for <virtio-comment@lists.linux.dev>; Fri, 31 May 2024 15:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717168435; cv=none; b=ORiUbNzRZFO6ZI9fOtnbCU63hptjcu2JjaiU8J5csr5JHrlEYYkPoqrg2593LEeK4OML0V/GhW1v12dM/Uax1RI41lt/+FCU719q/+a8bYjXHy3aW1S6MAcRC/LC0Dr2llb2j0hGqWO3cKtRa7GCwRsajADUPc9/SdFUcCa0DcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717168435; c=relaxed/simple;
	bh=2rb5AsLOAIOzb5v0NJ3t76VyaCuLmFTJ9Hyrcr836oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YW578pF0kbSVUZM9+rAj4dawy6wl0QEx4Ywi73o9bFtgT4Ga10L8ljDz8MqBINnp6TsiCcuEkUqYVv3sS8/CvaAjH5hxFolH2vdu/BOR0QCMNRRiBCIU5nWB33IBEP/BT38YhrPuRYaMCmRYpCEqZP7WV5XnzCIUovhAj+vmItU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ArkozSPx; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ArkozSPx"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-43fe3289fc5so346751cf.1
        for <virtio-comment@lists.linux.dev>; Fri, 31 May 2024 08:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717168433; x=1717773233; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rb5AsLOAIOzb5v0NJ3t76VyaCuLmFTJ9Hyrcr836oc=;
        b=ArkozSPx7ZtYME53b56YAIQuAI0t/T2R8nNXJ2l1uX5fS0Rk6nEKIOg9oi9MtTzWRT
         iXzrY/WpfUpareldjG2eqBxOyM9Fzev53kQ1DQMckrdZ9183rPgLJF7r5PQEhEzFtIdm
         uxOyUR3OlB8KL9uXuFZkEuJeRLwKMhtauI6WXWMe0yvqr9M1hgwaTZll1cuEvdNF7dq4
         +UOsywARb576F+IZAkMf3xlsXTA+bAQ7iHDXJEPDNCL6rOB2eUmGzkCWSLDUcEH1xPV9
         SkO0vVvVj5E73+xhlfv4L1zQU/50e6woSns7bpZ+8uBkpZ2CyM/eq0BrWsAV46Td4HF2
         RYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717168433; x=1717773233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rb5AsLOAIOzb5v0NJ3t76VyaCuLmFTJ9Hyrcr836oc=;
        b=rkxwFUXOs7rBIVTeRRUKJekBp22qo81NC+smZSk0HgvjlLo1P0ZniM6/JDW2k2G3tC
         Za7gUvw9cKRs1Vl8GEWYwxtP6aQAgvhtvaZk4aBx2zQpBM3dehVE3Q+ak+qmPIdNBKKy
         hB8qWyy/U9QiP60vPzhDU/OgoBjfwgv3agux3QZcvhmIK5pNYWsXSTEt0SQ0FXZ6UzPK
         ebABncwevEWnjKOUcRa7U5Oi/ikfx+y4/40IP+U/dCzPCB0VTUWdm6QpiSF4nRqKnVBc
         wMCIe9mi3ttDh9/FDi0+UCYS4KKAUS+VQGf7xFND0XaKNt7gLmbS05fG3l24M8btlhrG
         Hnew==
X-Forwarded-Encrypted: i=1; AJvYcCUbaob7dAKFFqxeafjK8dPebvfIvfIQloxGT5cww8ZJhgvdCCYMa1EM4mXd8fsnAMP4b4p9xAYSBsfwu+DiJyfX4dxaL1IL8N+JMS8n+V4=
X-Gm-Message-State: AOJu0YwIjJzK4MYb1J1HRxz8cOMLKSj0tLs2ls0cv6H2BS50Fk9pKEuH
	x+fiXivzjUir9q7wnu7jS+Khf0mloVxe7LnmaeXQHmMb054UlHPfpRSfTtXXNxhTSnTJLnJPZrF
	dFU7UN6bJEEc9BNSflF0wOkasLiUaucNLMmLQ1KCAX5M4iajZMQ==
X-Google-Smtp-Source: AGHT+IFLegWVFXbDl8jraNq16r3bbym9pyP4FpZMjfRr5j2Ja+uKCq/mQYKeNem2ktJm4byIfIxUGBve3TYY+HKlsYo=
X-Received: by 2002:a05:622a:1c10:b0:43a:aa3f:917a with SMTP id
 d75a77b69052e-43ff4fabc2fmr2380411cf.27.1717168432243; Fri, 31 May 2024
 08:13:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com>
 <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com>
 <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com>
 <CA+FuTSfCm-GpLHYztQCxti2adCcFPV7GyKBH1zTDB8tM2w1NNg@mail.gmail.com>
 <794dd45767bf54385613c5d18c32ee11d474db87.camel@redhat.com>
 <CA+FuTSeDqrQ3FVjpmmQ31UbyGQA-fUsYz3=NmizC1U7Q8w6E3Q@mail.gmail.com> <4745e6a149bb8424ab3931ecf04ee941e6830c47.camel@redhat.com>
In-Reply-To: <4745e6a149bb8424ab3931ecf04ee941e6830c47.camel@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Fri, 31 May 2024 11:13:13 -0400
Message-ID: <CA+FuTSfcte_aXYoog9=bQqH1v21xLk+G2V9zNo9KOwXCt8x2Tw@mail.gmail.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 1:15=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On Thu, 2024-05-30 at 12:23 -0400, Willem de Bruijn wrote:
> > > > > > > inner transport header offset from the provided information, =
as it's
> > > > > > > currently the case for plain (not UDP tunneled) GSO packets.
> > > > > > >
> > > > > > > The outer UDP header may carry a second checksum, which can b=
e offloaded
> > > > > > > independently from the inner one. Since UDP tunnel checksum o=
ffload
> > > >
> > > > Just require local checksum offload? Computing the outer checksum i=
s
> > > > always cheap. Optional double checksum offload might add complexity
> > > > that is not needed, as it is so cheap.
> > >
> > > The rationale behind the making the outer csum offload manadatory was
> > > to keep the specification change simple and prevent the exhaustion of
> > > the virtio_net_hdr flags and gso_type exhaustion. With this change,
> > > 'flags' has 4 bits used out of 8 and will raise to 5. 'gso_type' has =
3
> > > 5 bits used and will raise to 6 (even if only 3 of them will be
> > > bitfields).
> >
> > Perhaps we're talking about something different. I'm suggesting that
> > the outer checksum is not offloaded at all, because outer checksum
> > generation and validation is always cheap in software. This is the
> > premise of LCO.
>
> If the guess produces GSO packets with outer checksum, and the virtio
> driver does not support the outer csum offload, the guest will have to
> do s/w segmentation. Even if computing the outer csum will be cheap,
> the segmentation will be bad enough by itself.
>
> Am I missing something?

Do you mean virtio driver (in the guest) or device (in the host)?

All segmentation offload packets imply checksum offload. So the
virtual device must support checksum offload. In this case, of both
checksum fields.

Unless from the start we incorporate partial GSO, and expect the
guest to prepare the outer packet as they have to be for the individual
segments. Then it could also compute the outer checksum in software
using LCO.

I encourage physical hardware vendors to only implement offload for
a single checksum, based on explicit csum_start/csum_off passed by
the host.

Because multiple checksum generally are implemented using packet
parsing, which requires protocol knowledge and thus is fragile.

I suppose you could define a virtio_net_hdr with an extra
outer_csum_start/outer_csum_off. With software segmentation, this
can still apply LCO cheaply.

Is there physical hardware that supports tunnel TSO with multiple
explicit outer_csum_start + inner_csum_start instructions?

>
> > > The complexity problem is only relevant for h/w implementation, right=
?
> > > Is really such a problem for modern H/W?
> >
> > I'm concerned more about the virtio_net_hdr struct and minimizing
> > the combinatorial explosion of allowed flags.
> >
> > We've had a lot of issues in the past with the Linux implementation,
> > in part because we allow combinations of fields that have no practical
> > use, but let syzbot go nuts. And then we have to patch up the data
> > path with branches that slow down the actual practical cases.
>
> I understand.
>
> I don't have any usage data handy to tell which is the most frequent
> use-case.
>
> To me, the relevant use-case is openshift inside a VM, which *should*
> carry a csum in the outer header (but I have to double check).
>
> > > > Can you reconsider the choice to only allow UDP encap that includes=
 an
> > > > inner MAC header?
> > > >
> > > > There are useful UDP based tunnels that skip that, such as GUE. Vir=
tio
> > > > revisions are a long process. If we can accommodate those in the
> > > > design from the start, that saves us much work later. Or, at minimu=
m
> > > > make sure that the proposed design can easily be extended to such
> > > > protocols.
> > >
> > > I'm surprised about interest in GUE: for years I wondered about
> > > deprecating and removing it (together with FOU).
> >
> > We use it extensively. In fairness, maybe as a result of my choosing
> > this protocol when we needed a (UDP based) tunnel protocol with
> > custom internal headers. FOU and GUE are well suited to that.
>
> What about geneve?

Good point. That also appears to support IP in UDP without inner mac.
So I suppose that could have worked for our use case as well. Another
example is the Linux bare udp driver. In all, plenty of examples.

> > > Yes, I think the ethernet-only constraint could be removed, but I fea=
r
> > > that will pose some difficulties for H/W implementation - requiring
> > > extra flexibility - and possibly some additional features negotiation
> > > should be needed.
> > >
> > > I think that the struct layout can already cope with GUE or the like.
> >
> > Great.
> >
> > To be clear, I don't mean to ask for all back-ends to offer support for
> > all these. But that the layout supports it.
> >
> > I suppose if we want conditional support, then that would require
> > extra flags on negotiation. E.g., a separate
> > VIRTIO_NET_HDR_GSO_UDP_L4_TUNNEL type.
>
> I think it should suffice negotiating an additional feature, say
>
> VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_L3
>
> as the s/w packet processing should not change in any way.
>
> I propose the 'ethernet only' restriction because AFAICS some existing
> H/W implementing offload for TSO over UDP tunnel has that kind of
> restriction and Jason suggested to be 'polite' towards H/W
> implementation.

Makes sense to consider them separate features then.
