Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230C51CF7BD
	for <virtio-comment@lists.linux.dev>; Wed,  2 Oct 2024 12:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727872236; cv=none; b=QobydaDUJdWKiHTZDKTjzUsv2Pje0sotR5vubHkk1JLGgZDSQq8RAPRdyyonpSgIAc3Tq3rT7uVF19Nr0RjBoNwhJm4kD2SOo1RaTfRGwKD1Dp4cg6R17uOMMe8Lg4ZySq0zO3VCnz64k5/muiSTOfQ6F5E5R59qe3Ps4ksLg/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727872236; c=relaxed/simple;
	bh=PyapXvFFUM46QLvQLjDo2mbc6fs9tYnQMKxuGdRAxXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKnRDaIVdFR8+8o77UBMyuiWS9o1uq2iSs95JhxuDQRzjTHwDlG7Z30kFZ8xhQ60HhKlHgR0r/rEvJfX9G9FSIXuGzXVPUUpvk6QfD9BMzFA9WqR1WerQPkeUAllAggl0QHplxnhdJOzEj7QPZ9NuzpHBUn53JM2g8KUK1ieR7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jar38UHP; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jar38UHP"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e235a61bcbso5413427b3.1
        for <virtio-comment@lists.linux.dev>; Wed, 02 Oct 2024 05:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727872234; x=1728477034; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/Ylk14z8UbyYFO4s1WVJKwB1CDebAb2IlWd+1DlTPM=;
        b=Jar38UHP5F0r9auTdF87ojswaSCu8lYXq7FWBtCEBDJXNVvMMBSWSjPWF7HeMtQ90U
         VGv2S2F5JdM7Kz9YsV3SfigiKHl6fcPwYo94IOOQG4EIUGOrKevUPRB7afU9mejZqW+l
         SmUHHWNESH2N8vQE7TtaBsxvno6fjEPM6WXPC/WGcUasBUpt2qQglOQNKxt3AdoTXL4A
         Q/zZSkuFs93o10Xw4sWaNN2fJLHipN/lZ7BNxHd13/OXsFAog/s+wH+J4aa8K/3JMvgG
         kHSFY9Xjl8OscPgSLNTgjt7CauwUO917K0Rdr2Cz4eWYamiHb8zi/eOUgvYDhhVU078t
         FDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727872234; x=1728477034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/Ylk14z8UbyYFO4s1WVJKwB1CDebAb2IlWd+1DlTPM=;
        b=O3WJs60GswIcRajrC6q9hBxEyd4AaJbHBo/qpTLe1r9rGy53/iyr8J4bV2YWM+fRqs
         nOSZAbTPtrfp1cju/VMi+ODCFK84xJciq3kQxXzWHvUDNZbeDcfRaHe18VRI3XZXSIyP
         E9OHyjf8BvWt+DHHqp0gATGLKF/6fJrSuEHotXUs5d0AfyxlaRTOQl7T4/cxrgTwu2Ne
         DRhRKvhYQfhKZiOQlrYvZWDuvcSRip4A04fooT9fNbR+lcE3wBmaPu8LdxjlS40zPO9h
         VtZL1ZbuwatbGhVPYXlncr7Gvhb82lNbGCR8zyoqTe9ZKunvMTTVtLfeWg+KXAWHIQNu
         TsFw==
X-Forwarded-Encrypted: i=1; AJvYcCUdHRmyTZjG3fAZlfpmUsSVCUW4Z6Qvj5D5XwtgeCzI1N389kz1RlnO22npirrZE3AZphoI8aPn45qq5NHdTw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyarobgbAkAHXVOcBvvSKs0+zhjPDkTBPSacycx1mvSsfuzDgqa
	t5HNYi+15hTMnWU4bCHo4vpLxDiSwnW5AlA9QtRchVpoMLmvZijM2HEabaD1TJ2MdTv6UYy8ZI8
	OUgRZnOHQEhUHR72RoP0jHevE09NCjEgRTgnN
