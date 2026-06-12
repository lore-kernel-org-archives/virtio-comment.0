Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518E13812F2
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jun 2026 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256676; cv=none; b=E1bwCUS8cMuz7lw8GOYbi/PzDw49AcsXYcst/Gg4NtZv18knEYuhRepUh7563RhZG22y9p874BawsDYI4JjSUfU356plGXuCBAwC7WExHKVlglfTPtTf7cZWt1KswWL/h2XGD8hppTxNhOSXhvtxt/OYJPWC8BcXKJ4QIgkPJaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256676; c=relaxed/simple;
	bh=4ugUvZ8pmP5tA3+NjmnLX/ds4sniDzhyr85r315k2Pw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rVjiQUxgGEo7JyNyG4mgwfG0gn1KYYy7Ogno1H4qEbok+XUHbV/B6PJhIovlnnBDro9NaueGsCHcdbYt5trKmRJUA3ZXhBaeDMX9uxhOrsIN6CI80CAKQNbTLV28W7LXsrONc5eRTcZCvrT8Htd75Xi4MQD7S8a88aig7wOBuLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cOrMmYON; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cOrMmYON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781256674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ugUvZ8pmP5tA3+NjmnLX/ds4sniDzhyr85r315k2Pw=;
	b=cOrMmYONrA516QY1MUYykLA+Rt4ndFAkSBc7EDfGFP+ee+lZZY2ptlwO/IPVYXO8isXHon
	BveqDPBIkEiMovyCSkgn8kzDsC2R/OfIGl+QDYSx1LsE1+Xaos1WrkyQlstIJj1d3LawOb
	BWbH5gRMjoyD/Hl/QRnVv4xNfXiecWI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-3-dIQpVCNoaGOj-GvdcP9w-1; Fri, 12 Jun 2026 05:31:13 -0400
X-MC-Unique: 3-dIQpVCNoaGOj-GvdcP9w-1
X-Mimecast-MFC-AGG-ID: 3-dIQpVCNoaGOj-GvdcP9w_1781256672
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517787172b0so12331841cf.0
        for <virtio-comment@lists.linux.dev>; Fri, 12 Jun 2026 02:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256672; x=1781861472;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ugUvZ8pmP5tA3+NjmnLX/ds4sniDzhyr85r315k2Pw=;
        b=k/S9q5WVTqi/vH1WhYKgFGetFJY7QGc0XDlmX6BRpSr1KxCUqw4W28eNxSbCju9sh4
         G+6FHvYY/9gX3/5/KMKgtxKK5SbRe7aBra3h9RR8hnNua1RwBtz+X0Ur89uXUEPvS8AO
         50MqNtVPzmidl+M3RLAi+Ejpe84af95r3WyHbTKWENYCZxrPKjBna4nOp1P9q7pzG3uY
         4/GV6aVGqvSfegrnCSDE8bWcBV1uaB86Q07/eK5jGQOXjVtwfAh3FGprGyIIIj8fxl4+
         B6A+yDjbQ1gIYBJwbXl763S/0JgmbTaO8cL27H+Dr8O1VQdhXv2nA5sIALAZN6BKY4sq
         7l/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9FGu0YAk1ypCNiEihcHsy5EaoP6vBVm3zpg36rj3tNSsuyoCmn4vVaj/IO/kbSZ180D2EnUdG2TFWCvWMTcA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsZrKJQ0lzQX10fowrtbU1sdcbbp135O6YZaQu/foJdMJGIQgB
	J8KS/qJlKIXlySzLZ4u0fcsn2YmXiH8rTNDp0ingDWwkR0znXomePe6vHDN7I8biTc5Y2LT2jVG
	iTGokiEB78IU0Poc3ybpy2eO2mC9yWWuCybCbbRMxsztaTd3GhyJYiZKIYQA7Cn8nj331X0u68X
	plfxgGxPgCzj3uNlv+aEycdxX8Vddi6yTaY6EZ1pc4XMLRC2bz1eX2xg==
