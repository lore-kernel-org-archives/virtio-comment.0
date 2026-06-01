Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F10D3DFC81
	for <virtio-comment@lists.linux.dev>; Mon,  1 Jun 2026 20:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780344309; cv=none; b=uyke8yJq+/nlqUw7GHerbwGA11Nrp/bh2lyUQHyE7GcXT1G1SxIalIiPQzHpZEJCcmxn2q6b4LuHj7adHRhF+5x/R+RMdvYSGx/2gKws9WjsW9+qYkdfmKkPMg4Lj32cSuLOojDNjdmLDJhLYw6arZLPQ5tL9kW9AikjVmdUQo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780344309; c=relaxed/simple;
	bh=81ovYnNiP4aKX3YJ/SNX42hGsGdBQEPmG18z+lkqLW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fTLiHK5yraBr2yeiKTdPqXp5jz/YWmQQK/H1ZkYt+qkZ3dKvHBHLcOpxRc5R59nr3Hz7AQKQZWJwCoV2bkyB90bjNwdgpAppRD5ve4DgNbBkj+YM1O3PMLtpPDVY7ISYEjVTGbdCUd7NSHO5gxwLMWbZZ28WX9nrVg2yrBTT73k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XDcMktPc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XDcMktPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780344305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=plaHHP/owetcd3quHl6OhFcQ/AAirdRtHSTz6XMkIes=;
	b=XDcMktPcKOEOQeIxsc0+MNWDcG7EEwXNB7++iOEu2GYm/ehVfxRNEmSJw2Qzpu3TruHcgW
	P1QSe/Uk1D/YAZjQXcs49Qkh/l9sN3SOyCqO8ZO2xUzBJyLEkZ5Q1HEO8w7uqa097jSDpk
	Qf7QCG2ShCGRl6lL4eBUuKqAdvjaHGg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-wLnrxEW4NZyDhKn6CCjddA-1; Mon, 01 Jun 2026 16:05:02 -0400
X-MC-Unique: wLnrxEW4NZyDhKn6CCjddA-1
X-Mimecast-MFC-AGG-ID: wLnrxEW4NZyDhKn6CCjddA_1780344302
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-45eebc943bfso2216200f8f.0
        for <virtio-comment@lists.linux.dev>; Mon, 01 Jun 2026 13:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780344301; x=1780949101;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plaHHP/owetcd3quHl6OhFcQ/AAirdRtHSTz6XMkIes=;
        b=HRush7vC5KJ2qAat7rfEX3ED0KKLa6fGc7Y3uVZ+tK6TCvJTR+47656th02Bf2eOI0
         tTALjU2pBs8IoVcJsvVNUhQerbnlodJ9dg8didfvkUlsNwIp9VlIzzQxcADRNrb6jIgp
         ee8TVRd/QSuljRnGMYP2447yP8zgZxiVbQTQk9CQ8OBzGJBlMrOl3L+LdAafOye5OX/H
         vg550t9cWmJLD6LU/QSKHoy1nnaS9MFoGbJLFdbGRCnQUqLAuzakEBA781a2zeHHxLW+
         kFMKoOTwRDhPQoPTdUL/WjLQSdiwcAG9xUeq5bMJLKcpL5fcQASYw77BDDLlArwTIUNa
         9MZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+UeXnUzvE6KGi9rmoE+bCeX7MbWl7wBaHQWF82v2hjM8xRSnotY+r3O6BQ/RV/tEU73WG2U1W0FoBzFJpztw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLZFMLS9EN0ThrSlRDaDzhhI8oL/BViSWltobgJXAnTWs7gUOC
	m5O7RfBqVNqUksHF4dhp22szQi1f43QzqoeDg84NUQpfDbkorE6whuDl8QD+YyJBSZa7GQg6nFM
	HarQi7f+P3LJ2N3HS/wDzkJPeFxgGCPStKZuWLGi8INXQp0L1SZwYqHAwQZFqdrhwUPxW
