Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871D43BED4A
	for <virtio-comment@lists.linux.dev>; Mon,  1 Jun 2026 14:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324686; cv=none; b=XTYdtrhU8O3tU9D3QXXJzgN+tu1ahlfKbt371Wuqt0SNsB5YOwY24uFBkK6uDSwHxmF7Sn2V3xCnEg86cK1R2W1OZc+NTBfs1srMFg0k63xRy/yp6AbeTWoVIilw8/7WC2TEbYnLXISlWyhFIECqx90qsL/SLCybY1TAbI7Rd0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324686; c=relaxed/simple;
	bh=xu65VNuaDzycmkA3v+iEREeaBsMKdgXawOdt9GjJ2y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UMjJTC3VKKE7S7v4rOTh4V6Ihbw9jGnMqA5a3ksxJmEUPv8cVe573OF3aQOkJf9xNECENrB//sn/FN2l4LLrBSJhDxlyXF1ulz0CpcyOGPb6zka0Gwlz68m8CVgklQCknrgDpqq0CdfmctqX8K/f/s5riT/PaXqfuqfTwFl9jUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c1FRIdE8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c1FRIdE8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780324684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zgfJn6jgdDZ5kywXtUqLLHdwAjzX+oqe3dGLFNRDz44=;
	b=c1FRIdE8dec4hTSCAxEeCBwMsITFqso5ddGpyLGoQTZSnuz+sABlDVqAILXzAtcnF6+WrU
	3Av7vKPU96RIz+LekzZDfe9243aKaArYT5pq4lin/SvPAKEX+dLaKzAvdWGsx7IOGb6yF8
	MAObucV+asvxji9LZjmO9L0mmrRfgmQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-CQ1ZaF9zMAKksIfopiM_Ug-1; Mon, 01 Jun 2026 10:38:03 -0400
X-MC-Unique: CQ1ZaF9zMAKksIfopiM_Ug-1
X-Mimecast-MFC-AGG-ID: CQ1ZaF9zMAKksIfopiM_Ug_1780324682
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490a7aeaddbso11273545e9.1
        for <virtio-comment@lists.linux.dev>; Mon, 01 Jun 2026 07:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324682; x=1780929482;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgfJn6jgdDZ5kywXtUqLLHdwAjzX+oqe3dGLFNRDz44=;
        b=O8aBODwqBE2XFSTuNCkU0UMTKHKRcA2EDg1i1VpwgOAvYU3NHPohK0sPG/G/dGXISJ
         o4J3KlTn+iNXmfl/Exvxgjp574oU4NZV4uqIwabj/AkRoB+0qaffRlUGpLmmbt6ecrXA
         iB1q/n9xA79JsGizStctO7mVlpFaplB110URFwQIdUr2I82Us58XZVOhePt1v/3cGDr/
         RWzmpllsrVCcDju42+WK3EW2TECtjeOFcb5EJamaUBn4C5eGO3VIoJubvytYvDG+6eoU
         lQvg6ycjvVwCCiftd+MVzsDRzR/zaHJt5LmUNy+2YKjLNtOVVb7TwyHfoIo2eKK6wFFK
         EkCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3ClpwrdBViOpHtOS5k2NR5yCcVcUicGuo8vP1ZK+2aMGBKk1rZBDCxHKYFK1++Ui9rdH0wZ5GWyMp2wbhIw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrekhDHZ1CUlacfm8RFddr1/zvYfvJjjQ8BQMBLdQbwbD84T8x
	Np3tODnhZx9qpLj82GoHMyz2IKP/BPcqDYbrq3QVMS1aPuVuC5S+qdZBis93VTV3C4Kiih1TBoS
	Zl8IdxMZQJocR5w1WVZRMm8Zc8YzlTpZpqbk1GnC2xW+xtuIGEeX2WjorKtCSPR/gAYdl
X-Gm-Gg: Acq92OHfAkCEvBFRZS4K0Wyxp4ILyQgugQ2ESKuaNMgsbylmLbEcAixgg8d8GJM2k2m
	FERleZu+VFX8bAqZnkLZtpt1yF+28DKl4QK2VpPR2iSgUEZwFfflVxJihnP8kzg4g+yXTcBELRn
	yaXBDnHNzEv242s8+gx/D5zEX+sO60OHouS47OMA77I/gpABhrW1eA148i8K6fGjB7wAkDgyNum
	ndl2b998A0IJfLI2XaLXtOFbyI+mGgtPq7MCxsnbRapv+weGhJlg4hdr20b7tYyuovB/svQPaQ9
	pAWOiK4IuJ3STBsXy9xchNiKZW04CA+t5pJtwzLP6xKApIE/OWtEle8wWshm+S5WlERR4bDpzBp
	6k7mtvc4Fyt70hMN3oaNi0pcvFmAiUx9+jWvonhP1diDIV+SRpOqTAQ==
X-Received: by 2002:a05:600c:314e:b0:48f:e230:29f4 with SMTP id 5b1f17b1804b1-490a2a78973mr166523475e9.15.1780324681736;
        Mon, 01 Jun 2026 07:38:01 -0700 (PDT)
