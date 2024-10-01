Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5529D1CB522
	for <virtio-comment@lists.linux.dev>; Tue,  1 Oct 2024 19:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727810158; cv=none; b=UPqBXWU3fwZDOLJbNtLceJC742Sp5D9iqKTQuxxpNvSZn+v8SSDkYHYe82kjymITSPkbJR0JzcItmqJnbQi2RbCwWqoRNBUV4kKcAr/bqkumiF2pOLRU/kZbtEtsagebTc7xOok2kNhltjL9mBRst2O4WM/JaXoaYgxbBwyvryI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727810158; c=relaxed/simple;
	bh=wvYpmr390aC/WoioDcRYkMdG6CJGzKWef4WOBlDEEqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pf6DmUf7D8QEuZEu2Y3j527l3NaFYGcE3gvJlYnwyoA9Nh8KentAP5RcIyFoHu6g5Brs3Z6mQ1FWx+zLooDLJynNCmnQoY2gnpMPxH8nNeumIOj7IZWsjHlULVux1a+y6ib4gGC6arS/ilr6/H0nXHCmEK+tMehPTN3GWVt4cM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fZbvWUjz; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fZbvWUjz"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e260b266805so3713193276.0
        for <virtio-comment@lists.linux.dev>; Tue, 01 Oct 2024 12:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727810156; x=1728414956; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAWzOw4OGCKdOBzx4VF/izYqX6iC59JZGp0h+vusscw=;
        b=fZbvWUjzGzbf/F5wvtO6X9DcXgWLurtjodezGA2X45iCI9VA78IwJneDBxI580vjyt
         5NQCTKWXztBfezNxr08PDcvrnmhBC+BHZPPUAU5u+A8NpXV0KNthNe1ru9dAIYjsL2OU
         84Mm2vAETIO8emI7u3j4Xf9v0BQjmNcY0BqBzbWGXjjptDCAMuI5jnYiFhQWHtnQPwkQ
         s9sUHUwzFeVwxeVGjROh4qTpfmYpcOZ265ETGOvPI/T3wINimFs7HOkFQ6FV1EvmkB2A
         Z7b906jMbq/6I8ZtU1kkaqTkXW9nUrNJ1FMrnKLt0oqshyFre/Hz9QjEVdnQd/juqscr
         Cnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727810156; x=1728414956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAWzOw4OGCKdOBzx4VF/izYqX6iC59JZGp0h+vusscw=;
        b=peuQQ3axos2B8KQvJpR7JB9tXZ2/WNHc1BzpnZOMt8c0w0Vy8fzD2hmguc45rPgMJm
         eB3jp/IOGI6lJXXjL3g9En92Tb975z2rN6TTadU5QfRjcUXLLzKYSx9Y8mzxEAjv/dWh
         mGHDcQhcH0wb18UQ3xw1GDOoxTBc8LbTXiUcIcmWFgeRmPvyRWgm98J6kT83H/4J0W4g
         /ywZFs8kGh4ZsIfnxLxH4jZbk+VOZDoxz9JJ/IKmtcHrJ53wj59c/VWx8OfcsSWn6EYR
         XvntoS0b5E2v0+V72QdrMa68ICieBW+h7zYdLV/ZIixoOowlBFIyK2YqF6B4qJX31oSs
         iXYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCXUFehj6M++Tebh3HKw+llNzmHdconhpS0lLo2C0Jx3UMaaOkE8ZrAjqREKfSSWfLMMrbOeqplV7O9OibvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSgCwbswL0123DQtfTAm+JtYaBsMqfpbjaXbAqiJn5SAAgjE8C
	ouW5N8S5aXinuCAZcOmPYloYG3HbRPDjD6fviUKWuKICoHNDh4cs2Z4hWZJtKst6kF/T2Z/SNbx
	sKvE0YLPbtmBa6nDFv5vDvo10yUf0uCNBPm5G
X-Google-Smtp-Source: AGHT+IFkbTFsrapxFJh9gSEE+XIDmfXo39Es/xb0Wa5HbhBwVsx3ucGSJ/klHXzufL43PUiB8o9vEp1G896c6CbMHWI=
X-Received: by 2002:a05:6902:2493:b0:e25:cb59:77d1 with SMTP id
 3f1490d57ef6-e26383853a9mr804604276.8.1727810155848; Tue, 01 Oct 2024
 12:15:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725463935.git.pabeni@redhat.com> <CACGkMEsXhsTpZg2DP5BqUOodjR1HOTc-a-FuaCbxffZhpPj2aQ@mail.gmail.com>
 <45c88725-bacd-4999-919c-4191ea0cbdfc@redhat.com> <1ca3a523-87d1-4450-a0bb-980b1c8109c4@redhat.com>
 <CA+FuTSfdXbMsFqEDXRwoKZUwaRJLHi6H-BZjEF00-1bWqXvEdQ@mail.gmail.com> <891cebdd-a417-4d16-b01c-197bc0b5afdc@redhat.com>
