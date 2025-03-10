Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E222309A6
	for <virtio-comment@lists.linux.dev>; Mon, 10 Mar 2025 17:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741628311; cv=none; b=EIRHnrZs23gIL/60z8zR7Z0pmTQ3rjFI99nj9v58HmdDjTSx3wAfjG2hq39366jFhLIipr636PDyKIW7Pm9Wux0BmYGGP8JjD0saZQVU5VJ3DssqOMwSDReXPsIpo/twTVuU7ULTzOGvssMM9iryqOc/L+Nn+vDQecEdBjvX7jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741628311; c=relaxed/simple;
	bh=/vum92axiqTBP0oqt2b3rP4RmzVDmLwOkJAdmdVJ9Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=PEbqXP/Afk54GBLKooWaQWtwDBluuLnU9k/DAUT2YMpGiQivt37jjhBpmQR9KE2PVCyxTrImIFIeNZsEzl8+/Upqsofu7qiXl/BIMOgUJdHka1HBLGIersx7oSq3sq2vjqHrs3ZR5K1D6DJwsq0VSFHtzkjU7wmiP44cmiU9k2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CwYnkiFR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CwYnkiFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741628308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jybWDQVJYDUlpDuCPexPFi0KxaZok1o0h9UlHApj8aI=;
	b=CwYnkiFRD21DjKJ+8IXWuRUHc0UosLB8m/rPKQigmNSi9uMmT7M5ELtfzuR/D7zRaEzdcS
	zzOGsAR3OR3LGmWqpNA494ABa+qVj7L0E8JGDwwPrdE0Z/R5j+TzSyEF73vs5aZcxVIGtZ
	Bewe9mmznHlaJamR3oejRNyVUXCyeVA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-TWtgl4AwOm2ZI78gWamSyQ-1; Mon, 10 Mar 2025 13:38:27 -0400
X-MC-Unique: TWtgl4AwOm2ZI78gWamSyQ-1
X-Mimecast-MFC-AGG-ID: TWtgl4AwOm2ZI78gWamSyQ_1741628306
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso4865635e9.3
        for <virtio-comment@lists.linux.dev>; Mon, 10 Mar 2025 10:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741628306; x=1742233106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jybWDQVJYDUlpDuCPexPFi0KxaZok1o0h9UlHApj8aI=;
        b=t/2bCfz8QdyHCsB2kNroabjiM9AS8/lZjkuphjdEJuswWrGf+ZiSXgujedrr6yy5i3
         AtgtHxFKQCrqAuCDv0XO1Fwrz0syDdmoh08Scl7FCeb/86T6qCljg/IPDotJbvB1JwrY
         mYJdxnQ3vadb8Yc4pf07JMYp+FImCJBBnPZqhnEKaHjA6Ma8Iw+ajQYL3jdiUGLHC2D1
         O93nzuzcp92C6uXd2U7pt8DwGyUXSNSVz3bIIKGCRdC34gCw+YhSnM4hm6nqIPH4lVIM
         ZXG64BhQWbOjgtWggtYt9cQEWX5AMPeJ+WDHJtoLmDJmCybFxjrIIy2ShUHTILAaYmJd
         OVuA==
X-Forwarded-Encrypted: i=1; AJvYcCXm9XchEpy0XpjKZnY36v6HZbMIHpzYwQeBpwcMkGuB3qpOTZBctOT0rmEOsjT0SfZlDK0iBg/FuNxSuKaDUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxD+zam4RWPy2yE+RHZV0ERiWbdZkjLrbGlk7bb9ZT8opZdlcSF
	HlDShOU50JMIjUbs20V3yEgpXEjbgKFYER1nwCESz8VgZ1ltnDiBnoCKOrVnggtPME4DU7Gfaon
	OOZ7N4bnYSBV10YhnQ1n38rA/uMRyVznEOn35F6gwG0hE9rVeYwBzvgxU3zqPlknJ
