Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A5B4611CF
	for <virtio-comment@lists.linux.dev>; Fri, 15 May 2026 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842019; cv=pass; b=gArhDGhgoB15KLFZAwMhvV5eRXzwnjJLqKaxOEGsq78Bfx1XIFTSqhz8p6/p+/IaUeb8qpk7hnuYqAnN/pz+Fz6re0iDU5tzlnaWzuY982HKMQEnmCKoarDQa/DBT0SrrqHoM4C1API+HqZ6m9/HU9mPKv801a47+6cWwiptTkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842019; c=relaxed/simple;
	bh=k9b5uw7SgzEvQLtzmAwYzvfCmM7fXx6DAPPwIFlu8gk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=doUkCZigcSNTJoa3ZoPZgy5xuuDaARKGLOuJBg0Gy7URFGmVE+T8O6X3VOPapM79p4uRj1gXOlIl+wTFPH8X0YoDfTRt7NWyFHMkO0YWKbFxzsDQ6+Uwl0rIqUR0n8reHycixqpPVjTKaHoOcEqg45mziCV2KQE96BkCYK9YYzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RNcbLehu; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RNcbLehu"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso79872535e9.3
        for <virtio-comment@lists.linux.dev>; Fri, 15 May 2026 03:46:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778842016; cv=none;
        d=google.com; s=arc-20240605;
        b=UBvyfFxw6mN7t0MbM4VObO+DnlMyYhyoGBofAIWecitOMGan2pIyyLgo+IluJEcIHA
         d7smOMDkKy8vRm50nhKwCQ1kVFMoa7CVNciYp+6EpD6OtRLxz30bd1EAH8Wa/iIksDT8
         kNDK1L12Bja48a2qO1PSduGiC5v/RhovNeQtuXtSO9bb2Hieyfs1O3DpVWyFEzfkvxYE
         jOfBpEb18OxzrlMUdwUO0WPExdUxG8zViY4GxKIX97G5o5hauuN86ZJtBp1vTC7AzL5Q
         XEcQgP5lAMmtb0brO4aC6ibDQ8bsyIaXuRPTGkjIdeGI+wCUJ2aLjVzjMWoPRc0DRJok
         3TVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D/tmyg1Ar/jX4X+MLWsqyOVI40ajd2xDTw3uQ78OY20=;
        fh=rjBb7IxhhnsGnt8HksEH6pMEU66l46qhxJFEEALZbJk=;
        b=dIULa/YluHJyoHKGRr2MuXqIEmRtMp/MKZRcREPcEW0IPXVpTSppv74yJMEBcBKYyU
         TkPt1Ft0YNLRhVQaHrznIgXjDmPJ8nA1VT5WHfqA1phLWcIVnhvDdzHCkd+S4xPzmNuU
         cikqKTsNmSuHG4nXmx2l/1wMHYC61tVH8ULNfTyqk8RYQqcbMZrdTvWoMmRqldJBzEFi
         +T1yaeiO36Tl4DhrcdCtCirBxKaOGgR2pmLzsrs5MyES8Dy377PJRLigBG1DZTj0rNdF
         LBBKOFQlr+OKwpxwEzy63+zVgztIDpc8OEG/efYQhtmIKFQBVvpUvhTYbP86kR7dN88L
         OMjA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778842016; x=1779446816; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/tmyg1Ar/jX4X+MLWsqyOVI40ajd2xDTw3uQ78OY20=;
        b=RNcbLehuaOKRxWlSsap/U1ue3rxFg11gN1vz67c/oMNaTglI/V9swhUmI00SRqgkZZ
         GejyU/d8civ8B7x/DuUJXefNxRABDRa8Gr8JzelBz69HW6F1N13hTlQ7bq9VBSk0D5+e
         xwE+wnVgPgbq/dR/a+RHzvipCpAJo/8T7U8EY4Bt59zuOZEpYWIuwoVIGqbNO1jcLOC8
         G18Sc1mO4teCwjlTrzIsrRRG96X4PzxysNHlHXqUDlrE95jIBKdZEA0zQSa9giKuJtzM
         YW5EqIvBP9LxBouCEAVb45p4bhHU6mwG4DXq21St26dUbPeguLzC0QF8RE1aAHljkhOX
         V5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842016; x=1779446816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D/tmyg1Ar/jX4X+MLWsqyOVI40ajd2xDTw3uQ78OY20=;
        b=OC3USb4eLb4FLbnRwWDlrDLP1xyZs+U8uLrEwKPXMS6XQGuPifyi/4KjgNNPsdI/KU
         UdGAFX1g5ycfw8+1UqRF6hoQl1qu7bvgKAB9yW6+hPdxGZ40PDzvdhbx1aNgxsKPBXSD
         cTOp4go2j7XbXFvfbjapxVbJ7F3e6ZZoqxzp/QLebVx3A+Sz/PMydDUpDZ3zQS61fcvL
         MxSqAjcg+5Wlw+3kwvgpWnY/OxkhCM/alGHxow3NYyMJ+kW2Jp5FMSJBHZoN7X05U/DQ
         9yu3dCOuzYLX2iPgIs3d6U+QGl6geuawtDjBPO8kp/0kA5LRkyJRQCdEbdscbVqvePml
         UDaQ==
