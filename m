Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E192D1922EE
	for <virtio-comment@lists.linux.dev>; Sun, 20 Oct 2024 22:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729463374; cv=none; b=jXuiU1EmvupIR9vMaSVPqwTSbG4Pax34j8JISCpE7Ab0M2F+nnRfd+De7oS9UynKgNw7njCRpdOaLjOMxvcbcaXF26A2oDgQNBaZeKO85FdMRnvHGWOMnK5m4xKdEnP1PmyhCCDReeqq3skRhbn7j4pymtSqKdc/JmbZr0+MAJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729463374; c=relaxed/simple;
	bh=kxCgvRMK3gbW3mjuIMheDVtxlkgQCuiF2PmL+IJn+9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O9uE8w65wnmRrChyeEUIAfz2jybnMrYH03EOEIy/SQjzreicmHRYRtS89CBpH8HYyW2H+I6CyN9QqU+jVpb5AT0v9XNu9gzfxuxeND6xbuC3atHww/QakrA/DZR1dYLSLqwYCI15Jg4grFgAj8BksK/YrryCp9crK6GNv8lh2MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0P3mXcLF; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0P3mXcLF"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e297cc4b134so3610649276.2
        for <virtio-comment@lists.linux.dev>; Sun, 20 Oct 2024 15:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729463372; x=1730068172; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kxCgvRMK3gbW3mjuIMheDVtxlkgQCuiF2PmL+IJn+9w=;
        b=0P3mXcLFfvGrS0A8axk+pSK/HS+9W8U2xaF0IxlNVS4QlrwYk7NR2tSmquNCMHjCwt
         68MyD5QiJNpqJtQ2wZN58sM6uN9cds10FcKpeXSjh1My0XgeqrhwJbcnFckwp1QXA1QC
         qtReoxN9flKGFzdoO2YhuBY8GKzR4MXycLwRoAfg/+6aspl3+NGflkZuQyQt5C4mTl3N
         wzjNTzvTEqxs59m9yY58p+Z+mVb8jVGcC+oHKq1doNhX/ypbRI2kK9e9ky/4zk7ws/2y
         cndDvWHG/p1LgVxMw/o0MbJQs7tJ8rKfSav5T1YyrZJYK3OJf4llEluRVO/mnC72tFqF
         YR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729463372; x=1730068172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxCgvRMK3gbW3mjuIMheDVtxlkgQCuiF2PmL+IJn+9w=;
        b=AdU/5xWmlRrerQ2rO5O4DsBUipDMlhiYykW8e5ijKIHwtdACQEbxV10I9CHbZmHMtq
         ejp4yqsFA6hLU+YySou0A3D0P5aWscT4dlZB2KVaOQ5WuSC3+l2XLRwbY2HooF1A0cBR
         SkOK5RrJbCWcUeY+ysHrU1tR3+sN2J++k4fJPkomkajnNj8oPYMmFYOzlYgEjRrT3GOm
         lJONZpCGEAgXzrXsyh+J4gzOkm/9tU1ZtWottLn5CofaxFVb5tNOJgv/fOeFsgoy2Sw1
         OI50RktRzNQfkpX4i3zuuMI2m32okj6KtrCmhhF0JbCTbev2STqJuZlQ5MfmaLC7uS5o
         y2yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg+p1kgqSqWDZs2UZSEgSw5ODfjHrJWvRYtcxQTI0miylQdwMYT+Z3o1bbWIy1ZaH1DampJVSJsxe/0dgVXw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb2U4+AXDiT19qjmLr09uzxXTdwryb7Y49HvZdbYryYaywieYM
	Mx9nrCmqD08uujXD8xU5Bzh9r/DRI1aMnZTFjQLU4P4DMVsIcLNC4eLnukhZbq31Ai2HvRgv4wg
	eHWenCiz7ena2TU4dJU1zy6NdBRXFURMK6qWh
