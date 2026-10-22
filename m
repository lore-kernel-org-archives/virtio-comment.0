Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792643463;
	b=k89uMbVsZaEvpkOsike0vdJ2mSO04tUpfXfbeZ80n+1DUeGaG9OjKSH3y6NLKstiOHEn
	 fSF+/8cfLcxy7sGuvcG6p3RRQTQvZniPuHd/W13BwhTs+qxlXOEf0ZVSB+nKSMo+yh8AM
	 VEvG1PWMXCWB58qipiRHhvljIoSH8gT98CQIvLfFRrLiMW2vK11tDSHLiQVQp9KuAk0ur
	 yEn8S3muPKRt/T1gSiZ2lXqIj3SV5MNfm7f8boKLsV1UY5YdKyV6T5BZ8C8VTbymR+sbK
	 FD/x7AJVFhXkC25k9fz9r1X+S0HM/LFUFo+pd5HugoIb2SrHHG3O4+l/0plVSk+YMAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792643463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=o2cuUb3fIBpmBZMnNliiugbhE0ixWqMcaM674GEUz/E=;
	b=yLrJME7fOpMPYuR9pWQZtSJAOmXXq+hjoTLuR/yyRfWAxvNkLekT5NwmD+lF0ui4SHmD
	 0ZUibx/Movsn97PEYFTRsy7JStb2a80Asi3NiSU2TDfcSvOwV45Qgnhrp9W92jKcKAIf0
	 K6mE3RyOLxQjG63DQ/jnHTZr4kwAnhhPh4sVes8joT2IKY0LGyguBO24TD4B//1HBlknM
	 EpRXUIrkKB9sm0QG3eYcfEQRpE1z8k7fDphzmTDyLjzGlICJfKkhx2nqONHV/q5sXl7Hz
	 OMZAep0oJlNMrilMXSDifcxp1UVOPEjkw8+i19o4TOrfb93msajIuM4uIENouOdoj9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="iLsssX/6";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE70606A319
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 04:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFE70606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iLsssX/6
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c247f6687dcso210183566b.2
        for <virtio-comment@lists.linux.dev>; Wed, 21 Oct 2026 21:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792643461; cv=none;
        d=google.com; s=arc-20260327;
        b=GcD89XzRarQhcmhlFACnfITwmJ30a9FZJhi5P3Pm6nU/X29tPxK1t0WV8kJ4/L0nQW
         N7etthORvo1/fSF69ZUkUi3BkRMW2bH6loNjNrBYcE7LC5BFTT/UMf15OMA2yo/ksi7p
         B3VUl+iT0SnSH/yEPD9MQP0w4Otf2jHpR0tl0gOYMLKZv5e8l51Okjg1TgEzzAS5yiBS
         29rQQWmVV/lq7c08Uy3hkIwqLTn6RiFabpCyfPllP+50WYWoATE4vvjYQccBSq/At8+C
         CtZV1bm8VYbG5nYqhFs5IU/+Uz6jXecu+xkWw0hy5S9Hq+7icZJJ1rNmgjrQWmawrYO+
         1L2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o2cuUb3fIBpmBZMnNliiugbhE0ixWqMcaM674GEUz/E=;
        fh=KFTUAOHA0mboQN8f5X8o5DlwbcCCWhFzqxv5rSBntes=;
        b=booGEoGwXJspPXwsiLXvjZrhKAs8cvzkoKPQQPgsPnXOkjyWN+unv8TeKx1tmTSQZY
         e2KIsqeKnbBajhs9NFnG87iRvdEH5GPB+xpwxDDMjDXM2X49scJ+Nb8PwtEM9y1dbDLy
         3xLLyRycUFnQ+Ci5OiFecBPoJBayHNJghWZFnb8uygB+evTV6FW3UEznRNx5FGXjSRBh
         rQFm0ER9N0Y3Zzclyh2qGKRBBm04G/TxeTQcBBgmzz9F6GPtWf2fK8MNaBYjxhg1JIlb
         tobISsdwcY+BNte732dWnOkfAUjei6WSLvCEWoDJGqk+geZaH7W89ou9YD4hT+rl6vHc
         GRrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792643461; x=1793248261; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o2cuUb3fIBpmBZMnNliiugbhE0ixWqMcaM674GEUz/E=;
        b=iLsssX/6CM760OcxLXXnShZ6nR3jR1f8+tH9u4GzGpfNHxoUweIKQcTQ3Otx8sgEGD
         xPh636Pna5ZFfx+u8whIEVXwX05gGR+PQOhQV7LbzsBWFUhBlLr3HbWcDO7yKUxgyYCV
         +ASv/er/XTVqmudAPdzzp77JkhHVCiHm9esTGwbAaopQH31/s9F+kn4RYoKOzrddWKMd
         SCipZUCUaEy1K3ZW6KWuRLxHSF7La6Gwn2TEjkWUIa7vpGztilF0MSc/z6J0XJxI9Y2K
         vmiboOGH20F10D4tfrxjksxgbkdjzafwX+ql7FTUjXAlIBWZewPRsOq3PXMiBUFYWqgF
         jeaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792643461; x=1793248261;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2cuUb3fIBpmBZMnNliiugbhE0ixWqMcaM674GEUz/E=;
        b=LY6tDV3v3YZaDU26B2Lbr4yxtuKnlS38kfOZWu62J8FZtMUdHh5m0lpiw8g8LR0atk
         hXhDcMw8hmU+XwcRI9ay7UMasWeqpJ15IsZ5ip45DwETio9z1pGFXfaH2n0Ilh5HfkEp
         cbZJDHBKy1MogeX4mXbdcgVGlQg5RblGSf5XMRR4atuh5etjY8gwq7KGJ/duOfYoGe5t
         r92iW4wf0BrGeCHKBpkd/WDc945dUOxCmW0hCR1YcdU83MkjGPGu0Ub9LOs1avN90Eky
         veXIbP0g/YJ43tpOEmKy/FAER2Mavc9c3tBdq9YMxqGoVv7Dj4REuH7zELIeG6bklBXs
         bl9Q==
