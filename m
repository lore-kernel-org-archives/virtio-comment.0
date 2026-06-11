Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4DB43D4ED
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jun 2026 20:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210722; cv=none; b=Y3zP/u7RJASJHMboxCaKuMr8xVIVViUF7CkcLK2Ho6MXOWLpytZdlf0HYV3Rl61bm7UcZ8ImcmlFxgqMXfwXBbphngaXXfjuSuiGo5jMAJ33M4T2LNe/gMfTcsrS8Ubd3+xqD1wqakBo9ICsZXr3hdT+rM1Bgf7K2b4a7TF3qHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210722; c=relaxed/simple;
	bh=J5zjZa31wbckDZYQ4MUe32xVTLk9CyCPQ2mCzuZO68g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=T7PZZ428HO9v9cr6YzjVD4jtgm6pw2Kv086C4nfAIcvzhn1HLhsYJVyRVrK1S6Y9w8lE9FQi8pr7LIm1GtAGesNOq6msWFnQIxmY6zECrNcktOP9WAQ1julC6RHqJUfYDEs5W3xuKZct9FEBhyOWPqZRKPWyRamttCEhXcakWzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FHi7bklL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FHi7bklL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781210718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4SEAS8aZnkjaNWH/Rng+G2KXsPMcTSf+NyRSf60JiCM=;
	b=FHi7bklL90YXyYHOCfc01s0L0Vdh8Thwyyf1UIPFgS499iNTBQOO9/UGhWPus+yw5wdoQP
	nQrRMTumye++gpbFNKw7jNCBICtQgH5FsvJGvc+fIe9WdXcwfi8tp5H2wAim3cLUbFy/n2
	gjsUMCj9nQOe91YsuiRffvPVjm4VCQQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-YXZPi0NdMKaaII71a3rElQ-1; Thu, 11 Jun 2026 16:45:16 -0400
X-MC-Unique: YXZPi0NdMKaaII71a3rElQ-1
X-Mimecast-MFC-AGG-ID: YXZPi0NdMKaaII71a3rElQ_1781210716
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-45ef3aeeb41so134904f8f.1
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jun 2026 13:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781210715; x=1781815515;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4SEAS8aZnkjaNWH/Rng+G2KXsPMcTSf+NyRSf60JiCM=;
        b=sOwbebethVvrMQfrMycd9ebO2/iK9k5887kFaS4ZqUOcvsBWghG6vytTksqNRPobhK
         gvEyWHduNDxqehvd0f90iinZwrdKkRIgOumKIDWsES/5NPivGOOQsllDPnbCzHrdZLIF
         g7tjVo1LUz1ylfk/awOXtGjD7VlIRqQVSUc6XDySiJCTSsCXgxs3pxefXOpgPu5pb0LL
         IV8RW+nOgZz+fVcT+tjaFIf3gzy1xZcbNyGBo11QOqYOoBxpR4qiVGZYxyIL2V9zXTdi
         Mv8ilm8rLw/P+nb/U+zJd4+TzyOHjCfwT+elBSroiD7ugH1oIldz5ycbMAtLjlQ0ckzM
         J8LA==
X-Forwarded-Encrypted: i=1; AFNElJ9bvaJGaD/XMp9W+mTuDpfUfB9Ne9myDLbyv7TtzyhNAu/KrtlaxmLBik7wtTGrUetsOQKvE8S6LQ4zK0DNeg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp2MOXoO12+E7vMDeHO9+u89ka046yQGyD75T5fQ2Vf/tndos7
	T6Sl4Rx7fDJHYudIp3/tny3c5yHzrSaXGP//VLs6kJjYu2WW1uAs8g2tyEVjj7g9Gfqol/oBQ3Y
	bX4bIsrj07BKA1oZGx0tvMAQ0g7TGy8z4Zp5fnEkWyvmEhJVnwFBd4qX/1uAUH1HRIhx+
