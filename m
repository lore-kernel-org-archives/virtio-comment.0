Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793081158;
	b=5YzXG4SCsdd/TK7Kqq0z7lkKMJAgJoQ6x2hh9rTeDh/zvm5pJhGvu1QgzVlPe7pFVpg3
	 Usz+IeduexX+7zyruVGcu51YG7dbKpVEDq3ydNjn9VrD+tXYUJu7bWmWmtd9zs3V4FG5s
	 9QS2xkIuWyTq/N4qANuMozIZxWKzUlVJwYuec/6WfBemMLUY6QEG0wk6T4yAo8Rcl8aPb
	 ZZUgpOrMmVP06RHed1AneFL866vu3PAFlw5kqpyVvnhsRFtSgUmryQRAYu6iAzKtX8K6o
	 chROGosObS0r68Mro5Es0xuxEAz0AAUIC6tzQ4L0F2NRCQagwXSCp2Bgp2Da7umCx/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793081158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=36nCTS7wa7gXIAN1kwD+sQD4ccz42C41uLK49xXvr8U=;
	b=RQN5U32VWGQASPwzMh17seQLLG/sxFgzM3eoLgJtDOe8IFICcu/aUqK6Y155f/Kp8piy
	 hvUh5IxxV3vA1wmirIkLo/wglXkCskiIZz8Hq70WpSYZtMA5CrP1KiJTzfYocP6wC3eNH
	 Fkr++k60O/mSK4hijlBWpwdBuGC4vM0iLl/U/Ctg3TmGTSEKHGZ/mhekecWl+nNMwGGiU
	 qOCHVGHDlYj3Qu9UFjvhvVAndRn3OlW2QrY5tX13erF/B3T5aDlUsLgBcnGBgVa+J2rM9
	 qdOS1apk4wRRUf7BrLq+KQvzgPHS8hi8bJ+XFpRuINXUIzTFOvCA1BsTsTBpcGB57eA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nr55I4Ax;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BBE606A31A
	for <virtio-comment@lists.linux.dev>; Tue, 27 Oct 2026 06:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52BBE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nr55I4Ax
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso5737201a12.0
        for <virtio-comment@lists.linux.dev>; Mon, 26 Oct 2026 23:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793081157; cv=none;
        d=google.com; s=arc-20260327;
        b=W7+LRFA+01+gyODyu0luLIaZa7FurnKG1AoYYOen6dqNcG/UZb44nWRRe8T2hLz56k
         v6dTCC7pJ6b0vzV91GFjuokwfx0Yn3vj7MWHQhsWO6XOPymMXOQ2sneRf/sutBRMJQDy
         t7qDBHa1pzL6F+3myR8NIzfP6KbIUOXgPwwK/vUkjTlFuNvHLvTYuZd2zPx9KVvXdPSB
         rdnT5vTF804Xij/K8exWMZ52U2aHWCbuwcRRq4/0mv0GB+Pbl+Ra7p+PbYfKrs7rsJdt
         l+W5PGwEKxmIdecs/G7qgJTisTdicltHCyRVuCaJbdg45FwvKd8yVygl6oYUgLwWTUyV
         Nd8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=36nCTS7wa7gXIAN1kwD+sQD4ccz42C41uLK49xXvr8U=;
        fh=V8GGv834/AkdLwUkDCLisGLqUcLwBFaPHcrnFlS9ZXA=;
        b=cuqCzJYRbdjaD3rzoz7K37U0XpSoz5rNBmRom8scH1nTF/HIYAoWvKok9V5xak2wcW
         xCNqo+WdO8zKVpqS0fEbje2dIUiB2Cw82Jt22dPBLTJ3fM7RFE2XQr48OjdtWXWgAoHL
         ruURme84BMieQ0reVSiQJ2fRxAAwjSH4Sw7yhjfOeFZKEUYVDEgJ53n07v0KSxElfDml
         lSVSVVUxw86LMvK7MkzeR7iXwE9kzLQ6KNR5KvQM2Ll+mdtvsRASKWlYaORFYx+spfnO
         QK8UvT7TbodUvJaHUZbFS0+RFuq1RpePY9GR3qCzfybLM8t7bM4+Vn+jpwn2aflJWQet
         DUqA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793081157; x=1793685957; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=36nCTS7wa7gXIAN1kwD+sQD4ccz42C41uLK49xXvr8U=;
        b=nr55I4Ax2J1foYK+0dB3daMcSEWiscfxc5oySMKsy+vrqptqRupGX6JgaLNZiNT5gs
         qshJa4P1ncNJterjshVvvqytf7nMcIQ6MTotbd+SMkK9mCY35N40WGtUN7WQtss94R2W
         xF2M2A/QAJkIpWIqTrGU3qF5suuCL9itiRcjVw0z90QeCKATMBdbwwQ3//zW7gDcHKnz
         bF8B9FGkTs2SCLisgqa4d0+oKR1BAMxC7n7AWjlpmJx+2+nHfc5qZm6Q872naV5o1W06
         feyJyOhhvCcOEneqcmUS1Vu1Dg4HN/MbY/xP/iGRKCJQikF7gY1ACxNo+sU9fKvvbNf8
         rNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793081157; x=1793685957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=36nCTS7wa7gXIAN1kwD+sQD4ccz42C41uLK49xXvr8U=;
        b=VyOqhQeln54M/7/7zY2w47XcLuV58RnqqzbeS3Tx2JKPfsdr9U50M4x0UMI/6V5/OJ
         EbIxaJiF3QfzQoHIp7hEdgYYf6THEqJ1AP2B5AGiALw27rAcllVjrNDrSXuZX3vnOE/B
         ZI2WPy2scqg6Ok8qDWPRh0mPeNmVpo7kaMwqG/y+QE9dOfcdD4CnHoxd3+ZBqx8z42f/
         gcrS8SR9cxl4UyLVg/QSIULIhKvGk67RU/VZ494dGwaDfUhkxXQDJk8i7bofzw0Ps/uC
         uzNfyYJfVnnaAQUTh3LDVPirJzcDw9jiSHd9nZKM3RlR3LccxYeCP45JnpZVD5Pza8qr
         vorg==
