Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E51816419
	for <virtio-comment@lists.linux.dev>; Wed,  2 Oct 2024 16:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727888193; cv=none; b=T5wTEMyBpXDoiiDk1c5w113PDXFnfcgKLG7+avXQ2GZq/NrvSsty68rq6Iks/NtWRbl7sJXQVA4F6sxHpLPzFN0v/Pn8Yn1eRAXxk54cZSiqVHwzosD2RdkhNl/KFkXbidpZi7z5QJvYk/lhYoJeA81MEsC/yeNi5/JNZTkouC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727888193; c=relaxed/simple;
	bh=wsZDlvlXKvq9s8/++RGX75ownyd+JnXtEm4p8yRSzUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IdfVEHLx3RL5FTxjmnR8ivOTCqcpRL9/t21z2zl2JELuUaK3UEmR3emr63xswrewo0Gu3b1wpWyyuqft0ObtA8Wun5rO7Mo5UFDHB1vnvQOz34JxF4bObSPKMmf8XnzqlnS4QCexaGhi/Eh5JggxFaoii2bb09tLrD5JWGVFab4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DlDLpb6l; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DlDLpb6l"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e25d405f255so6040583276.2
        for <virtio-comment@lists.linux.dev>; Wed, 02 Oct 2024 09:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727888190; x=1728492990; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3t675cciF3X3wig5SVR1SK1s9lQWlLzhG8Xv1u6TNI=;
        b=DlDLpb6lam++9LWYQP3JNmcYABCKAK+UzCBRLRy0qxgaqg5QvpQ48GyIzmtzk2PJ2H
         SUL3cV9AUdHj8yydzji8R8QxY/qjBaf+iV5AUcV+AG1kDtx/1XafZtkSAQ/pJ4f+sN3Y
         4tkC4Adw83UnFJ84OnUQAXP3PFp0r1vwuJogPVauxKVL4iGq9zpjnwFtC9+ZXtrw8LZ7
         HuA+1ZyTk/akRcmhCUH29iVaoLo7AP3MiarrEbeWBnDZAbt5p0qtOd5nISnIuq7wbXR8
         YqCowMtMNmR96N7Z9fu0MGu6w1JM+PnkqJLrRDicK+gVlWnyOdy2pm4GDxr4PfFfw4UO
         4V+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727888190; x=1728492990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3t675cciF3X3wig5SVR1SK1s9lQWlLzhG8Xv1u6TNI=;
        b=GZF7nCyOvKs05+B2yHC74Z3MLfZMBrU1Cfa1nxqv/MwfLPPJX1r5YptvjH+Bfm6dJG
         4E3E3LM7tnqn6M7db44hJlg1iB+YsWMsZhkGG1qgum6b0SVWjylf0B3WM1ActiVNN10L
         nsaqqV5su29ltWQ4gX9jxoskhzpzl/DFQedEeqsiZxqvTQzJXYFYK4auqLkgjQfjvFqt
         yNAUBe9HjFp6267cQxaMTH8cy8RBKBl7rsJgQ/7epVLZ/iNjxl68VWYkxvc8wVA9u6Vk
         1lcbzpR0QFEUTqlzWjeZSpwVzu7gpCltko3r9tCLHSgmzssydJ5MK4GkWiLobmdHuBd/
         wr2g==
X-Forwarded-Encrypted: i=1; AJvYcCVlb2po6bdSGrACsET5b8y8ZnuGoOKnK06ll1IdIqV52Xr+BOtsmK55M36PtpBhXGm6dK3i5UAf6VJS4nXqyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAcN797lqJW4Dvt9LIqe8EploHfFQTwrMPXFEqOGoNwBkFvPM3
	vIaL91R04G/rDl5trZC/uR9/jNtv7WjbCP6UnjMPKILZG/DKDszjhm0cT1EoejZGLE3JAGzvFq0
	hv0ogjTebLpak5V6x/jBIkV0mTMvlBgyF4CDz
X-Google-Smtp-Source: AGHT+IHW8NSWhBXxsbpYGKoSFqr02wsvVUE6WXMSoVqnkUadDwmkiv6fzlPP7uJ8wc6cKZsRYaRTBhcMJE+u4o2fTZY=
X-Received: by 2002:a05:6902:1288:b0:e25:d11c:5ed8 with SMTP id
 3f1490d57ef6-e26383b2d00mr3833670276.20.1727888189905; Wed, 02 Oct 2024
 09:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725463935.git.pabeni@redhat.com> <CACGkMEsXhsTpZg2DP5BqUOodjR1HOTc-a-FuaCbxffZhpPj2aQ@mail.gmail.com>
 <45c88725-bacd-4999-919c-4191ea0cbdfc@redhat.com> <1ca3a523-87d1-4450-a0bb-980b1c8109c4@redhat.com>
 <CA+FuTSfdXbMsFqEDXRwoKZUwaRJLHi6H-BZjEF00-1bWqXvEdQ@mail.gmail.com>
 <891cebdd-a417-4d16-b01c-197bc0b5afdc@redhat.com> <CA+FuTSdTjtyjCJoZX4YHSeifL+BH=zD_ezLUL30=aqeJiDE+iw@mail.gmail.com>
 <d2c437a4-1e84-46c6-a51b-77e97ed8e15b@redhat.com> <CA+FuTSdPDb7gfrTEpDteqvvGkqZBD97mHudHHvf4ObhfAG+nBA@mail.gmail.com>
 <4d9cb8bf-dbaf-4707-83fe-9b9dbc7d1e88@redhat.com>
