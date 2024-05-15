Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0135A0E1
	for <virtio-comment@lists.linux.dev>; Wed, 15 May 2024 10:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715769437; cv=none; b=ZDMCKgw3U6GqcJTE/YC7hW/xHqeXhrM5pTm5GUYw5oRihSvUa7GKZuYfvU6CDt/HsMqBOckV1+BiykrtJJscGTWJaD8iAr3ncRz5f/sI0ixtjYmxroE9cts/0ikSvgG2AlfItU77h501v6TT2F/zX0bP+XBiy5XTKXAXqQ4mp4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715769437; c=relaxed/simple;
	bh=krjBX+h/HDhWz+TCSfqbShv0rTDUGkwI3WtiiJRyk4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Vu4o2PJSgHSD7TRQNWF2aN2CkGyU9bW3IREeXrcT5pvonSdyK1rPZgZb6m7tAnHZs+fodG+dhJSkCA7V79r2H9/uiMoeWA8tDx4CSrTUnWPC7VlQrX/LECxE7LI1JEiNklwFW2oKsTirzvxBf5FBqz78PnhI1cWy24bpd3hQiJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JkHi3ARX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JkHi3ARX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715769434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jMwzbb0D11HHC9OmL4M6DHLJTVJ+dRYxtOHmvOW0xNI=;
	b=JkHi3ARXIzm5Yrqm9Im5Pr4ghg02XANaJ+V9vNk/hd64IciRWK9kKT6DbfDHwijSUIQ7Li
	9L0KtaOC5tbHM6XLSPPHpSazba08phBk+ryjcTQi15nQmjwTZ56T6p84Khr0A1O8lxGoAH
	DnU0ueoLQCvnbbVYbUAJpr6du37eAxA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-3AjIhDoiP1aVV8dRL0XGLg-1; Wed, 15 May 2024 06:37:12 -0400
X-MC-Unique: 3AjIhDoiP1aVV8dRL0XGLg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4201248bcd4so16152695e9.1
        for <virtio-comment@lists.linux.dev>; Wed, 15 May 2024 03:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715769431; x=1716374231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMwzbb0D11HHC9OmL4M6DHLJTVJ+dRYxtOHmvOW0xNI=;
        b=XjfS+y85z9wqOvYbB6C2g9hj+H6gy1J4ntSb83Hz3OHrVOcKSNAyMEUO2vsvnyffw9
         NMw12jaU3GSr86zD0yw1TPB/rFtxOZiAmughqt71xnKulQhwFda0dlJK1TqcNEwFnREr
         WDlyEM/ZIC9s3pOUE2iGTOT0UeqjoXcka1QeFZYp/16eOLCYyBTAEl5taH0d6QKWkEUd
         cyO2EGl4iXzW3vkXVdUH7IMcTsM6Hh1LDRSKlhw247eMPMyxCSbEO/NSpYDK8AiNAHRN
         cnfrFaczJu8ziFdl1zAiTrhxRrZE9QDTmFjOM1TcfL1rxvROrZ4xlCaEuGLHvhYG6EpW
         hQNw==
X-Gm-Message-State: AOJu0Yw0kozs1NZ80GRj2W6MUrpzXvws4vauOqD0vJo1Ysg1BeGodO+m
	VohbVis4FOJ8QTs1tT80lNrJxoG7Ite6dLZZTI/Lu4MEPpt4fCp7rrcz/5y6vrl7KMyWrSfsiGP
	o5H7Vd8WtX/uFm0dgFs7suFxgQSltUafZZKhSzEzJMg9XpH7qxulEknm9jt2v6hfTIuO65Xdt
X-Received: by 2002:a05:600c:5685:b0:418:f991:713f with SMTP id 5b1f17b1804b1-41feab42b13mr114894585e9.23.1715769430517;
        Wed, 15 May 2024 03:37:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpH1QblPL0mkcUXefO4ajPsmFjeBi/XuxzWpyDfWuyCZSOPcX4lTJDc0YGh2DE7tids2d33A==
X-Received: by 2002:a05:600c:5685:b0:418:f991:713f with SMTP id 5b1f17b1804b1-41feab42b13mr114894455e9.23.1715769429906;
        Wed, 15 May 2024 03:37:09 -0700 (PDT)
