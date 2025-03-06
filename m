Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A70209F22
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 09:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741254034; cv=none; b=Kan9/6Mzk0ZiS5DdBMGmWKuyPzZYauKjPDTOWJ3jgH/ETzum1aCaXUbGt6ICDAnAIFhm6jQ0E/00BBYPtkb4mmUrTcPxiVpjffU+7fKoSzR4TWDbrJ5eWBpW73q47s8LP2k5MAhma1Cf6MWCbkiXoYt+EEOW/rcw1iYnd5CfaOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741254034; c=relaxed/simple;
	bh=/QcqwID5p/SbKFzXwrLL07KnFK2bZVDUTmXhyQQ+rYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jW6qsKeNIiT5pObu/JgUb5XC2v3ZEvKIycyJc4nimh9pY8Gntj/WSrHd4vnN8vx0HB0JfxPHNesE/FcD2opSDIdutaatHky7t/gnCtff2a8CGNWJqqYxhYDvFJHcRwG7Cg11gTdsQubySSIexYzMzZxPFxXkV/gqwnziNhQSPkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ARYDNiBT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ARYDNiBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741254030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UOCfUGF5mH1Vk6Lnte+nx2T56ZWvupsZPtkp2kU3pXA=;
	b=ARYDNiBTFbrABrU8H/k8aBmyMFfaOY1HVBvBLgzW3XSn0RCTQbRrd4CuiqaGuKZt1rJGVP
	H+4lRArNzM6CHF/e1HvLPKcUQr5qUYFZ+ZyO2Bc3nqt7LgUTqt9q7f2kfqKzSP8u0emHDz
	RzP6d081TIaoHHgP5pE83+0j5T1ACn4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-pZVvO4ovNmas66wOcg80Lg-1; Thu, 06 Mar 2025 04:40:24 -0500
X-MC-Unique: pZVvO4ovNmas66wOcg80Lg-1
X-Mimecast-MFC-AGG-ID: pZVvO4ovNmas66wOcg80Lg_1741254022
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-390f11e6fdbso215830f8f.0
        for <virtio-comment@lists.linux.dev>; Thu, 06 Mar 2025 01:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741254022; x=1741858822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOCfUGF5mH1Vk6Lnte+nx2T56ZWvupsZPtkp2kU3pXA=;
        b=KlcYzdYWT4etIC6/h0NbwQpdaeJBYZBddYZQmKIDXWG/GEXAOD90iZw8CL0Roh0w5s
         Yb599haD/Bgk1YvtG/yUfLfMDukbaHVSiwYEUgIt68DCYJr4XGULotaJdDKbvpYe1flr
         1lfpblwWlybcSUlaz/+n1WmSA8vtlZsEW/WFhAiGhVaRKUz+vEp10M3tw+eldfBlM1hw
         Jnpp+4WAXxTgs71alN/QYCY8KCcMPGtzCFFk+5nIR779iros1i9TA6/hE/pZQ8um0K5c
         YX5K1rvEmLSza+WADim93jKhMdWYoMNdSULWY4y5NA4P0l/PtM7jhnvet5aQVNIQxRPI
         nCrA==
X-Gm-Message-State: AOJu0YwTQUfho+CkdDCjhkw1GOVNlpUoRZbnZqzzbIqbnjoyDemvA+kG
	7dBwafVsdOgL3j11tgIWm9ciWXxreY5NxQGOIE17v8L+tk8k5bsL07pTSvXqtqkrXijTqWgfehW
	HpE0vS/fosMOgIeu3aPeUj15O8XcjPU+i9QGqvJKJUu5FBhZBYZPn9vXMlh/vnQuObOhCWwjZ
X-Gm-Gg: ASbGnctK36enB5bcK3C4Z+mSgvRbM7Yh0Y4HGP3pt5WOhbVqm+hN2XXDYbXw/lEpg0Y
	Zh3LS/TJcYbaaOP4tZP3cs1UGCCOdyUrKJJ+IDTUdPBNFo+9tB9BBphBwNesYK9t1oPnUqnJ//Z
	ssJ8g6Wr4OTr1/noHFbwm36nZ6kBYUSLrJ0XwiPhZ69la1+qhJVxDZSkdnGNxr/ZTa+MdNMnx89
	/2X3KfDUIV/sOBdruYycv3vPoQXqbi6IGV3ch3OUiWDCvRMiTUVXysr11DKJrlRtCRIy9cG3vvf
	NaKVNyJCbA==