X-Gm-Gg: Acq92OE2Sd6esoSs8s2CiOFMnH1s++W3rmIjSJV/TPfrHSKRdjm69LL1SdjyZpV0xk3
	ixmwaozIjP44Q95uf3vQGW7rQRDz9dHhrtFFzbeUyY4nNyMGF3hK59J/o6SwqKKG6MHW3381x5m
	pXz1Q0a5OIRtIDl2OGbCfW8xMS29/1kKv+61158VUE2gsBVnsnK+5QpbUHd0hcKTKaxwrzMlQNd
	Fc4dWiMHl34sbSskEEKtC4sk1MfICVwA0o1Y6biQc9wLtLhxIwN9eAqwmbc/69Tc8kJWbWniWcO
	GreoA91mH80Jl4uHnDvF6z5iqrUzPKRax6UIWit+Pero4cROLmGtD7uZ3YC6/v0kiL+SMGVr859
	VepxG16qrTt0cmsCOJ3yn0pcl1cVlPVgP1u0KyV4yJ6XHq1IpnhgpOA==
X-Received: by 2002:a05:600c:8a09:20b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-490b0e9355cmr10784505e9.13.1780344301427;
        Mon, 01 Jun 2026 13:05:01 -0700 (PDT)
X-Received: by 2002:a05:600c:8a09:20b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-490b0e9355cmr10784075e9.13.1780344300888;
        Mon, 01 Jun 2026 13:05:00 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-45.inter.net.il. [80.230.25.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e19a06sm15089025e9.5.2026.06.01.13.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 13:05:00 -0700 (PDT)
Date: Mon, 1 Jun 2026 16:04:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Albert Esteve <aesteve@redhat.com>,
	Stefan Hajnoczi <stefanha@gmail.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>, virtio-comment@lists.linux.dev,
	dev@lists.cloudhypervisor.org, rust-vmm@lists.opendev.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Alyssa Ross <hi@alyssa.is>, Mark Burton <MBURTON@qti.qualcomm.com>,
	Matti Moell <matti@qti.qualcomm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Dorinda Bassey <dbassey@redhat.com>, Sergio Lopez <slp@redhat.com>,
	Vishwanath Seshagiri <vishs@meta.com>,
	Rob Bradford <rbradford@meta.com>,
	Zhengyu Zhao <zhaozhengyu@bytedance.com>,
	"Jorge E. Moreira" <jemoreira@google.com>
Subject: Re: Where should the vhost-user specification live?
Message-ID: <20260601160352-mutt-send-email-mst@kernel.org>
References: <874ijtz038.fsf@draig.linaro.org>
 <CADSE00+RdBUhFVBDSXtVd1J5SaccqWy+RBxqnxuLKUYcitFMPw@mail.gmail.com>
 <20260601083628-mutt-send-email-mst@kernel.org>
 <CADSE00+kRnEC08LLVu6H065u2KaxBm-KnSN_8y6+964-FLbJMA@mail.gmail.com>
 <20260601090953-mutt-send-email-mst@kernel.org>
 <CAJSP0QV4W=5MJsSGggACv-tqxDtiieKc0YzEn8t-R=RD94KJaQ@mail.gmail.com>
 <CADSE00+ziHc8W2FqNT-aJU0Lt4sZ=NfQLc65m16vpT++pZM+xQ@mail.gmail.com>
 <20260601151815.GC411459@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260601151815.GC411459@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 12STRYuv8vChagcBJBj3xZD4CY4pdDYGT9-TEQyOzz4_1780344302
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jun 01, 2026 at 11:18:15AM -0400, Stefan Hajnoczi wrote:
> On Mon, Jun 01, 2026 at 04:27:46PM +0200, Albert Esteve wrote:
> > On Mon, Jun 1, 2026 at 3:51 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > >
> > > On Mon, Jun 1, 2026 at 9:12 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Mon, Jun 01, 2026 at 03:05:50PM +0200, Albert Esteve wrote:
> > > > > On Mon, Jun 1, 2026 at 2:39 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >
> > > > > > On Mon, Jun 01, 2026 at 02:32:11PM +0200, Albert Esteve wrote:
> > > > > > >  But also because, in my opinion, separating
> > > > > > > the specification would improve development agility by decoupling
> > > > > > > specification development from QEMU's review and release cycles.
> > > > > >
> > > > > > Generally for QEMU this will be less agility, unless I misunderstand
> > > > > > what is proposed)
> > > > > >
> > > > > > Because presumably there will need to be spec releases then?
> > > > > >
> > > > > > So
> > > > > >         new feature -> spec tree -> spec release -> qemu implementation -> qemu release
> > > > > >
> > > > > > is surely longer that what we have now.
> > > > >
> > > > > I see your point.
> > > > >
> > > > > However, we do not really need to introduce a heavy release management
> > > > > layer. We could just operate it as a living document, where the main
> > > > > branch is the authoritative source of truth.
> > > > >
> > > > > For the workflow, development doesn't have to be strictly sequential
> > > > > either. A contributor can propose the spec update while working on the
> > > > > implementation, much like we do for VirtIO updates. Actually, this way
> > > > > one update/change supports the other.
> > > > >
> > > > > I guess my point is that a dedicated repository could lower the
> > > > > barrier for new changes AND keep QEMU's own development speed mostly
> > > > > unaffected.
> > > > >
> > > > > BR,
> > > > > Albert
> > > >
> > > > Something something submodule? Possibly. If you want to make progress
> > > > on this, pls think of the process, try it out.
> > >
> > > If I understand correctly, the motivation for moving the spec
> > > somewhere else is to replace the email patch review process with a git
> > > forge review process?
> > >
> > > This seems like a superficial change and is not worth in my opinion if
> > > you consider we'll have to redirect from the old spec location and
> > > move the community over to the new repo.
> > 
> > The core issue from my perspective is project neutrality and
> > decoupling lifecycles.
> >
> > Currently, protocol updates are tied to QEMU's tree rules and release
> > freezes for example. Since these changes also affect other projects
> > (like rust-vmm, crosvm, DPDK, etc.), separating them may make sense
> > and could streamline the process.
> 
> I don't see a reason to block vhost-user.rst changes during QEMU's
> freeze. If Michael sent a vhost-user spec pull request during freeze I
> would merge it.
> 
> > >We could actually lose spec
> > > change reviewers in the process either because they don't know what's
> > > going on or decide that they prefer to spend time elsewhere when faced
> > > with switching processes (the people who review and participate in
> > > discussion do so out of personal interest and as far as I'm aware no
> > > one is employed to work on vhost-user as their #1 priority).
> > 
> > This is a fair concern. I hope we maintain reviewer engagement. But it
> > could also be argued that contributors from other communities may be
> > more comfortable with a dedicated project-neutral home. It could well
> > go both ways, but it also represents an opportunity to grow.
> > 
> > >
> > > Having said that, here is what I imagine it would involve:
> > >
> > > 1. Michael creates a new repo on a git forge (if he wants it to be
> > > under the GitLab qemu-project organization I can help with creating
> > > the repo, otherwise he creates a new organization and repo).
> > > 2. Discussion happens in Issues.
> > > 3. Spec changes are proposed in Merge Requests. Michael merges them
> > > once consensus has been reached.
> > 
> > Mostly yes, though we wouldn't necessarily need Michael as the sole
> > gatekeeper. We could invite co-maintainers from other key projects to
> > share the reviewer load.
> >
> > Also I'd want to clarify that although I am advocating for this
> > change, I do not claim to have the definitive roadmap. I am just
> > sharing my view on why this could be a positive evolution. Consensus
> > may end up being to remain with the current status quo, or any of the
> > other options proposed by Alex.
> 
> I get a sense that this is about politics in the end. Do people feel
> they are not represented and would like to have more influence in the
> vhost-user spec?
> 
> You bring up project neutrality and a model where Michael is no longer
> the sole maintainer. It will be necessary to propose a concrete roadmap
> and also to explain the concerns about neutrality more so it's clear
> they won't be an issue anymore in the future system.
> 
> Why is the current system not neutral and how will the new system solve
> that?
> 
> Who should be a co-maintainer?
> 
> Stefan

And also, qemu currently acts like a reference implementation.
Which is something.

-- 
MST

