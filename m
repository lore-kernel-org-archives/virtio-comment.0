Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB472566
	for <virtio-comment@lists.linux.dev>; Mon,  3 Jun 2024 02:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717382231; cv=none; b=GgGQ+4K8wuRaEMYDcYVLGrjqxiJCxM0/LoDr5DpBNhdcjwcsliWAVemWLU80fvGO2yRGxVuNR9ZRwy8jpaUaxcg5Hm3om2dvwQ1kMdWus0FNCOhBoh/TV2/82sBpkEJkoLKREX1qib3mZwDEcy8eJG2oAXtOe6nCKoEeYdoLSkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717382231; c=relaxed/simple;
	bh=t4+3yN5/bycYNbQPWWyBxRNJF6R9Az2v7WvBa5FF6Tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ejxzNPu+JGRHJgEJm5tyWvRZVqYsr3pYO5ke5jNofMpHpuaM9J1vXNeeDYLrCHaVhwgytz+0Ug9h9JTjBIP9QXtgc0KzLlX4A0tcsYarWSmarJf14cRW/p1ojBtP5D7CzKrIJzs3qmgY4xP62R3LH9bEulUmf2Fn2w/S98QcGDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LkQ7VyfK; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LkQ7VyfK"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-43fe3289fc5so380101cf.1
        for <virtio-comment@lists.linux.dev>; Sun, 02 Jun 2024 19:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717382228; x=1717987028; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4+3yN5/bycYNbQPWWyBxRNJF6R9Az2v7WvBa5FF6Tk=;
        b=LkQ7VyfKGBZUYCfRMfAN0nnkqx8VdvtFV6Ntymaf7xE5TTlyZVoi2oqKjwamhz0A+7
         EYjjKzo2kPwnDbuNg1Lsxb/ECk0l8J4pnR9hRgkLp0FLn23yqyJdw2aoU0Akcd9LocQd
         kdLQXJjO3u13MQUxrchKM0GYrQuloaXE8d/9Po1SsjUvJ2/GeTTkUVpML0LqVLA+4fG0
         KWNjRqETvvVLEdhwIH38DxVhGdCBpniViCqHX0b8Skc3pc6PINt9BXZIQ2A8VzL+3yAZ
         p8SD4LgqHJO+UT1Tig+3C0pqqw9F1jPSjKaMY7zcmHQ5PjsTBjNZgTdzeOPoBTiV8mml
         /ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717382228; x=1717987028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4+3yN5/bycYNbQPWWyBxRNJF6R9Az2v7WvBa5FF6Tk=;
        b=GxRuE+bbYgNpUNTfw6OoOPC+JXk4+hmaeBwDG40FkcUck65u21xOU8of3MlbdVlECU
         A7m4UUoF7U1emjFQxZghuvhppLzUiR1KcaOjusBkYDJaOSKVK1Qu03LjGvlwauQDMnY1
         GvThteLsd+O1I8bgX4Do2SHcFeV66rC3MY3y6+MMcr+tkVn84KvbN0Veag1maP/5QNba
         6J/Vibj1+k5+NfemltKgQY1gueKi2rXCsGKbpmExMu25UzKDuoCHGyqDuzZALu8bWNfO
         15AiXjxKFCFhS+8F+4+Vc2Afii4PG0q4XttOLCbIhf933WithiYmsTT3TRe3VfllD/wD
         StVA==
X-Forwarded-Encrypted: i=1; AJvYcCXgXLIN+wpA+UoGFPaydV467cpWCq2CnQ9quGSTm4Fr3ZZ0dwGhlT6rc09gTxsclHkJfVUPGdURh0qJlzbBvOX1HTlz1Ptkrp00U95cPFs=
X-Gm-Message-State: AOJu0YyMZ1a4C2wK/81Mxuf9fYA6YWsXjE9+SuQJc68rgOocllFxjT4s
	zs7AdzGsTQWEcRNI9Z0ivsJtQYqgvJjAr4XTHjCpY37iXSz2yYO7+344awXN+NGG/W4Zg6XOC6f
	n3KUTuoiERK4o4B80pgcqTXDqnVSzKlPpMWL5
X-Google-Smtp-Source: AGHT+IHIc10+mQ+MsFy7o5Vr8o+6VkO8w09gTNCOUdZfk4VnftDXqwzmKnWPl5cTn+AlfGxzyLZSg//7rVgRk2NdThE=
X-Received: by 2002:a05:622a:2303:b0:43f:f9e6:26d with SMTP id
 d75a77b69052e-43fff39ec73mr3942721cf.29.1717382228309; Sun, 02 Jun 2024
 19:37:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com>
 <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com>
 <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com>
 <CA+FuTSfCm-GpLHYztQCxti2adCcFPV7GyKBH1zTDB8tM2w1NNg@mail.gmail.com> <CACGkMEthM=weSWrcsy035JLgOkhgpiudVANL-FAojki0Wr8dpw@mail.gmail.com>
In-Reply-To: <CACGkMEthM=weSWrcsy035JLgOkhgpiudVANL-FAojki0Wr8dpw@mail.gmail.com>
From: Willem de Bruijn <willemb@google.com>
Date: Sun, 2 Jun 2024 22:36:32 -0400
Message-ID: <CA+FuTSfRjLpFkpXaxptYR=w3+z8a+25y1V0QiNW5ZhjKOLwmHg@mail.gmail.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
To: Jason Wang <jasowang@redhat.com>
Cc: Paolo Abeni <pabeni@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 2, 2024 at 9:40=E2=80=AFPM Jason Wang <jasowang@redhat.com> wro=
te:
>
> On Thu, May 30, 2024 at 11:09=E2=80=AFPM Willem de Bruijn <willemb@google=
.com> wrote:
> >
> > On Sun, May 26, 2024 at 11:26=E2=80=AFPM Jason Wang <jasowang@redhat.co=
m> wrote:
> > >
>
> [...]
>
> >
> > > I meant, virtio is not necessarily for a software implementation.
> > > Various hardware vendors started to implement it as well.
> > >
> > > I wonder if hardware is as flexible as Linux to support general UDP
> > > tunnel offload.
> >
> > Do you mean TSO with tunnels? Using software parser mode,
>
> Is "software" here mean the driver?

Yes, software parser mode (swp) implies suppressing any protocol
parsing by the device, and instead make the driver explicitly pass the
relevant offset(s) in the descriptor.

There are some references to swp in the Linux mlx5 driver, for one example.

> > devices can
> > support that. See also protocol independent segmentation offload
> > (PISO, https://www.opencompute.org/w/index.php?title=3DCore_Offloads#Pr=
otocol_Independent_Segmentation_Offload)
> >
>
> This is great, does the whole idea of core offloads has the plan to
> release something like ABI (where virtio-net can just transport it).

There is no plan to formalize the pattern further. The OCP spec stays
clear of specifying a concrete device API, down to struct layout,
which is vendor-specific. It only tries to list a baseline of features
that the APIs must support.

> Or virtio net needs to clarify such a mechanism with e.g CH/SP fully
> in the spec, so there would be no worries about whether we need a
> whitelist of the supported protocols etc.
>
> But we may have other corner case where it can break the migration
> compatibility due the limitation in the hardware resources:
>
> 1) maximum legal value of e.g piso_off
> 2) maximum #gso_segs support by the device
>
> etc.

True. This would ideally all have been captured in the v1.0 OCP spec.
But it sounds like we need to refine it.
