Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A99D36AB49
	for <virtio-comment@lists.linux.dev>; Tue,  9 Jun 2026 20:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781037390; cv=none; b=KruFE4m1iiFa903Ki3xj/gFdqmUNd1W2xq6CZZoO4WQJkO+PsPE3f7ZN1RA+ut9bTyLa0nBaU9EOC4evkZDYCQIpZ6r8nVJQCTqIaJU6TAclVhvm9CgZKW7SrnGNXcJA6BtTBRSRTYuA4cn2ayCl6h2NVWf2bjRfEvgFxLjj+I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781037390; c=relaxed/simple;
	bh=rBkC0lIrgjon2icgzovg2lixwOF/wgcb6YQprKCrkvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=PFozy901yFASXxnuInRgPObmHMIFkJmdfdZ46q7EvBfsJwOAdM2jD4Ml9BjFNA17D5g+xGevkuSJIFR9EDuaeI7DIU82a2FjY8VqTf+8TVnR9eM6JOVbzWpFTnwiZ560tAwYhGITiSViYKWpX3o3wZm66JZkGnGMpFr5S3yz/sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oja5IZyZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oja5IZyZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781037388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FlKJKCDdHgAj/yGhb4/RBHIw/K9PTRjbwSEY0XVYxIQ=;
	b=Oja5IZyZ2oUs1A7KnBbRmV85/s4JcB8SasxIaLde1vTQFG26iWIjdBHxM2MuezOZV33X0r
	wjeGoT343vOYoe+p/PKL61qfuERfBuBIkjzBv3jF4ZUvXgv1s3eMVFRJhOh/Dkjf1PB3Uy
	Gee60FJg5WRglgZ4E0FLtQ0CBqV6yaI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-BNl_I46ZPjK1Zpw7yVlfkQ-1; Tue, 09 Jun 2026 16:36:26 -0400
X-MC-Unique: BNl_I46ZPjK1Zpw7yVlfkQ-1
X-Mimecast-MFC-AGG-ID: BNl_I46ZPjK1Zpw7yVlfkQ_1781037385
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490b5d2e394so43848745e9.3
        for <virtio-comment@lists.linux.dev>; Tue, 09 Jun 2026 13:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781037385; x=1781642185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FlKJKCDdHgAj/yGhb4/RBHIw/K9PTRjbwSEY0XVYxIQ=;
        b=QXLCbqfHPzYZXXlvd1JpR/ZFnbm+1fM8DMdDEXjZoVD2n5v3DYnyIEVz4yLcDXVGn8
         ECQnhrxOJFiY3kMa5O3pINQIyXy6RqecDDwkAJm5jk7rWMoJBipN670uO5MuLT/rs2KU
         CX/IETEABGyHN/b0xJiljSnBeFyZUMti/oqFGMfHBsur+iABI0ptu5ccY4J3FPe8CJoV
         BCKljC9XBWORB7+AG0T5/JLVNOin57kskPW4Ksb3nmMpuatFk6o43VV9/t5QX0uqsZ5M
         wMbNZ4deMrp9x8uYuCQ7l/T02KovJfcp/PVGi/0HQUO8KO6siDeitHVwYQDR3CO/L1s9
         eFuQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YQ4bg6GkuGCambiJ4JjqrxxpUyWnekLT2/SzokFSMoPGH3LdD3PMcM23pykzonQOfxoHWnyQd3xJaAh3PAA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxfnb0561uTQ8bwamFLEOwJQBj4mUV6dT3+OGUKkr7L9AztByqI
	Ya15WCwWSy2m1Gw/hOMmfqckhuialrIGdGEftrzKSpaLRSr52v8nRX2oiVnWeES2WJ7VBePjYKe
	7lkt0xzm80RR3iusV0uLSHdopUNIcr+1y+M6i84CZfMX3Ado2e9qEY533M9b+9VLXEhJT
X-Gm-Gg: Acq92OHwwCT7uGQTH0CoU4uZ3CIgXXr8ROrrfSzfXrR0wVEeShOkWC7AXOsJ/TbvdYE
	kuiZMfxiXz4rlV8zZBAHlKPnp+gfwvCtMrcdVqEqlfy2iTGrBgv0M3CxPaG4IiKypq4W/1a18Ya
	HqLvidxeYPC4E9ZlPzuP8WjbTfRcsfz4y1Gxv4QMcgjJfk63mTs+B78xvmkq9qHyLBrtEm3nOP6
	ZTbYKjoqSoC+ztTzkDxjUloBWa0A/vp5dBigqTqBl5ayjbnY5UIowGT+aDSFgrN7B9n2VzNPQaE
	COu2pHjcRtLUSDPZ3OqnzdwItf2vTfd0l5Z8pAP2EJ5gn6atAJBsAR8bxXHwyJDlNh3/hmMoMSt
	PLL9nj/NruNNT2vYyONY5NpnY0/2M/d7UOclmnG/7Q4hb1EtpvBClcQ==