X-Gm-Gg: Acq92OHecFhRb251a1spZ+M4lwvKnZRut9gZJRlpaQaf+rPDxgi3UL3WB0vL/XjZaSr
	FweCl3KJ4ChG++7hsbJLeJPwj7wzqlQpWlqs1DESYpWGEWzkKb0axvUKrQ91TyQOGalw4m2LC7O
	n2I5GTWtxODL9hFXVd+GKuZ0T8XerkhEKSVAs7uPunXtTnLfZ5tun34TqRr0OssfD/OWWsm6n0/
	05cFcD14hHpAzmn9pHE9yUr0BizbYvCasTcWOLuVGdfPYl6kH51G/ImXENeh3D6dAPuDDh0X6Zp
	LYdwlHU58d9SlIqQEdowTNIglKhIHHE1VwUbC3qXwZVAVNuoHOeMpmwOIIyxOxqE6RWsZyI1Tl7
	hB567y+TWBtfjnVNIhUUCAn2Ad3I+CAJJICMmLN3uVvg=
X-Received: by 2002:a05:6000:4284:b0:460:e00:121c with SMTP id ffacd0b85a97d-4606dbc6792mr15315f8f.28.1781210715310;
        Thu, 11 Jun 2026 13:45:15 -0700 (PDT)
X-Received: by 2002:a05:6000:4284:b0:460:e00:121c with SMTP id ffacd0b85a97d-4606dbc6792mr15278f8f.28.1781210714728;
        Thu, 11 Jun 2026 13:45:14 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606c0c2059sm1493714f8f.6.2026.06.11.13.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:45:14 -0700 (PDT)
Date: Thu, 11 Jun 2026 16:45:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@gmail.com>,
	Dorinda Bassey <dbassey@redhat.com>,
	Albert Esteve <aesteve@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>, virtio-comment@lists.linux.dev,
	dev@lists.cloudhypervisor.org, rust-vmm@lists.opendev.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Alyssa Ross <hi@alyssa.is>, Mark Burton <MBURTON@qti.qualcomm.com>,
	Matti Moell <matti@qti.qualcomm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Sergio Lopez <slp@redhat.com>,
	Vishwanath Seshagiri <vishs@meta.com>,
	Rob Bradford <rbradford@meta.com>,
	Zhengyu Zhao <zhaozhengyu@bytedance.com>,
	"Jorge E. Moreira" <jemoreira@google.com>
Subject: Re: Where should the vhost-user specification live?
Message-ID: <20260611164404-mutt-send-email-mst@kernel.org>
References: <20260601151815.GC411459@fedora>
 <20260601160352-mutt-send-email-mst@kernel.org>
 <CACzuRyxedVMHNGkRf7AVyPWUTMgBMa6_DBnSHn+V6H7wN7XzWw@mail.gmail.com>
 <20260604162853.GC115597@fedora>
 <CAJSP0QXR6MyqoE1Uh-X7DzsOabbbN69TUyxf8r6ghUDCQnrP=w@mail.gmail.com>
 <CAFEAcA_Kd5_k+XyagUbB2+YVEMB0Sb0AB=oUZu6bGDot9TaFrQ@mail.gmail.com>
 <CAJSP0QVuSvVwa1szAy_3WVtWOjGK=oYAXjqAzbg5YoEvgybRjA@mail.gmail.com>
 <CAFEAcA9ZkbNK5kRL5+OiqgN2hk3JAmFN8Qd3cytqyTEm9hBkvg@mail.gmail.com>
 <aikiB90tij642pEZ@redhat.com>
 <20260611203915.GB237427@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260611203915.GB237427@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lCZyFjyNsHZe86h83OFj7OTSlPr4hGKMBIGOtdoztfg_1781210716
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jun 11, 2026 at 04:39:15PM -0400, Stefan Hajnoczi wrote:
> On Wed, Jun 10, 2026 at 09:37:10AM +0100, Daniel P. Berrangé wrote:
> > On Tue, Jun 09, 2026 at 08:51:15PM +0100, Peter Maydell wrote:
> > > On Tue, 9 Jun 2026 at 20:45, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > > >
> > > > On Tue, Jun 9, 2026 at 2:51 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > > > >
> > > > > On Tue, 9 Jun 2026 at 19:00, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > > > > > I'm not sure if anyone brought up this topic on qemu-devel and with
> > > > > > Michael before. As I mentioned in my reply, there are ways to avoid
> > > > > > blocking vhost-user spec changes when qemu.git is frozen:
> > > > > >
> > > > > > The simplest approach is to keep merging vhost-user.rst changes during
> > > > > > freeze since it does not jeopardize the release or introduce
> > > > > > instability.
> > 
> > snip
> > 
> > > I tend to view the specs subsection of the docs as being
> > > for things where either QEMU really is the authoritative
> > > source (eg fw_cfg), or where the spec is for something that's
> > > basically moribund and has no better home. If vhost-user is
> > > a cross-project specification that it so active that it
> > > cannot live within QEMU's release process, then I think
> > > it deserves to have its own independent home.
> > 
> > Yes, the main impression I get having read through this whole thread
> > is that vhost-user spec should have its own home outside QEMU.
> > 
> > We can come up with all sorts of rationalizations for how to make
> > things work in the context of QEMU, but they all just come across
> > as excuses to avoid changing the fairly arbitrary historical use
> > of qemu.git. Even if as QEMU maintainers we consider that we're a
> > "neutral" home, I can understand why it might not be perceived that
> > way from the outside.
> > 
> > If people want agility such that we need to make exceptions for
> > our rules during freeze that is one flag that it doesn't belong
> > with the main qemu.git, but there are broader points that are
> > pushing my view in that direction too.
> > 
> > 
> > Not mentioned is that engaging with the QEMU mailing list as a
> > non-regular QEMU contributor is not a very attractive task.
> > While QEMU may be satisfied with email, QEMU are in a tiny
> > minority these days. The rest of the OSS community has
> > decided that git forges are the better way to collaborate.
> > 
> > Our dev list is very high volume, with changes very easily (and
> > often) lost in the noise, even from regular contributors, such
> > that we have to teach people to (repeatedly) "ping" to attract
> > attention.
> 
> A separate repo in a git forge definitely has the advantage of making
> communication easier to follow for anyone interested only in the
> vhost-user protocol.
> 
> > If we want agility though, IMHO it is best to stay away from the
> > bureucracy of the OASIS virtio spec / committee, which is a big
> > turn off IME.
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

