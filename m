Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1752A1FFC56
	for <virtio-comment@lists.linux.dev>; Wed,  5 Mar 2025 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741168274; cv=none; b=L8JjOkEZuFNKBrmwGURzefdQM0auK+NQL71s909py7dkqYRPCZd1VcLKGnBsBzku8KYx4WwVg+JiKr7iNrVBb8GXEbf3/Zvq4gonoejC3KaSMtGEMRj4qmWqpCS5/JBuFwJgzhw+3b2IaayqS2+Ry9BKdgIvTEWAWr4dTLBYRKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741168274; c=relaxed/simple;
	bh=AOkIr0n3JywZGiVZZEoTXdAhdF/RIvwZeoNFcENMJGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=WtyVtSeIsFwUdXG7o1tplQ9N14Zk9L0+RX2u+WnhrS4g3s26X8KREAd9gM8PISdO3XAHSEyWKb4f5hEOTvXU+9GrVn6kUTalSYF+1hhL0RHmKhrf2mHDmubqSvo2r41f5MqDlb9DPF71xLe4eAGwE0gR0lhMgRQL4NgF00nzlG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cGP6jefm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cGP6jefm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741168271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zaCkc8HRipCjfFJHe17SGiWLmkJVl71B/3p0QG5NObc=;
	b=cGP6jefml705NPeHSkTFO4I3SZZDaftqjbEpMi76JulAcOib6dWQfCCfaq8ep7TISRo3FA
	oYEZd3ELVEdveCshFJx2PjGGgbD8Fw2Xgy4eScjWWu3yM5MIfzPqEa2/9Fx4Cx/QE2e4yL
	dXw6Ja9WSqKSKm6fdVd26U025vvpiP8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-mxxeJhDKNs-szW-M5y3dmw-1; Wed, 05 Mar 2025 04:51:10 -0500
X-MC-Unique: mxxeJhDKNs-szW-M5y3dmw-1
X-Mimecast-MFC-AGG-ID: mxxeJhDKNs-szW-M5y3dmw_1741168269
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-390eefb2913so3533614f8f.0
        for <virtio-comment@lists.linux.dev>; Wed, 05 Mar 2025 01:51:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741168268; x=1741773068;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zaCkc8HRipCjfFJHe17SGiWLmkJVl71B/3p0QG5NObc=;
        b=CxXc3aP71w/PW18T5Sa1UQdouo9C7aWe2UPiZrVSqs7PsyODNhgHzlLUh8irwvPHwe
         fP1SKDn246kJ955mED3MfxUUvdz5gWbsF4XmjNu9cEut0BsUYsoMU1FIDNItYlG5D3S4
         PpGC63yfAalP5YCQVK4Maws4J4JyTV7Brcyc1hTNijsmrzKc6rVpmShJvEjBtnPeSJye
         tXb7cyrrU0UlVB3tAzT1yzMaIgkcozOOvDRl2uJeP5b2ytYp0XKUq9byW2MWAz5Qa95j
         L2dZRspUsRs/wLZWdDsZICG/9GZ4YhjmGP6lArPMAZ2Y0MZbLcSmHVjGYysBvgLbetZB
         roxQ==
X-Gm-Message-State: AOJu0YzZW3ssFS8NDeK/pDpZUSyw7rIFj2judTWHLIusZOQkUbEWvVZ0
	4iTmNMxteN4L48OGKjOXdWj7b5w8ERasjeeSd4jejmiO7Nsh3j0GAazbosiv8l5VoUJ46Lvwgko
	6bh7TN3Xpq5mrb2NkMgJG918mJzRV/tJ4Oz9id0/naxY4mTjEvEzHDlzia9X0owN4y5qys0Bl
X-Gm-Gg: ASbGncviB7xAa3+kQIBUuGIIykfpejjOyZ9eN2mkE1GP4CrHXhIlNKbLjoADqe96ub4
	PF9PyKwK1A9qN3o6u3JhKYR/oQZjkilqxubD/STYmjwvfE7N5pielM245Xst+ShEaPE8i+kHP7y
	OfZPA+pK8m08w1GRHmdURqopHlrs+78JBgFxp17JKxWRmh9VEboCIk5k6lZjGljU1XA+9ysfLc+
	EXSgrXhq9qHMNIHWPeFSm+xDsakuFqoAp5gMgLW43+molGkSvxESm0y8GTVs5pdVoUqmeJOjP31
	Tw+PCKtIFg==