X-Gm-Message-State: AOJu0Yy4IkRTeTrDtXpI557vR2Fjre1KSL0gb3G9dKcTS07FEzLa4q8N
	D23aqhbbNQX/pCmxL9HXglO6wnNgDO9TkAGViYpUfrDg2H6VzmZ0LEW9BP5oXPN7USmm+WIzeZz
	1RGvBUjmQ0NN0xrXaoPperL9UgdEanYkt/ClV1j7gzA==
X-Gm-Gg: Acq92OGseDnz3OXiOsm9K3iQLZy0QwZj3e4jlPh51ZnVyKnWLTwVOSrkdbXoh3NWpJn
	7h8JJsat32svx/mcwP0QiivxKX63CYpJorIx6fKuzSMavdrbobKhokhTjmg1SkGA62HfBAVMbjD
	oNpBW9CXwJzR6A0KvCc0UUUkDHtacsZZcC2Z83pgSGLxuDKxEctMtuhTThADkpSNRsUr2oWEOTG
	mGXDWhG4mEpGRNzd90AvRiS7RUXcJ0fwCq67MkMqp6kAUaNCNBZSz4BVYt0oTnzD9g6TBu9YjvQ
	smjg+zWrOGGiGcfIzAiUrcPPdJGdGHK2MHNioB7PnN1sq8vjcw==
X-Received: by 2002:a05:6000:2083:b0:452:d03a:7aad with SMTP id
 ffacd0b85a97d-45e5c5daea5mr4695466f8f.36.1778842015913; Fri, 15 May 2026
 03:46:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1778140241.git.mst@redhat.com> <b29dee815f250b3332651a1a5aeabc4e49ec6914.1778140241.git.mst@redhat.com>
 <CAAjaMXZggBhThMSrR8-YWx=AZDi00hm9or6CSB+v3xgjvbaotg@mail.gmail.com>
 <20260515052118-mutt-send-email-mst@kernel.org> <CAAjaMXYMOjxEL6uwVgzmfiH0PDkkdOrsCw2AzwOgj6Oie3D7Xw@mail.gmail.com>
 <20260515052929-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260515052929-mutt-send-email-mst@kernel.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 13:46:30 +0300