X-Gm-Message-State: AFq9FYJ6orY4EYDKcRpjPD1cKJ4+sGgGPW/TGiwbH9WT/PVGH6UaZpmx
	TC88ZVtAvUfYSZGJJfS5c/53zu+8m0hkUTbhOrjWutW7OGERMu3K8CEV5VI8YZ89CVeSLJ5Iavm
	FKYbpmoOPMBGv3+rL2CIoq/ogjw/bKpc=
X-Gm-Gg: AYBFou2g0pAsDjD1lfpR801QxXXkEHQmdP7sK8puPhrHe6FjgRAJWSlrDfI/el9NUmD
	+4BMYwWnxQHWM/bNcj2Xta9SS2udGiL2mOBULyzDdKdLpSwbE9GmuM6I4hsDUfOCCr9zNseCUxw
	V8plCMrdITg6oZjOxxkACyL2UGtrSXoVdTi+db6GzUiSHzhMLPe1J24oJNM9b/TCrlKS9ZAiMz9
	LOHSqAGpK7uyBi1rESCj6/BzK0wejM0aCeA88ak32BE0vGHfdV+lJF13Tf5GvF+ffA00jWVnRTw
	41+w35LE7fdz0WCKzWicfNFHTsW4dp8Q/7rUPt4ouI3k3Y3Z2ArqC2leLD15AR7gnJmYt54TRqG
	lDg5S4/RfXdSziesTgGBzDgEWBoij7LS7H/QVhaKegrUh1/aczNtMWgqurIbUQVXEBBw=
