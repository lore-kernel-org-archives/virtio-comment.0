Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F0E21A4B8
	for <virtio-comment@lists.linux.dev>; Fri, 25 Oct 2024 15:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729871282; cv=none; b=WGJ0eeRADH8OxQSvh1dcgVoyfTNQlfz6ldvwGq740SlbgNcTmS+ocBZXUrPBI2GZ0A9tenP5yq/s7mSwLE8XX0t0OVt+EaEWoIVz/5w5Tey8kM8R5nqDxscK0xCwsdpAgse4T8BgkthqWdEEy6LxVuPHjqDub9oPI2+5vp5P5aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729871282; c=relaxed/simple;
	bh=o5DWDN+slGDo0RdJAD+ioSgHQzyy2UhaAT6/A5ic3Mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/GOv4wncFMiDxG5OL1GxbzD2YTv9NCb2HpXkuNAIXr88c8xKUZTTeLvTIo7xcwU0QbbCa4sGvJ5jj+rqCFdSHqo82RTZk9rdp/KvrtBdbm/RVWegJJ09zuzQ6DLOhLtEfr4Fq4LNnhCgwYIRm03e1BAsBQxlmeF7xDUH6VmqwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XWDtBb5Z; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XWDtBb5Z"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e29687f4cc6so2431201276.2
        for <virtio-comment@lists.linux.dev>; Fri, 25 Oct 2024 08:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729871280; x=1730476080; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xZOfQyzI8QaDHKPhtSbNqp3IOlgbpILHcEhxCQdMwE=;
        b=XWDtBb5ZciqMwEZlg6Y7zSeHyn6BXXguClFI7kyytqg/e1rFj9MMP01OW6wBOgfbuq
         lp2D3KjHg1QmX4Qjbv3tYRRqrUaCgFqQ/hHFELzrlI1DHGzERlnVrJMBwfNsHt5swyEe
         UUYVrYX6b2IacYpecyLZ+uiUMBGi54RB4CWYkDk8HZNvCVJtlSYzqt7XcZSpnPVaz/vk
         705r3njP2gu21R8hA8h4SUo6NHCaNjTVANsPvmLg8ctS7tmpUzM9jN8nhDPjuE13G/WT
         oMvYBH/b4rM/n3u//DI5nf2GE6LrmVWTelibVaI8As6DaU6lnkQE7eDdx+aYXtBrd4Bd
         L0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729871280; x=1730476080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xZOfQyzI8QaDHKPhtSbNqp3IOlgbpILHcEhxCQdMwE=;
        b=W3khz8Sjcc4jkRIlZiLl/m+olGv+ZexwMeoseBzwPTzg9bbJJjKSOu8boPuuPCbkGk
         hAMRPD60jrSX1lqWw3HdMZd/eXQJkMqdWDAGvGQV0l7B5cAfD5cr/N9VSMDc+G+L5wES
         9df0eCvN6yb2U1EeWOc+NQ7O5Pdg2p3r1Z6MhrOj11Bmv6VioGmdz7h9EiIeFSaJ/qo+
         +lTu//1nhQGlAEn5cr8ksl0H+jNYO9tcgWYxzrm3pKqj5IEcpBoIK4lC+YE9rxjAT1Vr
         Ux3pxV0uF24SyHOeNth7F0WRUL3lHZtS1vwHEvMQKO+mhfHVqzVjVezj5qVAguVdEXtq
         zN4A==
X-Forwarded-Encrypted: i=1; AJvYcCW0sUR9A9rCECkR/ydydgJw9WXNbO1ohsChBL+03esbYuCCZ0YD2iuTcLeH1mpqn2jaJFKE/l2wqxcpkT9a6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6D10Pz21L4Wz6Es7AUP1vG54sNNodR8g5i+o0Mivl/A4BJC4C
	Du67UZhjoA+viu17g8edXxy9BJ28y4ershzL209P8VkbAFwo7NXdYF31gDXPl4CHw0ABp3+dNnf
	Y4WLV57wLyxOaZ/PbZLq/2W45t9MJQBX3riQC