X-Gm-Gg: Acq92OEhzmoxGUYGlolkaOZz6rnDnP2G6+nvmnjyr5121wPTBe6tTJljSfGJxoir1EN
	ofZxt/7rBBZEyoQuha1x1YaWT4tIZ9uKVj+rjxln4/RLtj852QiiCHp/tSIno9bPMQ3ybq8eQWJ
	AL29tpUl6SMOuagiyZ4WMxbxSnbe9vz4hBtpyPIdIMOg93EBUVZtLUcUX8Lo2KRN7mjiYSWBojY
	jgZ
X-Received: by 2002:a05:622a:8c19:b0:516:e136:5fcf with SMTP id d75a77b69052e-517fe2449a4mr26475611cf.14.1781256672358;
        Fri, 12 Jun 2026 02:31:12 -0700 (PDT)
X-Received: by 2002:a05:622a:8c19:b0:516:e136:5fcf with SMTP id
 d75a77b69052e-517fe2449a4mr26475201cf.14.1781256671917; Fri, 12 Jun 2026
 02:31:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 12 Jun 2026 05:31:11 -0400
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 12 Jun 2026 05:31:11 -0400
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <20260611203915.GB237427@fedora>
References: <CADSE00+ziHc8W2FqNT-aJU0Lt4sZ=NfQLc65m16vpT++pZM+xQ@mail.gmail.com>
 <20260601151815.GC411459@fedora> <20260601160352-mutt-send-email-mst@kernel.org>
 <CACzuRyxedVMHNGkRf7AVyPWUTMgBMa6_DBnSHn+V6H7wN7XzWw@mail.gmail.com>
 <20260604162853.GC115597@fedora> <CAJSP0QXR6MyqoE1Uh-X7DzsOabbbN69TUyxf8r6ghUDCQnrP=w@mail.gmail.com>
 <CAFEAcA_Kd5_k+XyagUbB2+YVEMB0Sb0AB=oUZu6bGDot9TaFrQ@mail.gmail.com>
 <CAJSP0QVuSvVwa1szAy_3WVtWOjGK=oYAXjqAzbg5YoEvgybRjA@mail.gmail.com>
 <CAFEAcA9ZkbNK5kRL5+OiqgN2hk3JAmFN8Qd3cytqyTEm9hBkvg@mail.gmail.com>
 <aikiB90tij642pEZ@redhat.com> <20260611203915.GB237427@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 12 Jun 2026 05:31:11 -0400
X-Gm-Features: AVVi8CcKM1kpWzrfDXUOp8c4BzZOhBeMjK7lIC_DI4Oy3zorwd53Uql1rJXjLDM
Message-ID: <CAAiTLFW0oMWWhKnkvtRHPqT-7eUX3vxbyDxeRJiad-sURYj==w@mail.gmail.com>
Subject: Re: Where should the vhost-user specification live?
To: Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Hajnoczi <stefanha@gmail.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Dorinda Bassey <dbassey@redhat.com>, Albert Esteve <aesteve@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel <qemu-devel@nongnu.org>, virtio-comment@lists.linux.dev, 
	dev@lists.cloudhypervisor.org, rust-vmm@lists.opendev.org, 
	Stefano Garzarella <sgarzare@redhat.com>, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
	Demi Marie Obenour <demi@invisiblethingslab.com>, Alyssa Ross <hi@alyssa.is>, 
	Mark Burton <MBURTON@qti.qualcomm.com>, Matti Moell <matti@qti.qualcomm.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Vishwanath Seshagiri <vishs@meta.com>, 
	Rob Bradford <rbradford@meta.com>, Zhengyu Zhao <zhaozhengyu@bytedance.com>, 
	"Jorge E. Moreira" <jemoreira@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KGpJ1qWrxy9eqph-ybikff2jgHBIu78oIYuW78ZCDpo_1781256672
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

$Stefan Hajnoczi <stefanha@redhat.com> writes:

> On Wed, Jun 10, 2026 at 09:37:10AM +0100, Daniel P. Berrang=C3=A9 wrote:
>> On Tue, Jun 09, 2026 at 08:51:15PM +0100, Peter Maydell wrote:
>> > On Tue, 9 Jun 2026 at 20:45, Stefan Hajnoczi <stefanha@gmail.com> wrot=
e:
>> > >
>> > > On Tue, Jun 9, 2026 at 2:51=E2=80=AFPM Peter Maydell <peter.maydell@=
linaro.org> wrote:
>> > > >
>> > > > On Tue, 9 Jun 2026 at 19:00, Stefan Hajnoczi <stefanha@gmail.com> =
wrote:
>> > > > > I'm not sure if anyone brought up this topic on qemu-devel and w=
ith
>> > > > > Michael before. As I mentioned in my reply, there are ways to av=
oid
>> > > > > blocking vhost-user spec changes when qemu.git is frozen:
>> > > > >
>> > > > > The simplest approach is to keep merging vhost-user.rst changes =
during
>> > > > > freeze since it does not jeopardize the release or introduce
>> > > > > instability.
>>
>> snip
>>
>> > I tend to view the specs subsection of the docs as being
>> > for things where either QEMU really is the authoritative
>> > source (eg fw_cfg), or where the spec is for something that's
>> > basically moribund and has no better home. If vhost-user is
>> > a cross-project specification that it so active that it
>> > cannot live within QEMU's release process, then I think
>> > it deserves to have its own independent home.
>>
>> Yes, the main impression I get having read through this whole thread
>> is that vhost-user spec should have its own home outside QEMU.
>>
>> We can come up with all sorts of rationalizations for how to make
>> things work in the context of QEMU, but they all just come across
>> as excuses to avoid changing the fairly arbitrary historical use
>> of qemu.git. Even if as QEMU maintainers we consider that we're a
>> "neutral" home, I can understand why it might not be perceived that
>> way from the outside.
>>
>> If people want agility such that we need to make exceptions for
>> our rules during freeze that is one flag that it doesn't belong
>> with the main qemu.git, but there are broader points that are
>> pushing my view in that direction too.
>>
>>
>> Not mentioned is that engaging with the QEMU mailing list as a
>> non-regular QEMU contributor is not a very attractive task.
>> While QEMU may be satisfied with email, QEMU are in a tiny
>> minority these days. The rest of the OSS community has
>> decided that git forges are the better way to collaborate.
>>
>> Our dev list is very high volume, with changes very easily (and
>> often) lost in the noise, even from regular contributors, such
>> that we have to teach people to (repeatedly) "ping" to attract
>> attention.
>
> A separate repo in a git forge definitely has the advantage of making
> communication easier to follow for anyone interested only in the
> vhost-user protocol.
>
>> If we want agility though, IMHO it is best to stay away from the
>> bureucracy of the OASIS virtio spec / committee, which is a big
>> turn off IME.
>
> Yes, OASIS adds overhead.
>
> The downside is that vhost-user suffers from being outside the VIRTIO
> spec umbrella. It's really a VIRTIO Transport and would benefit from the
> discipline of actually being part of the spec as such. At the moment
> vhost-user is not really bound to VIRTIO through any interface (i.e.
> VIRTIO Transport) or device lifecycle that is guaranteed to align with
> the VIRTIO spec. This has led to both design problems and bugs that
> would be prevented by making it a VIRTIO Transport.
>
> In addition to the OASIS overhead you mentioned, the other issue is that
> moving vhost-user into the VIRTIO spec would require reconciling the
> the vhost-user protocol with the VIRITO Transport's interface and also
> rewriting parts of the vhost-user spec that are not up to the level
> (e.g. adding conformance clauses, eliminating some informal language,
> etc).
>
> In other words, it's a bunch of work. Although from a purist perspective
> I think it's the right place for vhost-user, I think it would be an
> unpopular solution.

While I agree getting it into OASIS it's a lot of work and not something
particularly enticing, I also feel obligated to point that, in my
experience, vhost-user is not seen as an standard to be follow to the
same degree VIRTIO is across the industry.

If there's a lightweight mechanism for getting it included (as Michael
hinted there could be), getting vhost-user into VIRTIO could be useful
to strengthen and solidify it as an industry-wide specification.

Thanks,
Sergio.

