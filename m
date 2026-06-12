Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3F83E2AB6
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jun 2026 07:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250569; cv=none; b=RBom3xzfQrxOMUFFfVSiWQPi+F7C3LMaMJUVcS64ZqJb6W+uRRf0pQgjDEAx4kx7EYoPUKct62q/hnLZ6yjgae4zMzChdy1Uwi/XcJgl/10L84Em6TSErFiS2f71LY/+PxTPQBaaMMV7A8zqm7AZISpQyya5ek6eSBelvmWsYQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250569; c=relaxed/simple;
	bh=Zybh23XowI2UiCaZZe6PX1GDO+B4UNQjyTF31bH+kq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=PnncmUclpC3DRD/9BkDkZVnSAAff+Yank9QfYTRKLbiGguCIjKz6OCI63ZX5ubHdMkntgt2epsWMsjK/VrIgPzp25aOkmym3cxU5Z8enTRJ1ki46dmeOc00VYkGvDvfsMspKLHv8bwK+MJyJ81BaLLE6n3ysGWILOBYD4VKJlrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZboAUpGc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZboAUpGc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781250566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8/CQVyzkU0UAPREehS/SE9ug4vHgXSzleoaRx+VNsGk=;
	b=ZboAUpGc8jiIhdbMD1kf+LjaA02FKuXmvSDccc0ftRdyzD+MivWZo/zKN8gf4lGiERf+gV
	ZUGyQTfWhNq+Prs3HjvrEVm0hUXEc2uOFHK5xBqqMSdQrKusT+l+qF1h/wmsaR7Pr3nnqM
	cY4wNV6ZeZMPSGM1FkACnscu1Im4Kp4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-C9bUcMZwMaOua-VM2_ZBUA-1; Fri, 12 Jun 2026 03:49:22 -0400
X-MC-Unique: C9bUcMZwMaOua-VM2_ZBUA-1
X-Mimecast-MFC-AGG-ID: C9bUcMZwMaOua-VM2_ZBUA_1781250561
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-460163035e3so387898f8f.2
        for <virtio-comment@lists.linux.dev>; Fri, 12 Jun 2026 00:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250561; x=1781855361;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8/CQVyzkU0UAPREehS/SE9ug4vHgXSzleoaRx+VNsGk=;
        b=tE6484GYGkdkERkE7GLy58QWAleW6Fkwj7Jw7g//Kc2X70xCLB9PHiXePK7eK9rCxs
         DpZfbKktBk3wXpWFdRXBaoKC3L+8vaL5igpYJzCqc2RU+g+NVTH79XUpfU5iGp1eDTzO
         corLf3zoIW65+TW+Gh2JLL4EZqYbU7tRwZ987uY7jgDe7BADKWMqVMtY9u2Nhw+9K4ue
         UeJ7TbvNpuXLhBk6pdR8VzKX9NTx2jL1TRVmil9QB0amWBboJFesGLJgPaf21lVHsPMp
         CnBaNcmo11Aa0cq8sYxd6L3LdcL1JjFquyU8EHqDspPrtUVDMkjrN+U2ktfFplyoUDAr
         aEdg==
X-Forwarded-Encrypted: i=1; AFNElJ8TYOVe9Ig7rCCbhvJdpeW7ajxJapTjljjrxsbbU5K9Kg/eH4mLOLB+jcqePzsRANSa/tAmh1nsOmUJilmwRA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv/EysS6MXptI9Qago5PpQFFp7R97SFd5rfo6VV8LGwKJhevlH
	PTLROx5IoZFQQV7ZLOVst8p09OIX0MBMJahib3Z4EY/HkW0u73MLtc1TAG6r1fI6SD0PKX8nmld
	op2TH74JSh/aiqGermz3hTadtnJ2KXSgRwMkC4ZXuJe6DpC7RYZ1fnHJqCSLeu7na7yD5
X-Gm-Gg: Acq92OFSZmYqGy+2Xg9Tk239Eo9KpVYlb71Gl14RYXSig6V0w/7SEDFecMi0wJzMuKf
	44D79aJP3MluJvEQIXXFQKT+hrApxqckQci+BoasKJGw4NirnNKF0+95NFP7Y8eoFF8G7c2w0RR
	pMxRGBwj9fWRdmuvMg1Y74bv/Pmt415B4uD+i01QPyMcEYtogzdQrqk3q8qTkjIWK5bDWsipSAB
	y3wuBM8tzfU3aZxRAkMaIgkaVTE9hNrSFQfCniEXursSKFLQYj+KAo7uTvCMHsis2hSMM4pWoaB
	QfjwdSEyskGK8ESWpTRfQ9EjlG13QIMukR9D8Ho4A8VTO+aGm6E6WPqiP5a9CBnNlq16vCDDV4P
	07Y8DHKUF8oAU/kSnBexZYI6TX9VHhaAWzN/rU/mqCOkFJb3nVxdqQyrQEAMFbfB5f2gJFTY=