X-Forwarded-Encrypted: i=1; AKwUvBzjbllVMtum8aaidC4WbegQga5Te03u5Eg9fvhx56qZ9w2Hz4t1Mri3GA+B1JvV0i5THfYJ5Iujc1tJ4o+xdw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIO8b8pJmZczE2vlhr5u2K0q0cMCkVg1Kx25rk4f4b2Po7DJVKM
	ssPu95d+kywo0JQb7KuI/ZDZdw9RjBfHHYhap1uAN+u+k43bAUsTO0yOEmJ7s561H4xe1gwrGPj
	g7GC0QhHl3ffc60hXh8iVerZssDHntJ2VKA==
X-Gm-Gg: AYBFou3SgAGRRhv9ZqbBWiCPLMFdklmLrs0KQFQ6H1dcZDWNgv8WFqWo4t3W6nmqGjA
	5qrJOTbZuH7c6CW6hqFyNaz7NcoV/Uw9kQFAAfJqMgUoo0vuLkYHJs8fgbk5u3YrXHeVG2ZtHYD
	xyr5RCfzL90zBm+IrZIh3zOB43+UOUdPx9EJWwEr6DZ4BfmzsNulIZgBIvdgX/QHURomWf46dIL
	YOfMIZn7n1EYtMTM71lYab7LGDQz2jWHylkO4xOO++Ly3SzfKLICmLuy0J/sNmd4QRIG72xNxqu
	LepHu07uaqiNCP/uiBZAgKx+H+MyJdp+Uc7GV+SLuvJFJ6+oIZwKVZAPWomfeUI0t3KGKB7xOvk
	tLN2gRv8kcAxsdBV7/u/v0WqqvvA2Mw2k9lmA3nBmi4mwC7pbjzPkENlJZ711L89ClZc=
X-Received: by 2002:a05:6402:1d4e:b0:6b4:6464:8a8 with SMTP id
 4fb4d7f45d1cf-6b464640b75mr5852825a12.27.1793081156358; Mon, 26 Oct 2026
 23:05:56 -0700 (PDT)
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261002010456.2053759-1-alistair.francis@wdc.com>
 <1f656ebb-b547-41f3-9b4f-4f39b3836f37@gmail.com> <fac44696a94a41a715a0f725cafb44a54d2eef4c.camel@alistair23.me>
 <cb8fa241-b02b-425f-89e2-bdb3d3c6bf30@gmail.com>