X-Received: by 2002:a05:6000:2d0b:b0:391:2b04:73d9 with SMTP id ffacd0b85a97d-3912b048fe8mr1073999f8f.49.1741254022043;
        Thu, 06 Mar 2025 01:40:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRCyQD/swEARHWkCm1/1IGyxMr+4g8we7wGj77OQxBPU7QzxQ0dvoCTgv2MfeGL/SrB6O+lw==
X-Received: by 2002:a05:6000:2d0b:b0:391:2b04:73d9 with SMTP id ffacd0b85a97d-3912b048fe8mr1073987f8f.49.1741254021639;
        Thu, 06 Mar 2025 01:40:21 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79adsm1463810f8f.7.2025.03.06.01.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 01:40:21 -0800 (PST)
Date: Thu, 6 Mar 2025 10:40:19 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.linux.dev, aesteve@redhat.com, sgarzare@redhat.com
Subject: Re: [PATCH v3] git-publish: add profile
Message-ID: <Z8ltg4gt4H/u+glb@fedora>
References: <20250305164546.1484029-1-mvaralar@redhat.com>
 <20250306052231.GE303194@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250306052231.GE303194@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xR-QlZ33XkbSd4duTKnnstanTARUC87W8DlybZi2N1s_1741254022
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 06, 2025 at 01:22:31PM +0800, Stefan Hajnoczi wrote:
> On Wed, Mar 05, 2025 at 05:45:46PM +0100, Matias Ezequiel Vara Larsen wrote:
> > Add git-publish profile and document how to use it.
> > 
> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > ---
> > v2 -> v3:
> >    * remove uppercase and the line split and use italic 
> > v1 -> v2:
> >    * add link to git-publish
> >    * document that the project contains a profile already
> > ---
> >  .gitpublish |  3 +++
> >  README.md   | 15 +++++++++++++++
> >  2 files changed, 18 insertions(+)
> >  create mode 100644 .gitpublish
> > 
> > diff --git a/.gitpublish b/.gitpublish
> > new file mode 100644
> > index 0000000..d412896
> > --- /dev/null
> > +++ b/.gitpublish
> > @@ -0,0 +1,3 @@
> > +[gitpublishprofile "default"]
> 
> Great, this will make it easier to send spec changes!
> 
> > +base = master
> > +to = virtio-comment@lists.linux.dev
> 
> From https://github.com/oasis-tcs/virtio-spec?tab=readme-ov-file:
> 
>   When not to use the virtio-comment mailing list:
>     questions and change proposals for Virtio drivers and devices
>     implementing the specification. (please use the virtio-dev mailing
>     list for this).

Are you proposing to add a comment in the .gitpublish to warn when the
virtio-comment list must not be used?

Thanks.

> 
> This also matches what I found in my .git/config where gitpublishto was
> set to virtio-dev rather than virtio-comment.
> 
> > diff --git a/README.md b/README.md
> > index c06caf6..b521978 100644
> > --- a/README.md
> > +++ b/README.md
> > @@ -110,6 +110,21 @@ git format-patch -o proposal1/ HEAD~1..<br>
> >  git send-email --to=virtio-comment@lists.linux.dev proposal1/0001-*
> >  </code>
> >  
> > +<dl>Optionally, you can use <a
> > +href="https://github.com/stefanha/git-publish">git-publish</a> to submit a
> > +patch. This project already contains a <em>git-publish</em> profile that will
> > +configure some fields, e.g., <em>To</em> field with the right address. After you have
> > +installed <em>git-publish</em>, the procedure is the following:
> > +
> > +<code>
> > +<p>
> > +git checkout master -b my-feature<br>
> > +# work on new commits, add your 'Signed-off-by' lines to each<br>
> > +git publish<br>
> > +# more work, rebase on master, ...<br>
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