X-Received: by 2002:a5d:59a5:0:b0:390:f1c1:d399 with SMTP id ffacd0b85a97d-3911f7bb9b8mr1893512f8f.41.1741168268700;
        Wed, 05 Mar 2025 01:51:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+WSOIjX0ZSG6b1MdkagzpoOplD5WCdIbnKkve5hPyXXiP8xNf84VJ0VyfCU6wO16H/YHx+Q==
X-Received: by 2002:a5d:59a5:0:b0:390:f1c1:d399 with SMTP id ffacd0b85a97d-3911f7bb9b8mr1893492f8f.41.1741168268360;
        Wed, 05 Mar 2025 01:51:08 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd435cd8csm12319635e9.40.2025.03.05.01.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 01:51:08 -0800 (PST)
Date: Wed, 5 Mar 2025 10:51:06 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH] git-publish: add profile
Message-ID: <Z8geil7uaB4UAF7m@fedora>
References: <20250304161113.1445602-1-mvaralar@redhat.com>
 <CADSE00JHFcsg2vHVOymDd9pawbGWPiBOpZ1guRivAOOOK33xKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CADSE00JHFcsg2vHVOymDd9pawbGWPiBOpZ1guRivAOOOK33xKQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RXbERhYg9QfvnEjnEo5OxupL4YXi46t5dbC9pfLDb94_1741168269
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Mar 05, 2025 at 09:04:59AM +0100, Albert Esteve wrote:
> On Tue, Mar 4, 2025 at 7:47 PM Matias Ezequiel Vara Larsen
> <mvaralar@redhat.com> wrote:
> >
> > Add git-publish profile and document how to use it.
> >
> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > ---
> >  .gitpublish | 3 +++
> >  README.md   | 9 +++++++++
> >  2 files changed, 12 insertions(+)
> >  create mode 100644 .gitpublish
> >
> > diff --git a/.gitpublish b/.gitpublish
> > new file mode 100644
> > index 0000000..d412896
> > --- /dev/null
> > +++ b/.gitpublish
> > @@ -0,0 +1,3 @@
> > +[gitpublishprofile "default"]
> > +base = master
> > +to = virtio-comment@lists.linux.dev
> > diff --git a/README.md b/README.md
> > index c06caf6..39f22d4 100644
> > --- a/README.md
> > +++ b/README.md
> > @@ -110,6 +110,15 @@ git format-patch -o proposal1/ HEAD~1..<br>
> >  git send-email --to=virtio-comment@lists.linux.dev proposal1/0001-*
> >  </code>
> >
> > +<dl>Optionally, you can use git-publisher to submit a patch. The procedure is the following:
> 
> s/git-publisher/git-publish/ ?
> 

Thanks.

> Maybe even worth adding a link to the project repository?
> ```
> \href{https://github.com/stefanha/git-publish}{git-publish}
> ```

I will add the link to the project.

> Especially since you need to install and set up the tool beforehand,
> so it is nice to have the link pointing to the project documentation.
> 
> > +<code>
> > +git checkout master -b my-feature<br>
> > +# work on new commits, add your 'Signed-off-by' lines to each<br>
> > +git publish<br>
> 
> The first run (unless you pre-configure your profile in the project
> git config) needs to specify the recipient (with --to) and and cc's.
> I'd add at least the `--to` to the example.

The patch includes a gitpublish profile to avoid configuring the `to`
email. Maybe I can add that the goal of using gitpublish is to simplify
the steps above.

> 
> > +... more work, rebase on master, ...<br>
> > +git publish # will send a v2<br>
> > +</code>
> > +</dl>
> >  <dl>
> >  <dt>When to use the virtio-comment mailing list:</dt>
> >  <dd>
> > --
> > 2.42.0
> >
> >
> 