X-Gm-Features: AVHnY4J5HF35Njija5-4T-b3VBjjBa93M_kRH3wgKFwsnVU3bgXkV9YLge-3rT8
Message-ID: <CAAjaMXapPMMyY+BPrV=hdgy5+NF6bOUNOTGEfnMh7KJqms4XjQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 12:35=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Fri, May 15, 2026 at 12:28:14PM +0300, Manos Pitsidianakis wrote:
> > On Fri, May 15, 2026 at 12:23=E2=80=AFPM Michael S. Tsirkin <mst@redhat=
.com> wrote:
> > >
> > > On Fri, May 15, 2026 at 12:09:24PM +0300, Manos Pitsidianakis wrote:
> > > > On Thu, May 7, 2026 at 10:52=E2=80=AFAM Michael S. Tsirkin <mst@red=
hat.com> wrote:
> > > > >
> > > > > Add VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE (bit 7): the device
> > > > > initializes inflated pages and returns a per-page bitmap indicati=
ng
> > > > > which pages were successfully initialized.
> > > > >
> > > > > Update Security Considerations Data Integrity subsection to cover
> > > > > both DEVICE_INIT_REPORTED and DEVICE_INIT_ON_INFLATE.
> > > > >
> > > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/242
> > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > ---
> > > > >  device-types/balloon/description.tex | 73 ++++++++++++++++++++++=
+++++-
> > > > >  1 file changed, 71 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/device-types/balloon/description.tex b/device-types/=
balloon/description.tex
> > > > > index fa33105..7afdb24 100644
> > > > > --- a/device-types/balloon/description.tex
> > > > > +++ b/device-types/balloon/description.tex
> > > > > @@ -52,6 +52,9 @@ \subsection{Feature bits}\label{sec:Device Type=
s / Memory Balloon Device / Featu
> > > > >  \item[ VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED(6) ] The device ini=
tializes
> > > > >      reported pages.
> > > > >
> > > > > +\item[ VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE(7) ] The device i=
nitializes
> > > > > +    inflated pages.
> > > > > +
> > > > >  \end{description}
> > > > >
> > > > >  \subsubsection{Feature bit requirements}\label{sec:Device Types =
/ Memory Balloon Device / Feature bits / Feature bit requirements}
> > > > > @@ -249,6 +252,10 @@ \subsection{Device Operation}\label{sec:Devi=
ce Types / Memory Balloon Device / D
> > > > >  and before detecting its physical number in a deflate request
> > > > >  and acknowledging the deflate request.
> > > > >
> > > > > +If VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE is negotiated, the
> > > > > +device MUST NOT modify a page after reporting it as initialized
> > > > > +in the bitmap.
> > > > > +
> > > > >  \paragraph{Legacy Interface: Device Operation}\label{sec:Device
> > > > >  Types / Memory Balloon Device / Device Operation / Legacy
> > > > >  Interface: Device Operation}
> > > > > @@ -672,6 +679,67 @@ \subsubsection{Device Initialized Reported P=
ages}\label{sec:Device Types / Memor
> > > > >  If VIRTIO_BALLOON_F_PAGE_POISON is not negotiated, the device
> > > > >  MUST fill each initialized page with zeros.
> > > > >
> > > > > +\subsubsection{Device Initialized Pages on Inflate}\label{sec:De=
vice Types / Memory Balloon Device / Device Operation / Device Initialized =
Pages on Inflate}
> > > > > +
> > > > > +When VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE is negotiated, the
> > > > > +device initializes inflated pages and reports which pages were
> > > > > +successfully initialized via a per-page bitmap.
> > > > > +
> > > > > +The driver appends a device-writable bitmap buffer to each infla=
te
> > > > > +descriptor chain, after the PFN outbuf.
> > > >
> > > > Maybe we could say "page physical number" instead of PFN to stay
> > > > consistent with the rest of the balloon spec.
> > > >
> > > > > The bitmap contains one
> > > > > +bit per balloon page (4KB), where bit N corresponds to the Nth P=
FN
> > > > > +in the inflate request (0-indexed). Bit N is stored as bit (N mo=
d 8)
> > > > > +of byte (N / 8), with bit 0 being the least significant bit.
> > > > > +The device sets a bit to 1 if it successfully initialized the
> > > > > +corresponding page, or 0 if it did not.
> > > >
> > > > Does this mean page size cannot be larger than 4kb?
> > >
> > > With legacy balloon, pretty much.
> > > This hack of sticking right-shifted PFNs in an outbuf
> > > is a broken interface that can't even support large guests.
> > > If someone worked on a better one, would be great.
> > > But for now, this just supports zero reporting with that.
> >
> > Makes sense. Should we mention it in the traditional balloon device
> > description? Or even put device and driver MUST statements that page
> > size is always 4kb.
> >
> > For this patch:
> >
> > Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> >
> > >
> > > --
> > > MST
> > >
>
> Well it says:
>
>   \item The driver constructs an array of addresses of unused memory
>     pages. These addresses are divided by 4096\footnote{This is historica=
l, and independent of the guest page size.
> } and the descriptor
>     describing the resulting 32-bit array is added to the inflateq.
>   \end{enumerate}
>
>
> having said that:
>
> - it should be "a device read-only buffer is made available in the
>   inflateq".
>
> - the text mixes "pages as in arbitrary chunks of memory" for page
>   hinting/reporting
> and
> - pages as in 4k chunks for inflate/deflate
>
>
> if there's work to modernize balloon, fixing these might be a
> prerequisite

Agreed