X-Received: by 2002:a5d:5d0e:0:b0:460:3210:434a with SMTP id ffacd0b85a97d-4606dbc6b71mr2436917f8f.43.1781250560367;
        Fri, 12 Jun 2026 00:49:20 -0700 (PDT)
X-Received: by 2002:a5d:5d0e:0:b0:460:3210:434a with SMTP id ffacd0b85a97d-4606dbc6b71mr2436839f8f.43.1781250559362;
        Fri, 12 Jun 2026 00:49:19 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-135-12.retail.telecomitalia.it. [82.53.135.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26393asm3159156f8f.5.2026.06.12.00.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:49:18 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:49:13 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, 
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Stefan Hajnoczi <stefanha@gmail.com>, Dorinda Bassey <dbassey@redhat.com>, 
	Albert Esteve <aesteve@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	qemu-devel <qemu-devel@nongnu.org>, virtio-comment@lists.linux.dev, dev@lists.cloudhypervisor.org, 
	rust-vmm@lists.opendev.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
	Demi Marie Obenour <demi@invisiblethingslab.com>, Alyssa Ross <hi@alyssa.is>, 
	Mark Burton <MBURTON@qti.qualcomm.com>, Matti Moell <matti@qti.qualcomm.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Sergio Lopez <slp@redhat.com>, 
	Vishwanath Seshagiri <vishs@meta.com>, Rob Bradford <rbradford@meta.com>, 
	Zhengyu Zhao <zhaozhengyu@bytedance.com>, "Jorge E. Moreira" <jemoreira@google.com>
Subject: Re: Where should the vhost-user specification live?
Message-ID: <aiu26_Ha5NvyZUI0@sgarzare-redhat>
References: <20260601160352-mutt-send-email-mst@kernel.org>
 <CACzuRyxedVMHNGkRf7AVyPWUTMgBMa6_DBnSHn+V6H7wN7XzWw@mail.gmail.com>
 <20260604162853.GC115597@fedora>
 <CAJSP0QXR6MyqoE1Uh-X7DzsOabbbN69TUyxf8r6ghUDCQnrP=w@mail.gmail.com>
 <CAFEAcA_Kd5_k+XyagUbB2+YVEMB0Sb0AB=oUZu6bGDot9TaFrQ@mail.gmail.com>
 <CAJSP0QVuSvVwa1szAy_3WVtWOjGK=oYAXjqAzbg5YoEvgybRjA@mail.gmail.com>
 <CAFEAcA9ZkbNK5kRL5+OiqgN2hk3JAmFN8Qd3cytqyTEm9hBkvg@mail.gmail.com>
 <aikiB90tij642pEZ@redhat.com>
 <20260611203915.GB237427@fedora>
 <20260611164404-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260611164404-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NRsV7wLXpI0vXKJg8JbzYrhS7dD7bYM0vmEqeuKISFk_1781250561
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jun 11, 2026 at 04:45:10PM -0400, Michael S. Tsirkin wrote:
>On Thu, Jun 11, 2026 at 04:39:15PM -0400, Stefan Hajnoczi wrote:
>> On Wed, Jun 10, 2026 at 09:37:10AM +0100, Daniel P. Berrangé wrote:
>> > On Tue, Jun 09, 2026 at 08:51:15PM +0100, Peter Maydell wrote:
>> > > On Tue, 9 Jun 2026 at 20:45, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>> > > >
>> > > > On Tue, Jun 9, 2026 at 2:51 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>> > > > >
>> > > > > On Tue, 9 Jun 2026 at 19:00, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>> > > > > > I'm not sure if anyone brought up this topic on qemu-devel and with
>> > > > > > Michael before. As I mentioned in my reply, there are ways to avoid
>> > > > > > blocking vhost-user spec changes when qemu.git is frozen:
>> > > > > >
>> > > > > > The simplest approach is to keep merging vhost-user.rst changes during
>> > > > > > freeze since it does not jeopardize the release or introduce
>> > > > > > instability.
>> >
>> > snip
>> >
>> > > I tend to view the specs subsection of the docs as being
>> > > for things where either QEMU really is the authoritative
>> > > source (eg fw_cfg), or where the spec is for something that's
>> > > basically moribund and has no better home. If vhost-user is
>> > > a cross-project specification that it so active that it
>> > > cannot live within QEMU's release process, then I think
>> > > it deserves to have its own independent home.
>> >
>> > Yes, the main impression I get having read through this whole thread
>> > is that vhost-user spec should have its own home outside QEMU.
>> >
>> > We can come up with all sorts of rationalizations for how to make
>> > things work in the context of QEMU, but they all just come across
>> > as excuses to avoid changing the fairly arbitrary historical use
>> > of qemu.git. Even if as QEMU maintainers we consider that we're a
>> > "neutral" home, I can understand why it might not be perceived that
>> > way from the outside.
>> >
>> > If people want agility such that we need to make exceptions for
>> > our rules during freeze that is one flag that it doesn't belong
>> > with the main qemu.git, but there are broader points that are
>> > pushing my view in that direction too.
>> >
>> >
>> > Not mentioned is that engaging with the QEMU mailing list as a
>> > non-regular QEMU contributor is not a very attractive task.
>> > While QEMU may be satisfied with email, QEMU are in a tiny
>> > minority these days. The rest of the OSS community has
>> > decided that git forges are the better way to collaborate.
>> >
>> > Our dev list is very high volume, with changes very easily (and
>> > often) lost in the noise, even from regular contributors, such
>> > that we have to teach people to (repeatedly) "ping" to attract
>> > attention.
>>
>> A separate repo in a git forge definitely has the advantage of making
>> communication easier to follow for anyone interested only in the
>> vhost-user protocol.
>>
>> > If we want agility though, IMHO it is best to stay away from the
>> > bureucracy of the OASIS virtio spec / committee, which is a big
>> > turn off IME.
>>
>> Yes, OASIS adds overhead.
>>
>> The downside is that vhost-user suffers from being outside the VIRTIO
>> spec umbrella. It's really a VIRTIO Transport and would benefit from the
>> discipline of actually being part of the spec as such. At the moment
>> vhost-user is not really bound to VIRTIO through any interface (i.e.
>> VIRTIO Transport) or device lifecycle that is guaranteed to align with
>> the VIRTIO spec. This has led to both design problems and bugs that
>> would be prevented by making it a VIRTIO Transport.
>>
>> In addition to the OASIS overhead you mentioned, the other issue is 
>> that
>> moving vhost-user into the VIRTIO spec would require reconciling the
>> the vhost-user protocol with the VIRITO Transport's interface and also
>> rewriting parts of the vhost-user spec that are not up to the level
>> (e.g. adding conformance clauses, eliminating some informal language,
>> etc).
>
>And possibly getting an agreement to OASIS IPR from major past contributors.
>
>> In other words, it's a bunch of work. Although from a purist perspective
>> I think it's the right place for vhost-user, I think it would be an
>> unpopular solution.
>>

Yep, agree on this.

About the current workflow, Working on both QEMU and rust-vmm, I've seen 
people a bit scared by the QEMU review process when all they want is to 
propose a protocol change. As Daniel pointed out, our mailing list is 
high volume and unfamiliar to many. That's a real barrier both for 
contributors and perhaps also for those who would like to follow the 
development.

What about creating a new organization (e.g. "virtio") on gitlab or 
github, and hosting the vhost-user spec there in its own repo, using 
MRs/PRs for changes?

Under the same organization we could keep a read-only mirror of the 
OASIS virtio-spec repo. That wouldn't change virtio governance in any 
way, OASIS stays the authoritative source, but it gives a single place 
to find everything virtio-related.
As a side note, it could also serve as a starting point if the virtio 
community ever wanted to move the spec outside OASIS, but that's 
a completely separate discussion and not something I'm pushing for.

For the vhost-user spec itself, I think we should invite co-maintainers 
from other projects, and keep requiring a broadly complete 
implementation before merging non-trivial spec changes, but that's what 
we already tried to do for both vhost-user and virtio spce changes.

That said, honestly, this might lead to fragmentation (although the goal 
is to create a single hub for virtio), so perhaps the idea of having a 
repository in QEMU gitlab or rust-vmm github might be better.

I'm happy to help with the setup if we reach consensus.

Thanks,
Stefano