In-Reply-To: <4d9cb8bf-dbaf-4707-83fe-9b9dbc7d1e88@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Wed, 2 Oct 2024 12:55:53 -0400
Message-ID: <CA+FuTSf8274uQVEiJ-R5nnqAzDR9+N3WA0YoSbC-Q7MF5+O7Mw@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] virtio-net: define UDP tunnel offload
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, kshankar@marvell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 10:29=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 10/2/24 14:29, Willem de Bruijn wrote:
> > On Wed, Oct 2, 2024 at 4:35=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> =
wrote:
> >>
> >> On 10/1/24 21:15, Willem de Bruijn wrote:
> >>> On Tue, Oct 1, 2024 at 10:02=E2=80=AFAM Paolo Abeni <pabeni@redhat.co=
m> wrote:
> >>>> On 10/1/24 15:09, Willem de Bruijn wrote:
> >>>>> On Mon, Sep 30, 2024 at 3:36=E2=80=AFAM Paolo Abeni <pabeni@redhat.=
com> wrote:
> >>>>>> On 9/9/24 10:05, Paolo Abeni wrote:
> >>>>>> I'm wondering if we could revisit the spec change requiring that b=
oth
> >>>>>> the driver and the device, for GSO over UDP tunnel packets only, w=
ill
> >>>>>> fill the csum_start field when either the NEEDS_CSUM or the DATA_V=
ALID
> >>>>>> bits are set.
> >>>>>
> >>>>> This SGTM.
> >>>>>
> >>>>>> Equivalently, for GSO over UDP tunnel packets only, the
> >>>>>> driver and the device, to specify CHECKSUM_UNNECESSARY packets, co=
uld
> >>>>>> set both the NEEDS_CSUM and DATA_VALID, with the latter flag 'taki=
ng
> >>>>>> precedence' WRT the actual checksum type.
> >>>>>
> >>>>> Why do both need to be set to signal CHECKSUM_UNNECESSARY, rather
> >>>>> than only DATA_VALID?
> >>>>
> >>>> I think it's mostly a matter of preferences, and 'allowed delta' WRT=
 to
> >>>> the existing offload.
> >>>>
> >>>> AFAICS, technically the plain GSO spec don't mandate that NEEDS_CSUM=
 and
> >>>> DATA_VALID as mutually exclusive. Instead the spec require the
> >>>> NEEDS_CSUM flag to use csum_* fields: the first option would create =
a
> >>>> more significant difference WRT plain GSO.
> >>>
> >>> True. The existing API is very permissive.
> >>>
> >>> As you probably know, I'm strongly in favor of being more strict in
> >>> new additions, to avoid allowing weird unexpected packets that we the=
n
> >>> have to detect and work around later.
> >>>
> >>>   From that PoV, explicitly specifying whether the bits are mutually
> >>> exclusive or, if not, what having both sets means, would be great.
> >>> Even if only for the new tunnel case, as we cannot do it
> >>> retroactively.
> >>
> >> I must admit it's not clear to me if the above is a sort of endorsemen=
t
> >> for both options, assuming each of them will be strict about the flags
> >> definition.
> >>
> >> If even the 2nd option is ok, I would go with that, as
> >
> > Here option 1 is "requiring that both the driver and the device, for
> > GSO over UDP tunnel packets only, will fill the csum_start field when
> > either the NEEDS_CSUM or the DATA_VALID bits are set."
> >
> > And option 2 is "Equivalently, for GSO over UDP tunnel packets only,
> > the driver and the device, to specify CHECKSUM_UNNECESSARY packets,
> > could set both the NEEDS_CSUM and DATA_VALID, with the latter flag
> > 'taking precedence' WRT the actual checksum type."
> >
> > Right?
>
> Yes!
>
> > Option 1 intuitively is simpler to follow: for tunnel offload,
> > csum_start must always be set.
> >
> >> it sounds preferable to me for the mentioned reasons.
> >
> > It's a bit unfortunate for implementation to dictate interface,
> > especially if it makes it less straightforward. But if the
> > implementation is significantly simpler with option 2, no strong
> > objections from me. This is not a huge design point, either way.
>
> Arguably the most relevant sell-point for option 2 is that it allows
> enforcing simpler/stricter checks in virtio net hdr parsing (if
> UDP_TUNNEL is set, NEEDS_CSUM and plain gso must be set, too).

GSO implies checksum offload, so that part is fine.

As long as it does not extend to UDP tunnels for non-GSO packets.

> Somewhat related: I just noted that the 'TX sides' of the spec (both in
> device->driver and in the driver -> device direction) is already strict
> WRT csum and gso dependency, but the corresponding 'RX sides'
> ({device,driver}normative/Processing of Incoming Packets) lack
> completely any MUST NOT accept/MUST drop statement for bad/invalid inputs=
.
>
> My understanding is that most/all of the trouble we have on virtio net
> hdr parsing and validation steam from such lack. I'm adding explicit
> 'MUST NOT accept' statements for all the UDP-tunnel-related invalid
> flags/gso_type permutation I can think of.

Thanks!

> @Jason: do you know if there is a specific reason for the mentioned lack
>   validation in the current specs?