X-Received: by 2002:a05:600c:35ca:b0:490:bc46:1a58 with SMTP id 5b1f17b1804b1-490c25dea14mr381979315e9.18.1781037384970;
        Tue, 09 Jun 2026 13:36:24 -0700 (PDT)
X-Received: by 2002:a05:600c:35ca:b0:490:bc46:1a58 with SMTP id 5b1f17b1804b1-490c25dea14mr381978665e9.18.1781037384360;
        Tue, 09 Jun 2026 13:36:24 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm51175338f8f.14.2026.06.09.13.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:36:23 -0700 (PDT)
Date: Tue, 9 Jun 2026 16:36:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
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
	"Jorge E. Moreira" <jemoreira@google.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: Where should the vhost-user specification live?
Message-ID: <20260609163536-mutt-send-email-mst@kernel.org>
References: <20260601090953-mutt-send-email-mst@kernel.org>
 <CAJSP0QV4W=5MJsSGggACv-tqxDtiieKc0YzEn8t-R=RD94KJaQ@mail.gmail.com>
 <CADSE00+ziHc8W2FqNT-aJU0Lt4sZ=NfQLc65m16vpT++pZM+xQ@mail.gmail.com>
 <20260601151815.GC411459@fedora>
 <20260601160352-mutt-send-email-mst@kernel.org>
 <CACzuRyxedVMHNGkRf7AVyPWUTMgBMa6_DBnSHn+V6H7wN7XzWw@mail.gmail.com>
 <20260604162853.GC115597@fedora>
 <CAJSP0QXR6MyqoE1Uh-X7DzsOabbbN69TUyxf8r6ghUDCQnrP=w@mail.gmail.com>
 <CAFEAcA_Kd5_k+XyagUbB2+YVEMB0Sb0AB=oUZu6bGDot9TaFrQ@mail.gmail.com>
 <CAJSP0QVuSvVwa1szAy_3WVtWOjGK=oYAXjqAzbg5YoEvgybRjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAJSP0QVuSvVwa1szAy_3WVtWOjGK=oYAXjqAzbg5YoEvgybRjA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kYxUPK27TdROP_kK8eKWz39JAWC3W263YLCR0LDx7E4_1781037385
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jun 09, 2026 at 03:44:49PM -0400, Stefan Hajnoczi wrote:
> On Tue, Jun 9, 2026 at 2:51 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 9 Jun 2026 at 19:00, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > > I'm not sure if anyone brought up this topic on qemu-devel and with
> > > Michael before. As I mentioned in my reply, there are ways to avoid
> > > blocking vhost-user spec changes when qemu.git is frozen:
> > >
> > > The simplest approach is to keep merging vhost-user.rst changes during
> > > freeze since it does not jeopardize the release or introduce
> > > instability.
> >
> > I'm not enthusiastic about having "this one document is an
> > exception to our freeze and release process". Because it is
> > only documentation, it is in the same "we can be relatively
> > relaxed about allowing in documentation changes" boat as
> > most of the rest of the docs. But docs changes can break the
> > build (e.g. if you mess up a rST syntax thing), so as we
> 
> CI prevents broken rST from being merged (there are multiple jobs with
> `--enable-docs`), so I'm not sure this can happen?
> 
> > get closer to the final release we are going to get more
> > strict about "is this change really necessary or can it
> > wait a few weeks?", and they must at a minimum continue to obey
> > the "no changes of any kind between the last RC and the final
> > release" rule.
> 
> Why is the final release candidate special?
> 
> > And definitely if a patchseries has both
> > QEMU code changes and documentation updates then that is
> > going to not get applied during freeze if the code changes
> > don't follow the freeze rules.
> 
> I agree that code changes cannot be merged.
> 
> As long as the vhost-user maintainer is confident that the spec change
> is implementable and stable, they can merge the spec change on its own
> without code changes. If they are not confident, then the spec change
> isn't ready to be merged yet.
> 
> Stefan

I personally have been confidently wrong enough times. Maybe others know
how to do better.

-- 
MST