X-Google-Smtp-Source: AGHT+IH5nX5ea1y6z7IbVt4aq0M7AzZVLu27aSMat8SIX9LR0TVuCyVwJspvCvUo31Jk7OHlvT8KH2Tp7z2mY45F2NY=
X-Received: by 2002:a05:6902:1182:b0:e29:23f7:ccf8 with SMTP id
 3f1490d57ef6-e2e3a643e2bmr11353574276.14.1729871279448; Fri, 25 Oct 2024
 08:47:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1728029499.git.pabeni@redhat.com> <CACGkMEvrowr6CwF+=RiR+f3EagdKB=rzyCPCQcUdXee4a5MaZA@mail.gmail.com>
 <2b90c368-b514-4077-a6bf-43da075af4fc@redhat.com> <CACGkMEu5GWZrYVRN==F=vrRQQGnxj_WqX86YZ+diqC3s3m2m_A@mail.gmail.com>
 <10bc51b2-efbe-4f33-a1b3-827de4d0cd10@redhat.com> <CACGkMEuhJXMd0hGopyehESO1eNVRXVX+FaF7m8f6Y9yWCzoESA@mail.gmail.com>
 <44be2d9c-5624-4419-8e9c-e5302a5f6b2f@redhat.com> <CACGkMEsgJT1c93RZur20fUyjtxSX6dMPePEJvzbmNWpAHd92Mg@mail.gmail.com>
 <3e3d6984-65d3-46b0-aaa3-e6591123f95a@redhat.com> <CACGkMEsiRJ2zAcys0iFQkiL0h9MY-LOE4=LP7s4ksN=T+HY_Xw@mail.gmail.com>
 <7f40f3da-aa6e-437c-af73-97e44e1982d1@redhat.com> <CACGkMEu-83JEcs73R4Eym2tkcUT5Zsj7i2qOsB-9ivmLNf0b5g@mail.gmail.com>
 <5da197a8-a022-4c2d-a4ae-09e0948e620e@redhat.com> <CACGkMEu-AQea98e5xqj4Vfo4zog_nzeJQ_pLADAOY9ZogsS8AQ@mail.gmail.com>
 <a6ad7c40-d65d-4b95-a7ae-86d77eda4bdf@redhat.com> <CA+FuTScZXfqm+Y=i6MY4QFCwZnoBg4EG4jZktvX9Y5G5FeoRHg@mail.gmail.com>
 <19647957-c747-4a63-8bce-1f381e0faae4@redhat.com>