X-Received: by 2002:a05:600c:314e:b0:48f:e230:29f4 with SMTP id 5b1f17b1804b1-490a2a78973mr166523055e9.15.1780324681159;
        Mon, 01 Jun 2026 07:38:01 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-45.inter.net.il. [80.230.25.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0467957sm5583625e9.13.2026.06.01.07.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:38:00 -0700 (PDT)
Date: Mon, 1 Jun 2026 10:37:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>, virtio-comment@lists.linux.dev,
	dev@lists.cloudhypervisor.org, rust-vmm@lists.opendev.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Alyssa Ross <hi@alyssa.is>, Mark Burton <MBURTON@qti.qualcomm.com>,
	Matti Moell <matti@qti.qualcomm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Dorinda Bassey <dbassey@redhat.com>, Sergio Lopez <slp@redhat.com>,
	Vishwanath Seshagiri <vishs@meta.com>,
	Rob Bradford <rbradford@meta.com>,
	Zhengyu Zhao <zhaozhengyu@bytedance.com>,
	"Jorge E. Moreira" <jemoreira@google.com>
Subject: Re: Where should the vhost-user specification live?
Message-ID: <20260601103715-mutt-send-email-mst@kernel.org>
References: <874ijtz038.fsf@draig.linaro.org>
 <CADSE00+RdBUhFVBDSXtVd1J5SaccqWy+RBxqnxuLKUYcitFMPw@mail.gmail.com>
 <20260601083628-mutt-send-email-mst@kernel.org>
 <CADSE00+kRnEC08LLVu6H065u2KaxBm-KnSN_8y6+964-FLbJMA@mail.gmail.com>
 <20260601090953-mutt-send-email-mst@kernel.org>
 <CAJSP0QV4W=5MJsSGggACv-tqxDtiieKc0YzEn8t-R=RD94KJaQ@mail.gmail.com>
 <CADSE00+ziHc8W2FqNT-aJU0Lt4sZ=NfQLc65m16vpT++pZM+xQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CADSE00+ziHc8W2FqNT-aJU0Lt4sZ=NfQLc65m16vpT++pZM+xQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4iIgtsCHgy2aQCLQ0akBSv5fy8pEaIFtLr7DLS6ZDjk_1780324682
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jun 01, 2026 at 04:27:46PM +0200, Albert Esteve wrote:
> On Mon, Jun 1, 2026 at 3:51 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> >
> > On Mon, Jun 1, 2026 at 9:12 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Mon, Jun 01, 2026 at 03:05:50PM +0200, Albert Esteve wrote:
> > > > On Mon, Jun 1, 2026 at 2:39 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Mon, Jun 01, 2026 at 02:32:11PM +0200, Albert Esteve wrote:
> > > > > >  But also because, in my opinion, separating
> > > > > > the specification would improve development agility by decoupling
> > > > > > specification development from QEMU's review and release cycles.
> > > > >
> > > > > Generally for QEMU this will be less agility, unless I misunderstand
> > > > > what is proposed)
> > > > >
> > > > > Because presumably there will need to be spec releases then?
> > > > >
> > > > > So
> > > > >         new feature -> spec tree -> spec release -> qemu implementation -> qemu release
> > > > >
> > > > > is surely longer that what we have now.
> > > >
> > > > I see your point.
> > > >
> > > > However, we do not really need to introduce a heavy release management
> > > > layer. We could just operate it as a living document, where the main
> > > > branch is the authoritative source of truth.
> > > >
> > > > For the workflow, development doesn't have to be strictly sequential
> > > > either. A contributor can propose the spec update while working on the
> > > > implementation, much like we do for VirtIO updates. Actually, this way
> > > > one update/change supports the other.
> > > >
> > > > I guess my point is that a dedicated repository could lower the
> > > > barrier for new changes AND keep QEMU's own development speed mostly
> > > > unaffected.
> > > >
> > > > BR,
> > > > Albert
> > >
> > > Something something submodule? Possibly. If you want to make progress
> > > on this, pls think of the process, try it out.
> >
> > If I understand correctly, the motivation for moving the spec
> > somewhere else is to replace the email patch review process with a git
> > forge review process?
> >
> > This seems like a superficial change and is not worth in my opinion if
> > you consider we'll have to redirect from the old spec location and
> > move the community over to the new repo.
> 
> The core issue from my perspective is project neutrality and
> decoupling lifecycles.


Then maybe we can keep the email based review? Still the only
one with a decent offline capability.


> Currently, protocol updates are tied to QEMU's tree rules and release
> freezes for example. Since these changes also affect other projects
> (like rust-vmm, crosvm, DPDK, etc.), separating them may make sense
> and could streamline the process.
> 
> >We could actually lose spec
> > change reviewers in the process either because they don't know what's
> > going on or decide that they prefer to spend time elsewhere when faced
> > with switching processes (the people who review and participate in
> > discussion do so out of personal interest and as far as I'm aware no
> > one is employed to work on vhost-user as their #1 priority).
> 
> This is a fair concern. I hope we maintain reviewer engagement. But it
> could also be argued that contributors from other communities may be
> more comfortable with a dedicated project-neutral home. It could well
> go both ways, but it also represents an opportunity to grow.
> 
> >
> > Having said that, here is what I imagine it would involve:
> >
> > 1. Michael creates a new repo on a git forge (if he wants it to be
> > under the GitLab qemu-project organization I can help with creating
> > the repo, otherwise he creates a new organization and repo).
> > 2. Discussion happens in Issues.
> > 3. Spec changes are proposed in Merge Requests. Michael merges them
> > once consensus has been reached.
> 
> Mostly yes, though we wouldn't necessarily need Michael as the sole
> gatekeeper. We could invite co-maintainers from other key projects to
> share the reviewer load.
> 
> Also I'd want to clarify that although I am advocating for this
> change, I do not claim to have the definitive roadmap. I am just
> sharing my view on why this could be a positive evolution. Consensus
> may end up being to remain with the current status quo, or any of the
> other options proposed by Alex.

> >
> > It's similar to what we have now in qemu.git, except that a git forge is used.
> >
> > Stefan
> >

