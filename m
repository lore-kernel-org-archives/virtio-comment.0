Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F51205ACE
	for <virtio-comment@lists.linux.dev>; Wed,  5 Mar 2025 09:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741168602; cv=none; b=uXXCbuY4gSkm6KZaYJe5sCX+4gJX5FONLCTKx0HWch86MZ+d5wB5Li7BM5LXrTPmmR7MS8Nb71ztXGjQKivSAoqMAhli6WISM4SxDV79S90/cjj71R8YSbyFA1Ntp08olbjMVmxTsksUdsaF7ib5QQn34cpl9p4o7EYF7F7+tEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741168602; c=relaxed/simple;
	bh=oOYFhkcH9Baf6suU79SckC0Fwlf6crQd0mUDJ5l9rw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=T1Y0H4DviIRvCnyOfFkNUc5vNjbpRwbvkK40+F2xWnc2fctPQPd3Rs7fc4CqUS6QDTVJwu4sgvcDygV+h4bCRmGvwTAUblmcV25UfV47UmELYwCSk4oe8I4CitpUuuzzeY1gn9u8Sf9ZV4EKH5m29d7SNUj5G0nmKLMbyIVTHtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cIWVgyAi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cIWVgyAi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741168599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4yy13n+XU4UR2oEjqvjqFtwrj19OFa3iDhilcDFOCDI=;
	b=cIWVgyAiahv5G/5hlR2aQp/6nXFgLgENom3m+VgUPFGHeIz6P+M7bev5k9OCZAqYPjWqNO
	0FD2Sj4XmVgGe+QwkpUMAx6aj/rTcGIt9QJqpggTHP3kXotNAre9kHDX61h/xXusGyE6c4
	Ez1ZnX+exT8TyW2kEKuhLvSRTJLf1EA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-lQqx1rIeM0SDncCNVMS5mw-1; Wed, 05 Mar 2025 04:56:38 -0500
X-MC-Unique: lQqx1rIeM0SDncCNVMS5mw-1
X-Mimecast-MFC-AGG-ID: lQqx1rIeM0SDncCNVMS5mw_1741168597
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43bcde3f887so10523535e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 05 Mar 2025 01:56:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741168597; x=1741773397;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4yy13n+XU4UR2oEjqvjqFtwrj19OFa3iDhilcDFOCDI=;
        b=rjbqSimeh6e1SyVZVCnKUUeFBpkCGww22KyUvQ6lJEVfrKthe4vCSBzeQ962a04Irn
         Sdz5Nl8Qb9ras294IA9ceTfsZmRIjyKXn/iFeQyn4CjVl4sC3PICLyz7f42NzkhJYj32
         tU+wVFYMvzDQob2dz1LbR4+vurKo+xjYTuB7+Ej87f4Nc+pEjA1xEvfTisxurTtIA83y
         4ndMTimG74IL3POrppGaFaVmWv/5LSDJQlc/p3Ep1CXm5mG78Hu7xfGRdJF5erg2KcOF
         hVWtc3n/J+0fb/grXs3e+jPrtew0phZ0Skwikahq3TBkcz3iQbI170IqfA7snt0a2RyN
         w0HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWANH00+zfU8sH80TlJ9Kajc7immhvOzjOB/UkS2tRXeHvz3RwyUbx+LHBEXqqgweWhEbu2LIfSUfiIcx/BMw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yybj2LC2WMehRVvZANlivxl9n4TscMwxGteBpH1NIQZ7J8raCvw
	hbCURx4gWHJFCVRx4hriy5DjYCUEduF5E+pvWC1nWVFy5kCgEtJpUJ2Gqj8PuZv9MniCn8ZwMmY
	EP5utbxhqYbxa+OlZL67xEdcyAJ/k98TkaTcVISLcG3SPzaOvHDeIk6kuDx0ml+Jc
X-Gm-Gg: ASbGncvbe77/rW5aMp4GYw5XRyZwIeWjTQZWVYr62VR8Szqp40NQHlwS+Izfuztm99H
	T/D0WcGAqZsOOOQBFFrUy6c0fwtuIfyskdB/FsUGZ5mw23r5zjB1mAjRdZymBvOIYDdaXI0Vi7G
	3t2FwBCgBtWJzOkZf4dJeNA9i8qo29+cBD+Jda6TAZ0n3WG4FeH1DgGNLUtSpOySs0jDbxKXyki
	qZPc0d+tLAdy7Qk/akk4OLnECRk7WYgbl2fT/jteF7lUE8GTxDSwYdPIOPafDmruX/hwH6x3Phb
	W6BrWqiRkA==