Received: from redhat.com ([2a02:14f:175:c01e:6df5:7e14:ad03:85bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccbe8f9bsm230126065e9.6.2024.05.15.03.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 03:37:09 -0700 (PDT)
Date: Wed, 15 May 2024 06:37:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"virtio-dev@lists.linux.dev" <virtio-dev@lists.linux.dev>
Subject: Re: [PATCH v3] README.md: update mailing list info
Message-ID: <20240515063503-mutt-send-email-mst@kernel.org>
References: <8f5db33c96d685fcebca3579b05d09b64dd720d9.1715766697.git.mst@redhat.com>
 <PH0PR12MB54818B506EFE9E4ED61B4294DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515062910-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818853B8A407B6F2A3D463DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54818853B8A407B6F2A3D463DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 15, 2024 at 10:32:53AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, May 15, 2024 4:01 PM
> > 
> > On Wed, May 15, 2024 at 10:14:46AM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Wednesday, May 15, 2024 3:23 PM
> > > >
> > > > As approved by the TC, we are moving to a less formal way of
> > > > discussing the specification, on the mailing lists provided by the Linux
> > Foundation:
> > > >
> > > > https://groups.oasis-open.org/higherlogic/ws/public/ballot?id=3820
> > > >
> > > > Update README.md, CONTRIBUTING.md and newdevice.tex accordingly.
> > > >
> > > > Use this opportunity to explain when and how to use each mailing list.
> > > >
> > > > Oh yes, and device numbers are reserved through virtio-comment not
> > > > through virtio-dev. Correct that.
> > > >
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >
> > > > changes from v3:
> > > > 	update CONTRIBUTING.md and newdevice.tex changes from v2:
> > > > 	Use this opportunity to explain when and how to use each mailing list.
> > > >
> > > >  CONTRIBUTING.md |  2 +-
> > > >  README.md       | 80
> > ++++++++++++++++++++++++++++++++++++++++++-
> > > > ------
> > > >  newdevice.tex   |  3 +-
> > > >  3 files changed, 72 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md index
> > > > 1330a98..ee7318e 100644
> > > > --- a/CONTRIBUTING.md
> > > > +++ b/CONTRIBUTING.md
> > > > @@ -10,7 +10,7 @@ in the TC's technical activity is invited to <a
> > > > href="https://www.oasis-open.org  (Member, Voting Member, Persistent
> > > > Non-Voting Member; Chair, Secretary...)</p>
> > > >
> > > >  <p>Persons who are not TC members are invited to open issues and
> > > > provide comments using this repository's <a
> > > > href="https://github.com/oasis- tcs/virtio-spec/issues/new">GitHub
> > > > Issues</a> tracking facility or using the - TC's <a
> > > > href="https://www.oasis-
> > > >
> > open.org/committees/comments/index.php?wg_abbrev=virtio">comment
> > > > list</a>.  All such content created in GitHub Issues and/or posted
> > > > to the TC's <a
> > > > href="https://lists.oasis-open.org/archives/virtio-comment/">archive
> > > > d comment list</a> is governed by the terms of the <a
> > > > href="https://www.oasis-open.org/policies-guidelines/ipr#appendixa">
> > > > OASIS
> > > > Feedback License</a>.</p>
> > > > +TC's <a
> > > > +href="mailto:virtio-comment+subscribe@lists.linux.dev">comment
> > > > +list</a>.  All such content created in GitHub Issues and/or posted
> > > > +to the TC's <a
> > > > +href="https://lore.kernel.org/virtio-comment/">archived
> > > > +comment list</a> is governed by the terms of the <a
> > > > +href="https://www.oasis-open.org/policies-guidelines/ipr#appendixa"
> > > > +>OAS
> > > > +IS Feedback License</a>.</p>
> > > >
> > > >  <p><b>Use of Contributions</b>.  As with all OASIS Technical
> > > > Committee assets (TC <a
> > > > href="https://wiki.oasis-open.org/">Wiki</a>, TC <a
> > > > href="https://issues.oasis-open.org/secure/Dashboard.jspa">Issues
> > > > Tracker</a>, TC <a
> > > > href="https://lists.oasis-open.org/archives/">General
> > > > Discussion List archives</a>, TC <a
> > > > href="http://docs.oasis-open.org/">OASIS
> > > > Library</a> assets), content placed into this GitHub repository is
> > > > visible and publicly accessible.  Subject to applicable <a
> > > > href="https://github.com/oasis-
> > > > tcs/virtio-spec/blob/master/LICENSE.md">licensing</a> rules, the
> > > > repository content may be re-used freely, including the creation and
> > > > publication of derivative works.</p>
> > > >
> > > > diff --git a/README.md b/README.md
> > > > index 2bdf485..c06caf6 100644
> > > > --- a/README.md
> > > > +++ b/README.md
> > > > @@ -76,11 +76,12 @@ font packages.
> > > >  <dd>
> > > >  </dl>
> > > >  <h4>Providing Feedback</h4>
> > > > -Feedback must be provided the <strong>virtio-comment</strong>
> > > > mailing list, -and archived in the mailing list archives.
> > > > -<p>See <A
> > > > -HREF="https://www.oasis-
> > > > open.org/committees/tc_home.php?wg_abbrev=virtio#feedback">
> > > > -https://www.oasis-
> > > > open.org/committees/tc_home.php?wg_abbrev=virtio#feedback</A>
> > > > +Informal feedback is accepted through the
> > > > +<strong>virtio-comment</strong> mailing list, and is archived in <A
> > > > HREF="https://lore.kernel.org/virtio-comment/">the mailing list
> > archives</A>.
> > > > +To provide feedback, subscribe by sending mail to
> > > > +<HREF="mailto:virtio-comment+subscribe@lists.linux.dev">virtio-comm
> > > > +ent+ subscribe@lists.linux.dev</A>, then after confirming you agree
> > > > +to the IPR sending your feedback to
> > > > +<HREF="mailto:virtio-comment@lists.linux.dev">virtio-
> > > > comment@lists.linux.dev</A>.
> > > >  <p>Note that only plain text part of the message is archived, and
> > > > all attachments are stripped. Accordingly, messages sent to the
> > > > mailing list should use text/plain encoding and not @@ -106,8
> > > > +107,38 @@ Signed-off-
> > > > by: Name &lt;email&gt;<br>  git format-patch -o proposal1/ HEAD~1..<br>
> > ...
> > > > generates a new directory proposal1/ and a file starting with 0001-
> > > > ...<br> <p> -git send-email --to=virtio-comment@lists.oasis-open.org
> > > > proposal1/0001-*
> > > > +git send-email --to=virtio-comment@lists.linux.dev proposal1/0001-*
> > > >  </code>
> > > > +
> > > > +<dl>
> > > > +<dt>When to use the virtio-comment mailing list:</dt> <dd>
> > > > +  questions and change proposals for the Virtio specification,
> > > > +  including the specification of basic functionality, transports
> > > > +and
> > > > +  devices.
> > > > +</dd>
> > > > +
> > > > +<dt>When <em>not</em> to use the virtio-comment mailing list:</dt>
> > > > +<dd>
> > > > +  questions and change proposals for Virtio drivers and devices
> > > > +  implementing the specification.
> > > > +  (please use the <A HREF="mailto:virtio-dev@lists.linux.dev">
> > > > +virtio-dev
> > > > mailing list</A> for this).
> > > > +</dd>
> > > > +
> > > > +<dt>To do:</dt>
> > > > +<dd>
> > > > + send email preferably in text format (best for archiving).
> > > > +</dd>
> > > > +
> > > > +<dt>Not to do:</dt>
> > > > +<dd>
> > > > +<ul>
> > > > +<li> copy both virtio-dev and virtio-comment mailing lists
> > > > +(instead, pick one); <li> send full copies of the virtio spec (in any format).
> > > > +</ul>
> > > > +</dd>
> > > > +
> > > > +</dl>
> > > >  <h4>Note for TC Members</h4>
> > > >  <p>TC Members should review TC specific  process rules under
> > > > "Further Description of this Repository"
> > > > @@ -116,16 +147,43 @@ HREF="https://github.com/oasis-tcs/virtio-
> > > > admin">https://github.com/oasis-tcs/vi
> > > >
> > > >  </div>
> > > >  <h4>Implementation discussion</h4>
> > > > -Implementation discussion should take place on the <strong>virtio-
> > > > dev</strong> mailing list, -and be archived in the mailing list archives.
> > > > -<p>See <A
> > > > -HREF="https://www.oasis-
> > > > open.org/committees/tc_home.php?wg_abbrev=virtio#feedback">
> > > > -https://www.oasis-
> > > > open.org/committees/tc_home.php?wg_abbrev=virtio#feedback</A>
> > > > +Implementation discussion takes place on the
> > > > +<strong>virtio-dev</strong> mailing list, and is archived in <A
> > > > HREF="https://lore.kernel.org/virtio-dev/">the mailing list archives</A>.
> > > > +To participate in the discussion, subscribe by sending mail to
> > > > +<HREF="mailto:virtio-dev+subscribe@lists.linux.dev">
> > > > +virtio-dev+subscribe@lists.linux.dev</A>.
> > > > +After agreeing to the IPR, to participate in the discussion, send
> > > > +mail to <HREF="mailto:virtio-dev@lists.linux.dev">virtio-
> > dev@lists.linux.dev</A>.
> > > >  <p>This is the correct list to copy on Linux virtio UAPI change proposals.
> > > >  <p>Note that only the plain text part of the message is archived,
> > > > and all attachments are stripped. Accordingly, messages sent to the
> > > > mailing list should use text/plain encoding and not  have any attachments.
> > > > +
> > > > +<dl>
> > > > +<dt>When to use the virtio-dev mailing list:</dt> <dd>
> > > > +  questions and change proposals for Virtio drivers and devices
> > > > +  implementing the specification.
> > > > +</dd>
> > > > +
> > > > +<dt>When <em>not</em> to use the virtio-dev mailing list:</dt> <dd>
> > > > +  questions and change proposals for the Virtio specification,
> > > > +  including the specification of basic functionality, transports
> > > > +and
> > > > +  devices (please use the <A
> > > > +HREF="mailto:virtio-comment@lists.linux.dev">
> > > > virtio-comment mailing list</A> for this).
> > > > +</dd>
> > > > +<dt>To do:</dt>
> > > > +<dd>
> > > > + send email preferably in text format (best for archiving).
> > > > +</dd>
> > > > +
> > > > +<dt>Not to do:</dt>
> > > > +<dd>
> > > > +copy both virtio-dev and virtio-comment mailing lists (instead, pick one).
> > > > +</dd>
> > > > +</dl>
> > > > +
> > > >  <h4>Use of github issues</h4>
> > > >  Note: according to the virtio TC rules, all official TC
> > > > communication  is taking place on one of the TC mailing lists.
> > > > diff --git a/newdevice.tex b/newdevice.tex index 28e1c7b..ed0124b
> > > > 100644
> > > > --- a/newdevice.tex
> > > > +++ b/newdevice.tex
> > > > @@ -29,7 +29,8 @@ \section{What Device Configuration Space
> > > > Layout?}\label{sec:Creating New Device  \section{What Device
> > > > Number?}\label{sec:Creating New Device Types / What Device Number?}
> > > >
> > > >  Device numbers can be reserved by the OASIS committee: email
> > > > -virtio- dev@lists.oasis-open.org to secure a unique one.
> > > > +virtio-comment@lists.linux.dev (after subscribing through
> > > > +virtio-comment+subscribe@lists.linux.dev) to secure a unique one.
> > > >
> > > >  Meanwhile for experimental drivers, use 65535 and work backwards.
> > > >
> > > > --
> > > > MST
> > > >
> > > Reviewed-by: Parav Pandit <parav@nvidia.com>
> > >
> > > I see that patches are posted on virtio-comment for balloon device.
> > > Should community wait for this patch to be merged or ballot 3820 is good
> > enough to consider this new mailing list active?
> > 
> > I would wait until next Monday at least. Give everyone time to subscribe to
> > the new list.
> Yes, make sense to me. I assume you would merge this patch before
> that? or this also needs a vote?

Ideally a vote ... but I'm still working on fixing the voting system.
Let's see if I finish this work today.

-- 
MST