And possibly getting an agreement to OASIS IPR from major past contributors.

> In other words, it's a bunch of work. Although from a purist perspective
> I think it's the right place for vhost-user, I think it would be an
> unpopular solution.
> 
> > If we're considering a move of the spec, we should probably consider
> > the best home for some of the related code parts too:
> > 
> >   subprojects/libvhost-user/
> >   contrib/vhost-user-blk/
> >   contrib/vhost-user-bridge/
> >   contrib/vhost-user-gpu/
> >   contrib/vhost-user-input/
> >   contrib/vhost-user-scsi/
> > 
> > IIUC, the subprojects is fully standalone code with no dependency
> > on QEMU. It remained within QEMU for "convenience" allowing us to
> > consume them from the impls under contrib/. While the contrib code
> > has some depedencies on QEMU, overall they appear pretty light and
> > so likely easily detached
> > 
> >   $ git grep '#include "' vhost-user-* | awk '{print $2}' | sort | uniq
> >   "hw/virtio/virtio-gpu-bswap.h"
> >   "hw/virtio/virtio-gpu-pixman.h"
> >   "libvhost-user-glib.h"
> >   "libvhost-user.h"
> >   "qapi/error.h"
> >   "qemu/atomic.h"
> >   "qemu/bswap.h"
> >   "qemu/ctype.h"
> >   "qemu/drm.h"
> >   "qemu/iov.h"
> >   "qemu/osdep.h"
> >   "qemu/queue.h"
> >   "qemu/sockets.h"
> >   "standard-headers/linux/input.h"
> >   "standard-headers/linux/virtio_blk.h"
> >   "standard-headers/linux/virtio_gpu.h"
> >   "standard-headers/linux/virtio_input.h"
> >   "standard-headers/linux/virtio_net.h"
> >   "standard-headers/linux/virtio_scsi.h"
> >   "virgl.h"
> >   "vugbm.h"
> >   "vugpu.h"
> > 
> > 
> > We have a often repeated desire to eliminate the "contrib" tree
> > as a concept, since it is currently effectively a "dumping ground"
> > for things which are either unmaintained or didn't have a better
> > home yet. This might be a chance to provide a better home for a
> > big part of it.
> > 
> > IMHO this suggests it is worth creating a new top level gitlab project
> > for it all to live in and form a dedicated team around it, rather than
> > trying to pick any existing location.
> 
> Some vhost-user back-ends in the contrib/ directory are used by QEMU's
> test suite. An alternative way of integrating them into the tests could
> be found, but I wanted to mention that dependency.
> 
> Stefan