X-Google-Smtp-Source: AGHT+IH19RdHwFawQ7UF3mvLU1re1C0rsQju9o+TbwRNPqdf3L03d0boskXu22ZFFZi9/El8+Uxz6HXPGbkwyc9ZgWg=
X-Received: by 2002:a05:690c:3190:b0:6e2:41fa:9d4 with SMTP id
 00721157ae682-6e2a34ad25dmr18714157b3.15.1727872233797; Wed, 02 Oct 2024
 05:30:33 -0700 (PDT)
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
 <d2c437a4-1e84-46c6-a51b-77e97ed8e15b@redhat.com>
In-Reply-To: <d2c437a4-1e84-46c6-a51b-77e97ed8e15b@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Wed, 2 Oct 2024 08:29:53 -0400
Message-ID: <CA+FuTSdPDb7gfrTEpDteqvvGkqZBD97mHudHHvf4ObhfAG+nBA@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] virtio-net: define UDP tunnel offload
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, kshankar@marvell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 4:35=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 10/1/24 21:15, Willem de Bruijn wrote:
> > On Tue, Oct 1, 2024 at 10:02=E2=80=AFAM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >> On 10/1/24 15:09, Willem de Bruijn wrote:
> >>> On Mon, Sep 30, 2024 at 3:36=E2=80=AFAM Paolo Abeni <pabeni@redhat.co=
m> wrote:
> >>>> On 9/9/24 10:05, Paolo Abeni wrote:
> >>>> I'm wondering if we could revisit the spec change requiring that bot=
h
> >>>> the driver and the device, for GSO over UDP tunnel packets only, wil=
l
> >>>> fill the csum_start field when either the NEEDS_CSUM or the DATA_VAL=
ID
> >>>> bits are set.
> >>>
> >>> This SGTM.
> >>>
> >>>> Equivalently, for GSO over UDP tunnel packets only, the
> >>>> driver and the device, to specify CHECKSUM_UNNECESSARY packets, coul=
d
> >>>> set both the NEEDS_CSUM and DATA_VALID, with the latter flag 'taking
> >>>> precedence' WRT the actual checksum type.
> >>>
> >>> Why do both need to be set to signal CHECKSUM_UNNECESSARY, rather
> >>> than only DATA_VALID?
> >>
> >> I think it's mostly a matter of preferences, and 'allowed delta' WRT t=
o
> >> the existing offload.
> >>
> >> AFAICS, technically the plain GSO spec don't mandate that NEEDS_CSUM a=
nd
> >> DATA_VALID as mutually exclusive. Instead the spec require the
> >> NEEDS_CSUM flag to use csum_* fields: the first option would create a
> >> more significant difference WRT plain GSO.
> >
> > True. The existing API is very permissive.
> >
> > As you probably know, I'm strongly in favor of being more strict in
> > new additions, to avoid allowing weird unexpected packets that we then
> > have to detect and work around later.
> >
> >  From that PoV, explicitly specifying whether the bits are mutually
> > exclusive or, if not, what having both sets means, would be great.
> > Even if only for the new tunnel case, as we cannot do it
> > retroactively.
>
> I must admit it's not clear to me if the above is a sort of endorsement
> for both options, assuming each of them will be strict about the flags
> definition.
>
> If even the 2nd option is ok, I would go with that, as

Here option 1 is "requiring that both the driver and the device, for
GSO over UDP tunnel packets only, will fill the csum_start field when
either the NEEDS_CSUM or the DATA_VALID bits are set."

And option 2 is "Equivalently, for GSO over UDP tunnel packets only,
the driver and the device, to specify CHECKSUM_UNNECESSARY packets,
could set both the NEEDS_CSUM and DATA_VALID, with the latter flag
'taking precedence' WRT the actual checksum type."

Right?

Option 1 intuitively is simpler to follow: for tunnel offload,
csum_start must always be set.

> it sounds preferable to me for the mentioned reasons.

It's a bit unfortunate for implementation to dictate interface,
especially if it makes it less straightforward. But if the
implementation is significantly simpler with option 2, no strong
objections from me. This is not a huge design point, either way.