X-Received: by 2002:a17:907:86a7:b0:c26:1648:a06a with SMTP id
 a640c23a62f3a-c4679684c8bmr345495766b.37.1792643460781; Wed, 21 Oct 2026
 21:31:00 -0700 (PDT)
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261002010456.2053759-1-alistair.francis@wdc.com> <1f656ebb-b547-41f3-9b4f-4f39b3836f37@gmail.com>
In-Reply-To: <1f656ebb-b547-41f3-9b4f-4f39b3836f37@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Oct 2026 14:30:34 +1000
X-Gm-Features: AclHuK-kLYOD5ovOOUTk9nnkzrV0cPUy8Ww0ipY2Iau9m16CII6ykqbefmnR8Gs
Message-ID: <CAKmqyKMvD7f+_dEqfx5FCCynV7h7z1=6N-qNG6tFD7ervPksXA@mail.gmail.com>
Subject: Re: [PATCH] transport-pci: Allow storing the configuration in the BAR
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: virtio-comment@lists.linux.dev, alistair@alistair23.me, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 3:48=E2=80=AFPM Demi Marie Obenour <demiobenour@gmai=
l.com> wrote:
>
> On 10/1/26 21:04, alistair23@gmail.com wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > Most physical PCI endpoint capable PCIe controllers do not allow modify=
ing the
> > capability list, and thus are unable to advertise the Common configurat=
ion
> > capability.
> >
> > This results in physical PCIe endpoints implementing virtio-pci falling
> > back to the legacy interface and then needing hacks to deal with DMA
> > issues [1].
> >
> > One solution to this is to allow the device to store the configuration
> > data in the BAR [2]. This can be used as a fallback mechanism so we
> > don't break any existing setups. New drivers and devices can attempt
> > to read the configuration from the capabilities first and then fallback
> > to the BAR.
> >
> > We also need to add a go_busy field so that the driver and device have =
a
> > basic message box to communicate. This is required for
> > device_feature_select for example.
> >
> > 1: https://lkml.org/lkml/2026/9/1/185
> > 2: https://lkml.org/lkml/2026/9/1/2370
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  transport-pci.tex | 85 +++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 85 insertions(+)
> >
> > diff --git a/transport-pci.tex b/transport-pci.tex
> > index 95b08b8..7d09169 100644
> > --- a/transport-pci.tex
> > +++ b/transport-pci.tex
> > @@ -262,6 +262,83 @@ \subsection{Virtio Structure PCI Capabilities}\lab=
el{sec:Virtio Transport Option
> >  fields provide the most significant 32 bits of a total 64 bit offset a=
nd
> >  length within the BAR specified by \field{cap.bar}.
> >
> > +\subsubsection{Virtio Structure Capabilities in a memory BAR}\label{se=
c:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Capa=
bilities in a memory BAR}
> > +
> > +Some devices, for example implementions using physical PCI endpoint
> > +controllers, are unable to add capabilities to the existing PCI capabi=
lity
> > +list. This means they are unable to advertise the virtio structure
> > +capabilities as described above.
> > +
> > +In this case a device MAY instead publish the same capability structur=
es in
> > +one of its memory BARs, at offset VIRTIO_PCI_CAP_BAR_OFFSET (0), prefi=
xed by
> > +the following header:
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_PCI_CAP_BAR_OFFSET 0
> > +#define VIRTIO_PCI_CAP_BAR_MAGIC  0x74726976 /* "virt" */
> > +#define VIRTIO_PCI_CAP_BAR_VERSION_ONE  1
> > +
> > +struct virtio_pci_bar_cap_hdr {
> > +        le32 magic;             /* VIRTIO_PCI_CAP_BAR_MAGIC */
> > +        u8 hdr_ver;             /* Version of this header */
> > +        u8 num_caps;            /* Number of capability entries that f=
ollow */
> > +        u8 go_busy;             /* Indicates to start an operation and=
 when it's ongoing */
> > +        u8 padding[1];
> > +};
> > +\end{lstlisting}
> > +
> > +The fields are interpreted as follows:
> > +
> > +\begin{description}
> > +\item[\field{magic}]
> > +        Magic value that identifies the presence of capabilities in th=
is BAR.
> > +        Must be set to VIRTIO_PCI_CAP_BAR_MAGIC.
> > +
> > +\item[\field{hdr_ver}]
> > +        The version of this header (virtio_pci_bar_cap_hdr), currently
> > +        only version VIRTIO_PCI_CAP_BAR_VERSION_ONE is supported.
> > +
> > +\item[\field{num_caps}]
> > +        The number of struct virtio_pci_cap entries that follow this h=
eader.
> > +
> > +\item[\field{go_busy}]
> > +        The driver writes VIRTIO_PCI_CAP_BAR_VERSION_ONE to this field=
 to indicate
> > +        that the device should take action. The device is considered b=
usy until
> > +        the driver reads this as 0.
> > +\end{description}
> > +
> > +The header is followed by \field{num_caps} struct virtio_pci_cap entri=
es
> > +(see \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / Virtio =
Structure PCI Capabilities}),
> > +the first of which begins immediately after struct
> > +virtio_pci_bar_cap_hdr.
> > +
> > +The entries are packed one immediately after another. Each entry is in=
terpreted
> > +the same as if they are in configuration space and locate the
> > +corresponding structure within a memory BAR.
> > +
> > +Note that the \field{cap_vndr} and \field{cap_next} fields are not use=
d in
> > +this case.
> > +
> > +For read-write communication with the device, for example \field{devic=
e_feature_select},
> > +the driver should set the value of the field then write the header ver=
sion to
> > +\field{go_busy}. This indicates to the device that an action is requir=
ed.
> > +
> > +The device will then read the fields, take action according to the sec=
tions above
> > +and when complete clear the \field{go_busy}. The driver MUST NOT read =
or write
> > +other fields until \field{go_busy} has been cleared by the device.
> > +
> > +Note the driver can write to multiple fields before triggering \field{=
go_busy}. The
> > +device MUST then take all actions before clearing \field{go_busy}.
> > +
> > +A device that publishes capabilities in a memory BAR MUST place struct
> > +virtio_pci_bar_cap_hdr at offset VIRTIO_PCI_CAP_BAR_OFFSET within a me=
mory
> > +BAR.
> > +
> > +A device MUST follow struct virtio_pci_bar_cap_hdr with \field{num_cap=
s} struct virtio_pci_cap entries.
> > +
> > +The device MUST provide the same capabilities it usually would, just i=
n the memory
> > +BAR.
> > +
> >  \drivernormative{\subsubsection}{Virtio Structure PCI Capabilities}{Vi=
rtio Transport Options / Virtio Over PCI Bus / Virtio Structure PCI Capabil=
ities}
> >
> >  The driver MUST ignore any vendor-specific capability structure which =
has
> > @@ -270,6 +347,14 @@ \subsection{Virtio Structure PCI Capabilities}\lab=
el{sec:Virtio Transport Option
> >  The driver SHOULD use the first instance of each virtio structure type=
 they can
> >  support.
> >
> > +The driver SHOULD first attempt to use the virtio structure capabiliti=
es in
> > +the PCI configuration space. If no common configuration capability is
> > +present, the driver MAY scan each memory BAR at offset
> > +VIRTIO_PCI_CAP_BAR_OFFSET for a struct virtio_pci_bar_cap_hdr whose
> > +\field{magic} equals VIRTIO_PCI_CAP_BAR_MAGIC. If found, use the
> > +capability entries published there as described in
> > +\ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device L=
ayout / Capabilities in a memory BAR}.
> > +
> >  The driver MUST accept a \field{cap_len} value which is larger than sp=
ecified here.
> >
> >  The driver MUST ignore any vendor-specific capability structure which =
has
>
> How is the driver supposed to know that the memory BAR contains that
> structure, and not unrelated data that happens to be correctly formed?
>

Sorry for the delay, I lost this email while I was travelling.

I don't have an answer here. The driver is supposed to search for
VIRTIO_PCI_CAP_BAR_MAGIC at offset VIRTIO_PCI_CAP_BAR_OFFSET, which
could exist independently.

>
> From what I can tell, feature bit 31 is currently not used for any
> purpose.  Setting it could be used to indicate that the structure
> is present.

Do you mean have the driver probe for feature bit 31 (after searching
for VIRTIO_PCI_CAP_BAR_MAGIC at offset VIRTIO_PCI_CAP_BAR_OFFSET) to
confirm that it is supported?

If that is what you mean I can add that

Alistair

> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)