In-Reply-To: <19647957-c747-4a63-8bce-1f381e0faae4@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Fri, 25 Oct 2024 11:47:20 -0400
Message-ID: <CA+FuTSeS62VsL8eKEtY=9_56sxgJ7_pjsLpc6uXYxnfKy_85ww@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, kshankar@marvell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 10:36=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 10/25/24 15:28, Willem de Bruijn wrote:
> > On Fri, Oct 25, 2024 at 7:50=E2=80=AFAM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >>
> >> On 10/25/24 10:28, Jason Wang wrote:
> >>> On Wed, Oct 23, 2024 at 12:56=E2=80=AFAM Paolo Abeni <pabeni@redhat.c=
om> wrote:
> >>>> I proposed the following:
> >>>>
> >>>> For GSO over UDP tunnel VIRTIO_NET_HDR_F_DATA_VALID is allowed if an=
d
> >>>> only even  VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is set in flags.
> >>>>
> >>>> That means that the device supports csum offload for both the inner =
and
> >>>> the outer and both csums are valid. The corresponding skb will have
> >>>> CHECKSUM_UNNECESSARY and csum_level =3D=3D 1.
> >>>
> >>> Nit: csum_level seems to be Linux specific.
> >>
> >> Note: the above was an informal description of the proposal, not the
> >> actual wording to be used in the spec.
> >>
> >>>> There is actually another point which I'm quite scared to mention
> >>>> because it caused v9 and implicitly all this discussion.
> >>>>
> >>>> I want to prevent the driver receiving from the device GSO over UDP
> >>>> tunnel packets without csum_start/csum_offset, because the header
> >>>> probing code looks fragile and bug-prone and will be even more compl=
ex
> >>>> in case of tunnels.
> >>>
> >>> This needs more thought. For example, it seems not specific to GSO.
> >>> Should we have a new feature for this? (And build a GSO UDP tunnel on
> >>> top?)
> >>
> >> Double checking I read the above correctly.
> >>
> >> Do you mean something alike the following to negotiated another featur=
e
> >> controlling a new bit in flag telling 'the csum_start field is set eve=
n
> >> if NEEDS_CSUM is not set'?
> >>
> >> What about using the flag already defined in patch 2 instead (currentl=
y
> >> named VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM, possibly a different better na=
me
> >> can be used [suggestion more than welcome])?
> >>
> >> The overall schema will be:
> >>
> >> - DATA_VALID retains its current semantic when GSO over UDP features a=
re
> >> not negotiated and when VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is not set
> >>
> >> - when VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is set that means the followin=
g:
> >>   - 2 checksums are offloaded - the 2 outer-most one in case the packe=
t
> >> carries more nested headers.
> >
> > Is this on transmit, receive or both. Can we be very explicit in all ca=
ses?
>
> This is for both device->driver and driver->device directions.
>
> >>   and
> >>   - 'csum_start' points to the innermost offloaded header
> >>
> >> - DATA_VALID can be set together with VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM=
,
> >>   meaning:
> >>   - CHECKSUM_UNNECESSARY with csum_level =3D=3D 1,
> >>   and
> >>   - csum_start -> inner transport offset. If the packet carries many
> >> nested headers csum_start points to the 2nd outermost one.
> >
> > Given LCO, is there ever a compelling reason to support offload of more=
 than the
> > inner checksum?
>
> The end goal here is to support VM doing/receiving tunneled traffic.
>
> With the above proposal device H/W GRO is straight-forward - likely
> existing nics could support hit with some formware update.
>
> Even with devices not supporting H/W GRO, it's beneficial. Currently GRO
> for UDP tunneled CHECKSUM_UNNECESSARY traffic requires csum_level =3D=3D =
1
> (or zero outer csum). This allows the VM to perform GRO for UDP tunneled
> traffic out of the virtio_net device.

I see, so this is derived from a constraint in the current Linux GRO code.

> I guess the relevant GRO code could be refactored to lift the mentioned
> requirement and instead leveraging LCO, but we will need to look at the
> inner header before tacking the decision of attempting the aggregation.
> Without any code written yet (here), such refactor looks weird/the
> current implementation feels preferable and simpler.
>
> > And iff there is, can csum_start imply the innermost offloaded header, =
such
> > that all checksums preceding it have been verified, rather than hardcod=
ing
> > this as exactly 2?
>
> Uhm... I guess it could be doable with an additional field (carrying the
> csum_valid value), but why should be useful? multiple nested tunnels
> can't be GRO aggregated (s/w), not H/W GRO aggregated.

In principle, or are not aggregated today? I think the latter.

No need for an explicit csum_valid field if it is implicitly implied by
where csum_start points: all preceding checksum fields are verified.

I don't think this conflicts with your "only 1 level" requirement, is just
a generalization of it.

> Note that the thing discussed here:
>
> https://netdev.bots.linux.dev/netconf/2024/paolo.pdf
>
> in all its variant, basically tricks multiple nested tunnel in a single o=
ne.
>
> Given that reaching agreement has proven to be complex, I would avoid
> adding additional complexity without a very strong reason.

I agree.

This topic is complex enough already. And I think that there are far fewer
uses for multiple tunnels than just for a single tunnel. So let's get that
merged.

But let's try to write the proposal so that it can possibly be extended in
the future.

I suppose your proposal is. It might be useful to make explicit why the
"only 1 level" and that this is a pragmatic choice that may be revisited
in the future.