In-Reply-To: <891cebdd-a417-4d16-b01c-197bc0b5afdc@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Tue, 1 Oct 2024 15:15:15 -0400
Message-ID: <CA+FuTSdTjtyjCJoZX4YHSeifL+BH=zD_ezLUL30=aqeJiDE+iw@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] virtio-net: define UDP tunnel offload
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, kshankar@marvell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 10:02=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 10/1/24 15:09, Willem de Bruijn wrote:
> > On Mon, Sep 30, 2024 at 3:36=E2=80=AFAM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >> On 9/9/24 10:05, Paolo Abeni wrote:
> >>> On 9/9/24 05:16, Jason Wang wrote:
> >>>> On Wed, Sep 4, 2024 at 11:50=E2=80=AFPM Paolo Abeni <pabeni@redhat.c=
om> wrote:
> >>>>>
> >>>>> UDP tunnel usage is ubiquitous in container deployment, and the abi=
lity
> >>>>> to offload UDP encapsulated GSO traffic impacts greatly the perform=
ances
> >>>>> and the CPU utilization of such use cases.
> >>>>>
> >>>>> This series introduces separate features to handle both UDP tunnel
> >>>>> segmentation offload (patch 1) and UDP tunnel outer checksum offloa=
d
> >>>>> (patch 2).
> >>>>
> >>>> Looks good to me.
> >>>>
> >>>> And I wonder if there's a link to the prototype code so I can have a
> >>>> double check.
> >>>
> >>> I still have to refresh the code from first implementation - that was
> >>> the base for the first draft here some time ago.
> >>>
> >>> In the next 2 weeks I'll be traveling and/or AFK, I hope I can share =
the
> >>> code a little after that.
> >>
> >> A very early PoC is available here:
> >>
> >> https://github.com/pabeni/linux-devel/commits/virtio_tunnel_gso/
> >>
> >> It's very lightly tested vs a patched user-space:
> >>
> >> https://github.com/pabeni/qemu/commits/virtio_tunnel/
> >>
> >> "very lightly" is actually a strong understatement; the thing survived=
 a
> >> single iperf-over-udp-tunnel run, and that is. However I hope it shoul=
d
> >> suffice as showcase.
> >>
> >> In the tun/user-space interface I used a separate ioctl to configure t=
he
> >> tunnel offload instead of re-using the existing ioctl for plain GSO,
> >> because AFAICS the tun driver is currently unaware of the complete
> >> virtio net hdr layout (e.g. ignores rx hash and VIRTIO_NET_F_MRG_RXBUF=
)
> >> and it is just notified of the total hdr struct size.
> >>
> >> With UDP tunnel offload enabled, the tun driver need to know the tunne=
l
> >> fields offset inside the virtio net hdr. Piggybacking such info inside
> >> the the current ioctl(TUNSETOFFLOAD) data (a single long int) is
> >> feasible but looks hackish. Instead I preferred implementing a separat=
e
> >> ioctl(TUNSETTNLOFFLOAD) receiving as input from user-space a struct
> >> containing the mentioned offset and the "csum offload enabled" flag
> >>
> >> Any comments/suggestion WRT such interface more than welcome!
> >>
> >> The PoC demonstrated that the pending spec changes need some fixlet:
> >>
> >> - I wrote the patch on top of the current virtio-spec master branch, I
> >> need to rebase on top of virtio-1.4, I guess.
> >>
> >> - I underlooked to the VIRTIO_NET_HDR_F_DATA_VALID flag. The
> >> specification change allows GSO over UDP tunnel offload with DATA_VALI=
D,
> >> but GSO over UDP tunnel needs the inner transport protocol information=
.
> >> This point looks more difficult and potentially controversial.
> >>
> >> With the proposed change, when DATA_VALID is set, the implementation
> >> will have to determine the inner transport header location via parsing=
,
> >> as currently is doing for plain GSO. Note that the PoC is currently
> >> bugged WRT this scenario.
> >>
> >> I'm wondering if we could revisit the spec change requiring that both
> >> the driver and the device, for GSO over UDP tunnel packets only, will
> >> fill the csum_start field when either the NEEDS_CSUM or the DATA_VALID
> >> bits are set.
> >
> > This SGTM.
> >
> >> Equivalently, for GSO over UDP tunnel packets only, the
> >> driver and the device, to specify CHECKSUM_UNNECESSARY packets, could
> >> set both the NEEDS_CSUM and DATA_VALID, with the latter flag 'taking
> >> precedence' WRT the actual checksum type.
> >
> > Why do both need to be set to signal CHECKSUM_UNNECESSARY, rather
> > than only DATA_VALID?
>
> I think it's mostly a matter of preferences, and 'allowed delta' WRT to
> the existing offload.
>
> AFAICS, technically the plain GSO spec don't mandate that NEEDS_CSUM and
> DATA_VALID as mutually exclusive. Instead the spec require the
> NEEDS_CSUM flag to use csum_* fields: the first option would create a
> more significant difference WRT plain GSO.

True. The existing API is very permissive.

As you probably know, I'm strongly in favor of being more strict in
new additions, to avoid allowing weird unexpected packets that we then
have to detect and work around later.

From that PoV, explicitly specifying whether the bits are mutually
exclusive or, if not, what having both sets means, would be great.
Even if only for the new tunnel case, as we cannot do it
retroactively.

>  From an implementation PoV, the 2nd option (both NEEDS_CSUM and
> NEEDS_CSUM) would allow for simpler integration/reuse of the existing
> code: the UDP tunnel GSO 'to_skb()' helper could directly call the plain
> GSO one and eventually later just set CHECKSUM_UNNECESSARY as needed.

I don't entirely follow. But that's probably fine at this point.

I did quickly skim your initial implementation code. At high level
looks entirely sensible to me. Thanks for sharing!