X-Google-Smtp-Source: AGHT+IEjtrjEqy7+IRsYKtYF+pUYOijS9VpvsSRah60YzP4+bLvZwwDey7IfyvJoD4FfPf/k3dpC6oUDd7a1NkAqFuM=
X-Received: by 2002:a05:6902:1895:b0:e2b:dc5a:a409 with SMTP id
 3f1490d57ef6-e2bdc5aa5eamr2606980276.41.1729463371593; Sun, 20 Oct 2024
 15:29:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1728029499.git.pabeni@redhat.com> <55306969c73f62bf4d100d15074bfd6cde741417.1728029499.git.pabeni@redhat.com>
 <CACGkMEvV0gtvgpb7z1MqJLKzHm-Be_8hkf0GzqqsFsfDG8oAeA@mail.gmail.com>
 <d34f50af-4042-44c6-90e1-0acbbb899e96@redhat.com> <CACGkMEvrowr6CwF+=RiR+f3EagdKB=rzyCPCQcUdXee4a5MaZA@mail.gmail.com>
 <2b90c368-b514-4077-a6bf-43da075af4fc@redhat.com> <CACGkMEu5GWZrYVRN==F=vrRQQGnxj_WqX86YZ+diqC3s3m2m_A@mail.gmail.com>
 <10bc51b2-efbe-4f33-a1b3-827de4d0cd10@redhat.com> <CACGkMEuhJXMd0hGopyehESO1eNVRXVX+FaF7m8f6Y9yWCzoESA@mail.gmail.com>
 <44be2d9c-5624-4419-8e9c-e5302a5f6b2f@redhat.com> <CACGkMEsgJT1c93RZur20fUyjtxSX6dMPePEJvzbmNWpAHd92Mg@mail.gmail.com>
 <3e3d6984-65d3-46b0-aaa3-e6591123f95a@redhat.com>
In-Reply-To: <3e3d6984-65d3-46b0-aaa3-e6591123f95a@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Sun, 20 Oct 2024 18:28:53 -0400
Message-ID: <CA+FuTSdvJNOBUQcUKPaJYO5t2pxByPSsj_USYdS=o1jKZBJK4A@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, kshankar@marvell.com
Content-Type: text/plain; charset="UTF-8"

This thread has gotten very long. I'm not sure where exactly to
sprinkle all responses, so just starting my attempt at a summary
afresh.

One continuing point of confusion is ingress vs egress.

* Checksumming.

Perhaps we can start with a new precursor patch that clarifies the
intended existing behavior?

- NEEDS_CSUM and DATA_VALID are mutually exclusive bits
- DATA_VALID reads/writes CHECKSUM_UNNECESSARY
- NEEDS_CSUM reads/writes CHECKSUM_PARTIAL, and implies that
virtio_net_hdr csum_start/_off are set

This does not explicitly address CHECKSUM_NONE and CHECKSUM_COMPLETE.
And the meaning of the flags are different on ingress vs egress. All
of these points can probably be clarified.

Also CHECKSUM_UNNECESSARY has the csum_level field to encode how many
levels of checksums it covers. This only becomes relevant with
tunnels.

Also, if the current Linux virtio_net_hdr_to_skb is more permissive
than the spec, let's definitely update the code.

* Tunnels.

Technically there are no existing non-GSO tunnels in the virtio spec.

What exists are packets with a single checksum offload. These may
happen to be UDP packets with tunnels and inner packets, whose
checksum virtio indeed has no way to vouch for. But no tunnel specific
information is read/written in
virtio_net_hdr_from_skb/virtio_net_hdr_to_skb. Such as the skb
inner_.. fields, or csum_level.

When introducing tunneling in the spec, and when only one checksum can
be hardware offloaded, the most valuable one to offload is the
innermost. Inner TCP packets must always be checksummed. UDP or other
outer checksum fields can be left zero.

Or computed cheaply in software, derived from the innermost checksum
(local checksum offload). Though that is only relevant to patch 2.
Relevant here is that in the current proposal if NEEDS_CHECKSUM is
set, this is a checksum offload request of the inner TCP packet, and
the outer UDP header has checksum zero. The inverse, for TSO, would
not be very useful.

An alternative is to support multiple checksum offload requests at
once, at a minimum two. But most hardware only supports one
csum_start/_csum_off. And due to LCO, the complexity of supporting
multiple levels is just not needed.