In-Reply-To: <cb8fa241-b02b-425f-89e2-bdb3d3c6bf30@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Oct 2026 16:05:28 +1000
X-Gm-Features: AclHuK9IMyVYmlaxWaT9c40dzOyoWCnvt5aGREXyxxiqcN76Vl6doiGmUsGDexc
Message-ID: <CAKmqyKPGEXUKfb_OKqfGQmYdZzW2CyA3+Qw4PNhoEkhzvSTX1g@mail.gmail.com>
Subject: Re: [PATCH] transport-pci: Allow storing the configuration in the BAR
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Alistair <alistair@alistair23.me>, virtio-comment@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:07=E2=80=AFPM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> On 10/22/26 00:27, Alistair wrote:
> > On Fri, 2026-10-02 at 01:48 -0400, Demi Marie Obenour wrote:
> >> On 10/1/26 21:04, alistair23@gmail.com wrote:
> >>> From: Alistair Francis <alistair.francis@wdc.com>
> >>>
> >>> Most physical PCI endpoint capable PCIe controllers do not allow
> >>> modifying the
> >>> capability list, and thus are unable to advertise the Common
> >>> configuration
> >>> capability.
> >>>
> >>> This results in physical PCIe endpoints implementing virtio-pci
> >>> falling
> >>> back to the legacy interface and then needing hacks to deal with
> >>> DMA
> >>> issues [1].
> >>>
> >>> One solution to this is to allow the device to store the
> >>> configuration
> >>> data in the BAR [2]. This can be used as a fallback mechanism so we
> >>> don't break any existing setups. New drivers and devices can
> >>> attempt
> >>> to read the configuration from the capabilities first and then
> >>> fallback
> >>> to the BAR.
> >>>
> >>> We also need to add a go_busy field so that the driver and device
> >>> have a
> >>> basic message box to communicate. This is required for
> >>> device_feature_select for example.
> >>>
> >>> 1: https://lkml.org/lkml/2026/9/1/185
> >>> 2: https://lkml.org/lkml/2026/9/1/2370
> >>>
> >>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >>> ---
> >>>  transport-pci.tex | 85
> >>> +++++++++++++++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 85 insertions(+)
> >>>
> >>> diff --git a/transport-pci.tex b/transport-pci.tex
> >>> index 95b08b8..7d09169 100644
> >>> --- a/transport-pci.tex
> >>> +++ b/transport-pci.tex
> >>> @@ -262,6 +262,83 @@ \subsection{Virtio Structure PCI
> >>> Capabilities}\label{sec:Virtio Transport Option
> >>>  fields provide the most significant 32 bits of a total 64 bit
> >>> offset and
> >>>  length within the BAR specified by \field{cap.bar}.
> >>>
> >>> +\subsubsection{Virtio Structure Capabilities in a memory
> >>> BAR}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI
> >>> Device Layout / Capabilities in a memory BAR}
> >>> +
> >>> +Some devices, for example implementions using physical PCI
> >>> endpoint
> >>> +controllers, are unable to add capabilities to the existing PCI
> >>> capability
> >>> +list. This means they are unable to advertise the virtio structure
> >>> +capabilities as described above.
> >>> +
> >>> +In this case a device MAY instead publish the same capability
> >>> structures in
> >>> +one of its memory BARs, at offset VIRTIO_PCI_CAP_BAR_OFFSET (0),
> >>> prefixed by
> >>> +the following header:
> >>> +
> >>> +\begin{lstlisting}
> >>> +#define VIRTIO_PCI_CAP_BAR_OFFSET 0
> >>> +#define VIRTIO_PCI_CAP_BAR_MAGIC  0x74726976 /* "virt" */
> >>> +#define VIRTIO_PCI_CAP_BAR_VERSION_ONE  1
> >>> +
> >>> +struct virtio_pci_bar_cap_hdr {
> >>> +        le32 magic;             /* VIRTIO_PCI_CAP_BAR_MAGIC */
> >>> +        u8 hdr_ver;             /* Version of this header */
> >>> +        u8 num_caps;            /* Number of capability entries
> >>> that follow */
> >>> +        u8 go_busy;             /* Indicates to start an operation
> >>> and when it's ongoing */
> >>> +        u8 padding[1];
> >>> +};
> >>> +\end{lstlisting}
> >>> +
> >>> +The fields are interpreted as follows:
> >>> +
> >>> +\begin{description}
> >>> +\item[\field{magic}]
> >>> +        Magic value that identifies the presence of capabilities
> >>> in this BAR.
> >>> +        Must be set to VIRTIO_PCI_CAP_BAR_MAGIC.
> >>> +
> >>> +\item[\field{hdr_ver}]
> >>> +        The version of this header (virtio_pci_bar_cap_hdr),
> >>> currently
> >>> +        only version VIRTIO_PCI_CAP_BAR_VERSION_ONE is supported.
> >>> +
> >>> +\item[\field{num_caps}]
> >>> +        The number of struct virtio_pci_cap entries that follow
> >>> this header.
> >>> +
> >>> +\item[\field{go_busy}]
> >>> +        The driver writes VIRTIO_PCI_CAP_BAR_VERSION_ONE to this
> >>> field to indicate
> >>> +        that the device should take action. The device is
> >>> considered busy until
> >>> +        the driver reads this as 0.
> >>> +\end{description}
> >>> +
> >>> +The header is followed by \field{num_caps} struct virtio_pci_cap
> >>> entries
> >>> +(see \ref{sec:Virtio Transport Options / Virtio Over PCI Bus /
> >>> Virtio Structure PCI Capabilities}),
> >>> +the first of which begins immediately after struct
> >>> +virtio_pci_bar_cap_hdr.
> >>> +
> >>> +The entries are packed one immediately after another. Each entry
> >>> is interpreted
> >>> +the same as if they are in configuration space and locate the
> >>> +corresponding structure within a memory BAR.
> >>> +
> >>> +Note that the \field{cap_vndr} and \field{cap_next} fields are not
> >>> used in
> >>> +this case.
> >>> +
> >>> +For read-write communication with the device, for example
> >>> \field{device_feature_select},
> >>> +the driver should set the value of the field then write the header
> >>> version to
> >>> +\field{go_busy}. This indicates to the device that an action is
> >>> required.
> >>> +
> >>> +The device will then read the fields, take action according to the
> >>> sections above
> >>> +and when complete clear the \field{go_busy}. The driver MUST NOT
> >>> read or write
> >>> +other fields until \field{go_busy} has been cleared by the device.
> >>> +
> >>> +Note the driver can write to multiple fields before triggering
> >>> \field{go_busy}. The
> >>> +device MUST then take all actions before clearing \field{go_busy}.
> >>> +
> >>> +A device that publishes capabilities in a memory BAR MUST place
> >>> struct
> >>> +virtio_pci_bar_cap_hdr at offset VIRTIO_PCI_CAP_BAR_OFFSET within
> >>> a memory
> >>> +BAR.
> >>> +
> >>> +A device MUST follow struct virtio_pci_bar_cap_hdr with
> >>> \field{num_caps} struct virtio_pci_cap entries.
> >>> +
> >>> +The device MUST provide the same capabilities it usually would,
> >>> just in the memory
> >>> +BAR.
> >>> +
> >>>  \drivernormative{\subsubsection}{Virtio Structure PCI
> >>> Capabilities}{Virtio Transport Options / Virtio Over PCI Bus /
> >>> Virtio Structure PCI Capabilities}
> >>>
> >>>  The driver MUST ignore any vendor-specific capability structure
> >>> which has
> >>> @@ -270,6 +347,14 @@ \subsection{Virtio Structure PCI
> >>> Capabilities}\label{sec:Virtio Transport Option
> >>>  The driver SHOULD use the first instance of each virtio structure
> >>> type they can
> >>>  support.
> >>>
> >>> +The driver SHOULD first attempt to use the virtio structure
> >>> capabilities in
> >>> +the PCI configuration space. If no common configuration capability
> >>> is
> >>> +present, the driver MAY scan each memory BAR at offset
> >>> +VIRTIO_PCI_CAP_BAR_OFFSET for a struct virtio_pci_bar_cap_hdr
> >>> whose
> >>> +\field{magic} equals VIRTIO_PCI_CAP_BAR_MAGIC. If found, use the
> >>> +capability entries published there as described in
> >>> +\ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI
> >>> Device Layout / Capabilities in a memory BAR}.
> >>> +
> >>>  The driver MUST accept a \field{cap_len} value which is larger
> >>> than specified here.
> >>>
> >>>  The driver MUST ignore any vendor-specific capability structure
> >>> which has
> >>
> >> How is the driver supposed to know that the memory BAR contains that
> >> structure, and not unrelated data that happens to be correctly
> >> formed?
> >
> > Sorry for the delay, I lost this email while I was travelling.
> >
> > I don't have an answer here. The driver is supposed to search for
> > VIRTIO_PCI_CAP_BAR_MAGIC at offset VIRTIO_PCI_CAP_BAR_OFFSET, which
> > could exist independently.
> >
> >>
> >> From what I can tell, feature bit 31 is currently not used for any
> >> purpose.  Setting it could be used to indicate that the structure
> >> is present.
> >
> > Do you mean have the driver probe for feature bit 31 (after searching
> > for VIRTIO_PCI_CAP_BAR_MAGIC at offset VIRTIO_PCI_CAP_BAR_OFFSET) to
> > confirm that it is supported?
> >
> > Alistair
>
> I meant having a feature bit that is compatible with the legacy
> interface, but which tells the driver that the device is really
> a modern driver with its common configuration capability in a
> specified BAR.

Ah! That's a good idea. That should mostly work.

One issue though. When using an older driver (that doesn't know about
this new feature bit) what should happen? In theory the device is
advertising the legacy flow with bit 31 set. So the driver will just
use the legacy flow and ignore bit 31 being set.

But in reality the legacy flow doesn't actually work, so if the driver
tries to set things up it will crash or hang or error. Maybe we can
just report an error on the first operation or something, but it does
seem a bit clunky

Alistair

> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)