X-Received: by 2002:a05:600c:198f:b0:43b:cf37:c7ed with SMTP id 5b1f17b1804b1-43bd294bb74mr13285855e9.1.1741168596792;
        Wed, 05 Mar 2025 01:56:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQwFVWjYvCSzqBcHMTv0RGn61otSkFXmkZGqF6mqQx6j6Bl/lQpgB4KZHzYGrzCp44255K7w==
X-Received: by 2002:a05:600c:198f:b0:43b:cf37:c7ed with SMTP id 5b1f17b1804b1-43bd294bb74mr13285635e9.1.1741168596393;
        Wed, 05 Mar 2025 01:56:36 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd435cc67sm12328855e9.39.2025.03.05.01.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 01:56:35 -0800 (PST)
Date: Wed, 5 Mar 2025 10:56:34 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Albert Esteve <aesteve@redhat.com>, virtio-comment@lists.linux.dev
Subject: Re: [PATCH] git-publish: add profile
Message-ID: <Z8gf0kvjkQCwwbJ9@fedora>
References: <20250304161113.1445602-1-mvaralar@redhat.com>
 <CADSE00JHFcsg2vHVOymDd9pawbGWPiBOpZ1guRivAOOOK33xKQ@mail.gmail.com>
 <CAGxU2F6+5MHvEyLbOFnQNf9jY=LNq7krhQD+TjJDPj8raZd+Mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAGxU2F6+5MHvEyLbOFnQNf9jY=LNq7krhQD+TjJDPj8raZd+Mw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3NMr1SVYP45d8aokhwYqtbghgijcCzvwT2dpxGluy10_1741168597
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Mar 05, 2025 at 09:21:11AM +0100, Stefano Garzarella wrote:
> On Wed, 5 Mar 2025 at 09:12, Albert Esteve <aesteve@redhat.com> wrote:
> >
> > On Tue, Mar 4, 2025 at 7:47 PM Matias Ezequiel Vara Larsen
> > <mvaralar@redhat.com> wrote:
> > >
> > > Add git-publish profile and document how to use it.
> > >
> > > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > ---
> > >  .gitpublish | 3 +++
> > >  README.md   | 9 +++++++++
> > >  2 files changed, 12 insertions(+)
> > >  create mode 100644 .gitpublish
> > >
> > > diff --git a/.gitpublish b/.gitpublish
> > > new file mode 100644
> > > index 0000000..d412896
> > > --- /dev/null
> > > +++ b/.gitpublish
> > > @@ -0,0 +1,3 @@
> > > +[gitpublishprofile "default"]
> > > +base = master
> > > +to = virtio-comment@lists.linux.dev
> > > diff --git a/README.md b/README.md
> > > index c06caf6..39f22d4 100644
> > > --- a/README.md
> > > +++ b/README.md
> > > @@ -110,6 +110,15 @@ git format-patch -o proposal1/ HEAD~1..<br>
> > >  git send-email --to=virtio-comment@lists.linux.dev proposal1/0001-*
> > >  </code>
> > >
> > > +<dl>Optionally, you can use git-publisher to submit a patch. The procedure is the following:
> >
> 
> I would mention that the project already has a git-publish profile, so
> the "To:" address is automatically handled by it.

Thanks.

> 
> > s/git-publisher/git-publish/ ?
> >
> > Maybe even worth adding a link to the project repository?
> > ```
> > \href{https://github.com/stefanha/git-publish}{git-publish}
> > ```
> 
> +1
> 
> > Especially since you need to install and set up the tool beforehand,
> > so it is nice to have the link pointing to the project documentation.
> >
> > > +<code>
> > > +git checkout master -b my-feature<br>
> > > +# work on new commits, add your 'Signed-off-by' lines to each<br>
> > > +git publish<br>
> >
> > The first run (unless you pre-configure your profile in the project
> > git config) needs to specify the recipient (with --to) and and cc's.
> > I'd add at least the `--to` to the example.
> 
> IIUC the goal of this patch is also to add a profile (.gitpublish) in
> the project exactly to avoid that.

Right, I will clarify that in v2.

Thanks, Matias.