X-Gm-Gg: ASbGncuSB/7w07GAlfolXcOfHhGNgfYgVu0gRz+lNqSx+am0FzYqlEnpAb2s0CexjFt
	YavVTpKsqoI8D7z5yaUVMCgAwrA+2RlluuZ7hHjIdqQ8tMuUnJxbzHiFW/7zrJwzziYZSIZf3J2
	W+St35Cg4+2JeSOeXkztKY+3ochLaBBygt3tmiVsz5cKis9PIrDV5KPvCPHL89JDHbP+UIAYeMs
	1JjuYSPC8FIqvsR0VKS3JSnte/BokC64+XxaiqZCvXFr8bRlbKz6QQzgSESGTRi3NP+YDmm4yOr
	YZBsVRQL+g==
X-Received: by 2002:a05:600c:1c9d:b0:43a:b8eb:9e5f with SMTP id 5b1f17b1804b1-43c601cfd25mr90422495e9.3.1741628305705;
        Mon, 10 Mar 2025 10:38:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4mJOYVElMNs9nw/9jz3mTFZBDQvWyOK1Vq6DWdRiTxO9fPWtU+/vnbISyQW2Aa4iW3vTs5w==
X-Received: by 2002:a05:600c:1c9d:b0:43a:b8eb:9e5f with SMTP id 5b1f17b1804b1-43c601cfd25mr90422175e9.3.1741628305212;
        Mon, 10 Mar 2025 10:38:25 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0195bfsm15491865f8f.48.2025.03.10.10.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 10:38:24 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:38:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: [PATCH v2] README.md: add example email for TC vote request
Message-ID: <20250310133808-mutt-send-email-mst@kernel.org>
References: <20250227150241.1274768-1-mvaralar@redhat.com>
 <CY8PR12MB71951BEE03E73E7CF1715A91DCCF2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <Z8bnpjiYpmiFH7+7@fedora>
 <87h641uihz.fsf@redhat.com>
 <20250310095206-mutt-send-email-mst@kernel.org>
 <Z88MLorN4afEuN/V@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Z88MLorN4afEuN/V@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3nw2xOERZY08VdqJSdONmaudgKrtAvsg4TjstSFdqow_1741628306
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 10, 2025 at 04:58:38PM +0100, Matias Ezequiel Vara Larsen wrote:
> On Mon, Mar 10, 2025 at 09:55:09AM -0400, Michael S. Tsirkin wrote:
> > On Mon, Mar 10, 2025 at 02:23:36PM +0100, Cornelia Huck wrote:
> > > On Tue, Mar 04 2025, Matias Ezequiel Vara Larsen <mvaralar@redhat.com> wrote:
> > > 
> > > > On Sat, Mar 01, 2025 at 06:08:32AM +0000, Parav Pandit wrote:
> > > >> 
> > > >> 
> > > >> > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > >> > Sent: Thursday, February 27, 2025 8:33 PM
> > > >> > 
> > > >> > Acked-by: Cornelia Huck <cohuck@redhat.com>
> > > >> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > >> > ---
> > > >> > v1 -> v2: add Subject and To
> > > >> > ---
> > > >> >  README.md | 11 ++++++++++-
> > > >> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > >> > 
> > > >> > diff --git a/README.md b/README.md
> > > >> > index c06caf6..731838b 100644
> > > >> > --- a/README.md
> > > >> > +++ b/README.md
> > > >> > @@ -206,7 +206,16 @@ The mail requesting the vote should include the
> > > >> > following, on a line by itself:<  <code>
> > > >> >  Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
> > > >> >  </code>
> > > >> > -(NNN is the issue number)</li>
> > > >> > +(NNN is the issue number)<br>
> > > >> > +For example, you can use the following template when requesting the TC
> > > >> > +vote:<br> <code>
> > > >> > +Subject: PATCH [description of changes]<br>
> > 
> > No this is wrong. It is
> > 
> > Subject: [PATCH] <description of changes>
> > 
> > or if you want to be more specific:
> > 
> > Subject: [PATCH v<version>] <spec area>:<description of changes>
> > 
> > 
> 
> The `<` and `>` characters are not correctly parsed by the markdown
> editor. I will replace them with `&lt;` and `&gt;` in v3.
> 
> Matias


just use () I think.

